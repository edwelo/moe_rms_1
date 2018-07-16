<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

$db_host = "mysql.moe"; $db_user = "mysql"; $db_pass = "mysql";
if($_SERVER["REMOTE_ADDRESS"] == "127.0.0.1" || $_SERVER["REMOTE_ADDRESS"] == "::1") {
	$db_host = "localhost";
}
$db = new mysqli($db_host, $db_user, $db_pass);

$rqTable = "finance3.requisitions";
$rqItemsTable = "finance3.requisitions_items";
$vendorTable = "finance3.vendors";
$staffTable = "personnel.tblbiodata";

if($_GET["a"]) {
	$tmp["fld1"] = "fld1";
	$tmp["fld2"] = "fld2";
	echo "
<form action='' method=post>
	Use this to test post:
	<input type=text name=RequisitionId value=5 />&nbsp;&nbsp;
	<input type=text name=Data value='" . json_encode($tmp) . "' />&nbsp;&nbsp;
	<input type=submit value=post />
</form>
<br />
<br />
	";
}

unset($rqId);
if($_GET["requisitionId"] == "new" || is_numeric($_GET["requisitionId"])) $rqId = $_GET["requisitionId"];

if(isset($_GET["save"])) {

	if($_GET["a"]) {
		echo "json from \$_GET[\"save\"]:<br /><br />\n" . $_GET["save"] . "<br /><br />\n";
	}

	if(isset($_POST)) {
		$save_arr = json_decode(file_get_contents('php://input'));
		#echo "post_got_this_" . json_encode($save_arr);
		#echo "<pre>"; print_r($save_arr); echo "</pre>"; exit;
	} else {
		echo "POST_NOT_RECEIVED!";
		exit;
	}

	if($_GET["a"]) {
		echo "array from json:<br /><br />\n";
		echo "<pre>"; print_r($save_arr); echo "</pre>";
	}

	//build rq sql

	$rqId = $save_arr->requisitionId;
	unset($save_arr->requisitionId);
	$items = $save_arr->items;
	unset($save_arr->items);

	$sql = "";
	foreach($save_arr as $key=>$value) {
		if($value) {
			$sql .= "${key} = \"" . mysqli_real_escape_string($db, $value) . "\", ";
		} else {
			$sql .= "${key} = null, ";
		}
	}
	$sql = trim($sql, ", ");

	if(!$rqId) {
		$sql = "INSERT INTO ${rqTable} SET ${sql}";
	} else {
		$sql = "UPDATE ${rqTable} SET ${sql} WHERE requisitionId=" . $rqId;
	}

	//code testing, delete for production
	$save_activity .= "$sql\n";

	//save rq

	if($_GET["a"]) echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br />\n";
	#$db->query($sql) or die("RQ Insert Error: " . $db->error . "<br />\n<code>${sql}</code>\n");

	$db->query($sql) or die("RQ_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	if(!$rqId) {
		$rqId = $db->insert_id;
		if($_GET["a"]) echo "New rqId: ${rqId}<br />\n";
	}

	//save requisition items

	if($_GET["a"]) echo "<br />RQ Items SQLs:<br />\n";

	$item_number_fields = array("quantity", "price", "extended", "rcvQuantity", "rcvPrice");

	foreach($items as $row) {
		$itemId = $row->requisitionItemId;
		$del = $row->del;
		unset($row->requisitionItemId, $row->del);
		$sqlData = " SET ";
		foreach($row as $key=>$value) {
			$sqlData .= $key . " = ";
			if($value) {
				if(in_array($key, $item_number_fields)) {
					$sqlData .=  1 * $value . ", ";
				} else {
					$sqlData .= "\"" . mysqli_real_escape_string($db, $value) . "\", ";
				}
			} else {
				$sqlData .= "null, ";
			}
		}
		$sqlData = trim($sqlData, ", ");

		if(!$itemId && $del != 1) {
			//items to insert
			$sql = "INSERT INTO ${rqItemsTable} " . str_replace("SET ", " SET requisitionId = ${rqId}, ", $sqlData);

			//code testing, delete for production
			$save_activity .= "$sql\n";

		} else if(is_numeric($itemId) && $del != 1) {
			//items to update
			$sql = "UPDATE ${rqItemsTable} " . $sqlData . " WHERE requisitionItemId = ${itemId}";

			//code testing, delete for production
			$save_activity .= "$sql\n";

		} else if(is_numeric($itemId) && $del == 1) {
			//items to delete
			$sql = "UPDATE ${rqItemsTable} SET isValid = \"x" . date("ymdHi") . "\" WHERE requisitionItemId = ${itemId}";

			//code testing, delete for production
			$save_activity .= "$sql\n";

		}

		if($_GET["a"]) "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br /><br />\n";

		$db->query($sql) or die("RQ_Item_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	}

}

if($rqId && is_numeric($rqId)) {

	//one rq

	$sql = "
		SELECT
			a.*, CONCAT(c.fname, ' ', c.lname) AS preparedByName,
			b.vendorName, d.description,
			SUM(IF(d.requisitionId, 1, 0)) AS numItems,
			SUM(ROUND(d.quantity * d.price, 3)) AS rqAmount
		FROM
			${rqTable} a LEFT JOIN
			${vendorTable} b ON a.vendorId=b.vendorId LEFT JOIN
			${staffTable} c ON a.preparedById=c.persid LEFT JOIN
			${rqItemsTable} d ON a.requisitionId=d.requisitionId AND d.isValid NOT LIKE 'x%'
		WHERE
			a.isValid NOT LIKE 'void%' AND
			a.requisitionId=" . $_GET["requisitionId"];
	$rs = $db->query($sql) or die($db->error);
	$data["rq"] = $rs->fetch_assoc();

	//items for the one rq

	$sql2 = "SELECT * FROM ${rqItemsTable} WHERE requisitionId = " . $_GET["requisitionId"] . " AND isValid NOT LIKE 'x%'";
	$rs = $db->query($sql2) or die($db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) { $data["rq"]["items"][] = $tmp; }
	}

	$sql .= "<br />" . $sql2; //for debugging when a=1, see end this file

} else {

	$sql = "
	SELECT
		a.*, CONCAT(c.fname, ' ', c.lname) AS preparedByName,
		b.vendorName, d.description AS itemDescription, SUM(IF(d.requisitionId, 1, 0)) AS numItems,
		SUM(ROUND(d.quantity * d.price, 3)) AS rqAmount
	FROM
		${rqTable} a LEFT JOIN
		${vendorTable} b ON a.vendorId=b.vendorId LEFT JOIN
		${staffTable} c ON a.preparedById=c.persid LEFT JOIN
		${rqItemsTable} d ON a.requisitionId=d.requisitionId
	WHERE
		a.isValid NOT LIKE 'void%' AND d.isValid NOT LIKE 'void%'
	GROUP BY a.requisitionId
	";
	$rs = $db->query($sql) or die($db->error);
	while($tmp = $rs->fetch_assoc()) {
		$data["rqlist"][] = $tmp;
	}

}

if(isset($_GET["a"])) {
	echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br />\n";
	echo "<pre>"; print_r($data); echo "</pre>";
} else {

	//code testing, delete for production
	#if($save_activity) $data["save_activity"] = $save_activity;

	$myJSON = json_encode($data);
	echo $myJSON;
}

?>