<?php
unset($rqId);
if($_GET["requisitionId"] && ($_GET["requisitionId"] == "new" || is_numeric($_GET["requisitionId"]))) {
	$rqId = $_GET["requisitionId"];
	$heading = "${page_name} Form Data, rqId #${rqId}";
} else {
	$heading = "${page_name} List Data";
}

if($local) {
	echo "
<span style='font-weight: bold;'>${heading}</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style='font-size: small; color: grey;'> Enter an RqId to look at form data:</span>
<form style='display: inline; margin: 0px;' action='' method=get>
	<input type=hidden name=pn value='${page_name}' />
	<input type=text name=requisitionId value='' size=5 />
	<input type=hidden name=a value=1 />
	<input type=submit value='go' />
</form>
	";
}

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