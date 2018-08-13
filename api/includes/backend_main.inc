<?php

$db_host = "mysql.moe"; $db_user = "mysql"; $db_pass = "mysql";
if($_SERVER["REMOTE_ADDRESS"] == "127.0.0.1" || $_SERVER["REMOTE_ADDRESS"] == "::1") {
	$db_host = "localhost";
}
$db = new mysqli($db_host, $db_user, $db_pass);

$rqTable = "finance4.requisitions";
$rqItemsTable = "finance4.requisitions_items";
$vendorTable = "finance4.vendors";
$staffTable = "personnel.tblbiodata";
$rcvTable = "finance4.receiving";
$rcvItemsTable = "finance4.receiving_items";
$distribTable = "finance4.distributions";
$distribItemsTable = "finance4.distributions_items";

if(isset($_GET["save"])) {
	require_once("includes/" . strtolower($page_name) . "_save.inc");
}

require_once("includes/" . strtolower($page_name) . "_read.inc");

$db->close;

?>