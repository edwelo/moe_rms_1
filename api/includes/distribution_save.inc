<?php
//rq save, called by backend.php
//eo 180717

if($local) {
	$json = '{"distInfo":{"distributionId":"new","destination":"MPC","preparedBy":"Bonnie","preparedDate":"2017-11-26","deliveredBy":"","deliveredDate":"","receivedBy":"Totong","receivedDate":"2017-11-26","status":"closed","statusDate":"2017-11-26","remarks":"Repaired and in good working order"},"distItems":[{"distributionItemId":"32","receivingItemId":"6","requisitionItemId":"24","quantity":"1.000","assetTag":"","modelNo":"","serialNo":"","del":"undefined"},{"distributionItemId":"33","receivingItemId":"7","requisitionItemId":"25","quantity":"1.000","assetTag":"","modelNo":"","serialNo":"","del":"undefined"},{"distributionItemId":"34","receivingItemId":"8","requisitionItemId":"26","quantity":"2.000","assetTag":"","modelNo":"","serialNo":"","del":"undefined"},{"distributionItemId":"35","receivingItemId":"9","requisitionItemId":"27","quantity":"6.000","assetTag":"","modelNo":"","serialNo":"","del":1},{"distributionItemId":"36","receivingItemId":"10","requisitionItemId":"28","quantity":"1.000","assetTag":"","modelNo":"","serialNo":"","del":"undefined"},{"distributionItemId":"","receivingItemId":"18","requisitionItemId":"1","quantity":"3.000","assetTag":"","modelNo":"","serialNo":"","del":""}]}';
	$saveArr = json_decode($json);
	$json = "JSON - GET: " . $json;
} else {
	if(isset($_POST)) {
		$json = file_get_contents('php://input');
		$saveArr = json_decode($json);
		$json = "JSON FROM POST:<br />" . $json;
		#echo "post_got_this_" . json_encode($save_arr);
		#echo "<pre>"; print_r($save_arr); echo "</pre>"; exit;
	} else {
		echo "POST_NOT_RECEIVED!";
		exit;
	}
}

if($local) {
	echo "<p>JSON and Array from JSON:</p>";
	echo "<p style='x-small;'>" . $json . "</p>";
	echo "<pre>"; print_r($saveArr); echo "</pre>";
}

//base sqls
$insertSQL = "INSERT INTO ${distribTable} SET %s";
$updateSQL = "UPDATE ${distribTable} SET %s WHERE receivingId = %s";
$iInsertSQL = "INSERT INTO ${distribItemsTable} SET %s, distributionId=%s";
$iUpdateSQL = "UPDATE ${distribItemsTable} SET %s WHERE distributionItemId = %s";
$iVoidSQL = "UPDATE ${distribItemsTable} SET isValid = 'x" . date("ymdHi") . "' WHERE distributionItemId = %s";

if(!isset($saveArr)) $saveArr = new stdClass();

$info = $saveArr->distInfo;

$distId = $info->distributionId;
unset($info->distributionId);
if(!$distId) $distId = "new";

$items = $saveArr->distItems;

$info->destination = $info->destination ? "\"" . mysqli_real_escape_string($db, $info->destination) . "\"" : "NULL";
$info->preparedBy = $info->preparedBy ? "\"" . mysqli_real_escape_string($db, $info->preparedBy) . "\"" : "NULL";
$info->preparedDate = $info->preparedDate > "2009-09-30" ? "\"" . $info->preparedDate . "\"" : "NULL";
$info->deliveredBy = $info->deliveredBy ? "\"" . mysqli_real_escape_string($db, $info->deliveredBy) . "\"" : "NULL";
$info->deliveredDate = $info->deliveredDate > "2009-09-30" ? "\"" . $info->deliveredDate . "\"" : "NULL"; 
$info->receivedBy = $info->receivedBy ? "\"" . mysqli_real_escape_string($db, $info->receivedBy) . "\"" : "NULL";
$info->receivedDate = $info->receivedDate > "2009-09-30" ? "\"" . $info->receivedDate . "\"" : "NULL";
$info->status = $info->status ? "\"" . mysqli_real_escape_string($db, $info->status) . "\"" : "NULL";
$info->statusDate = $info->statusDate > "2009-09-30" ? "\"" . $info->statusDate . "\"" : "NULL";
$info->remarks = $info->remarks ? "\"" . mysqli_real_escape_string($db, $info->remarks) . "\"" : "NULL";

$sql = "SET ";
foreach($info as $key=>$value) {
	$sql .= "$key = $value, ";
}
$sql = trim($sql, ", ");

if($distId == "new") {
	$sql = "INSERT INTO $distribTable $sql";
} else {
	$sql = "UPDATE $distribTable $sql WHERE distributionId=$distId";
}

$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . ";</p>";

$db->query($sql) or die("SAVE_DISTRIB_ERROR: " . $db->error);
if($distId == "new") $distId = $db->insert_id;

//rq

foreach($items as $row) {
	$sqlItems = "
		receivingItemId=" . ($row->receivingItemId ? $row->receivingItemId : "NULL") . ", 
		requisitionItemId=" . ($row->requisitionItemId ? $row->requisitionItemId : "NULL") . ", 
		quantity=" . ($row->quantity ? $row->quantity : "NULL") . ", 
		assetTag=" . ($row->assetTag ? "\"" . mysqli_real_escape_string($db, $row->assetTag) . "\"" : "NULL") . ", 
		modelNo=" . ($row->modelNo ? "\"" . mysqli_real_escape_string($db, $row->modelNo) . "\"" : "NULL") . ", 
		serialNo=" . ($row->serialNo ? "\"" . mysqli_real_escape_string($db, $row->serialNo) . "\"" : "NULL") . " 
	";
	#echo $row->distributionItemId . ": " . (is_numeric($row->distributionItemId) ? " It is Numeric!" : "It is NOT Numeric!");
	if(is_numeric($row->distributionItemId)) {
		if($row->del == 1) {
			$sql = sprintf($iVoidSQL, $row->distributionItemId);
		} else {
			$sql = sprintf($iUpdateSQL, $sqlItems, $row->distributionItemId);
		}
	} else {
		$sql = sprintf($iInsertSQL, $sqlItems, $distId);
	}

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . ";</p>";

	$db->query($sql) or die("SAVE_DISTRIB_ITEM_ERROR: " . $db->error);

}

?>