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

if(isset($_GET["save"])) {
	$save_arr = json_decode(trim($_GET["save"]), true);
	
	if($_GET["a"]) {
		echo "json from \$_GET[\"save\"]:<br /><br />\n" . $_GET["save"] . "<br /><br />\n
		json_decode(\$_GET[\"save\"]):<br />\n";
		echo "<pre>"; print_r($save_arr); echo "</pre>";
	}

	//build rq sql
	
	$rqId = $save_arr["requisitionId"];
	unset($save_arr["requisitionId"]);
	$items = $save_arr["items"];
	unset($save_arr["items"]);
	
	$sql = "";
	foreach($save_arr as $key=>$value) { 
		$value = mysqli_real_escape_string($db, $value);
		$sql .= "${key} = \"${value}\", "; 
	}
	$sql = trim($sql, ", ");
		
	if($rqId == "new") {
		$sql = "INSERT INTO ${rqTable} SET ${sql}";
	} else {
		$sql = "UPDATE ${rqTable} SET ${sql} WHERE requisitionId=" . $rqId;
	}
	
	//save rq
	
	if($_GET["a"]) echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br />\n";
	#$db->query($sql) or die("RQ Insert Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	if($rqId == "new") { 
		$rqId = $db->insert_id;
		if($_GET["a"]) echo "New rqId: ${rqId}<br />\n"; 
	}

	//save requisition items
	
	if($_GET["a"]) echo "<br />RQ Items SQLs:<br />\n";

	foreach($items as $row) {
		$row["requisitionId"] = $rqId;
		$itemId = $row["requisitionItemId"];
		unset($row["requisitionItemId"]);
		$fields = array_keys($row);
		foreach($row as $key=>$value) { $row[$key] = mysqli_real_escape_string($db, $value); }
		if(!$itemId && $row["del"] != 1) {
			//items to insert
			$sql = "INSERT INTO ${rqItemsTable} (" . implode(", ", $fields) . ") VALUES (\"" . implode("\", \"", $row) . "\")";
		} else if(is_numeric($itemId) && $row["del"] != 1) {
			//items to update
			$sql = "UPDATE ${rqItemsTable} SET ";
			foreach($row as $key=>$value) { $sql .= $key . " = \"" . $value . "\", "; }
			$sql = trim($sql, ", ") . " WHERE requisitionItemId = ${itemId}";
		} else if(is_numeric($itemId) && $row["del"] == 1) {
			//items to delete
			$sql = "UPDATE ${rqItemsTable} SET is_valid = \"void " . date("Y-m-d H:i") . "\" WHERE requisitionItemId = MID(\"${itemId}\", 2, 20)";
		}
		if($_GET["a"]) "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br /><br />\n";
		#$db->query($sql) or die("RQ Item Save Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	}
	
}

if($_GET["requisitionId"] && is_numeric($_GET["requisitionId"])) {

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
			${rqItemsTable} d ON a.requisitionId=d.requisitionId 
		WHERE
			a.isValid NOT LIKE 'void%' AND d.isValid NOT LIKE 'void%' AND 
			a.requisitionId=" . $_GET["requisitionId"];
	$rs = $db->query($sql) or die($db->error);
	$data["rq"] = $rs->fetch_assoc();

	//items for the one rq

	$sql2 = "SELECT * FROM ${rqItemsTable} WHERE requisitionId = " . $_GET["requisitionId"];
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
	$myJSON = json_encode($data);
	echo $myJSON;
}

?>