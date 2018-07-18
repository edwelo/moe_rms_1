<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

$page_name = $_GET["pn"];

$db_host = "mysql.moe"; $db_user = "mysql"; $db_pass = "mysql";
if($_SERVER["REMOTE_ADDRESS"] == "127.0.0.1" || $_SERVER["REMOTE_ADDRESS"] == "::1") {
	$db_host = "localhost";
}
$db = new mysqli($db_host, $db_user, $db_pass);

$rqTable = "finance3.requisitions";
$rqItemsTable = "finance3.requisitions_items";
$vendorTable = "finance3.vendors";
$staffTable = "personnel.tblbiodata";

unset($rqId);
if($_GET["requisitionId"] == "new" || is_numeric($_GET["requisitionId"])) {
	$rqId = $_GET["requisitionId"]; $type = "Data for Form";
} else {
	$type = "Data for List";
}

if(isset($_GET["save"])) {
	require_once("includes/${page_name}_save.inc");
}

require_once("includes/${page_name}_read.inc");

if($_GET["a"]) {
	echo "<p>Page Name: ${page_name}<br />Data Type: ${type}</p>";
	echo "<p>Read SQLs:<br />" . $sqlHTML . "</p>";
	
	echo "<p>Result Array: <pre style='font-size: small;'>"; print_r($data); echo "</pre></p>";
	$myJSON = json_encode($data);
	
	echo "<p>Returned JSON, encoded from above array:</p>";
	echo "<p style='font-size: small;'>" . json_encode($data) . "</p>";
} else {

	//code testing, delete for production
	#if($save_activity) $data["save_activity"] = $save_activity;

	$myJSON = json_encode($data);
	echo $myJSON;
}

?>