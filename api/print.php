<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

$page_name = $_GET["pn"];
$rqId = $_GET["requisitionId"];

$tpl = file_get_contents("html/" . strtolower($page_name) . "_print.tpl");

if($rqId && is_numeric($rqId)) {

	$rqTable = "finance4.requisitions";
	$rqItemsTable = "finance4.requisitions_items";
	$vendorTable = "finance4.vendors";
	$staffTable = "personnel.tblbiodata";
	$rcvTable = "finance4.receiving";
	$rcvItemsTable = "finance4.receiving_items";
	$distribTable = "finance4.distributions";
	$distribItemsTable = "finance4.distributions_items";

	$db = new mysqli("mysql.moe", "mysql", "mysql");
	require_once("includes/" . strtolower($page_name) . "_read.inc");
	$db->close;

	$items = $data["rq"]["items"];
	unset($data["rq"]["items"]);
	$rqInfo = $data["rq"];

	preg_match("/<tr id=row.*?<\/tr>/s", $tpl, $matches);

	$htmlRows = "";

	$i=1;
	foreach($items as $row) {
		$htmlRow = str_replace(" id=row", "", $matches[0]);
		$htmlRow = str_replace("{no}", $i++ . ".", $htmlRow);
		foreach($row as $key=>$value) {
			$htmlRow = str_replace("{" . $key . "}", $value, $htmlRow);
		}
		$htmlRows .= $htmlRow . "\n";
	}

	$tpl = str_replace($matches[0], $htmlRows, $tpl);

	$rqInfo["rqAmount"] = "$ " . number_format($rqInfo["rqAmount"], 3, ".", ",");

	$bciOrgs = array("1310", "3561", "3670", "1301-BCI");

	$rqInfo["director"] = "Andrew Tabelual";
	if(in_array($items[0]["org"], $bciOrgs)) $rqInfo["director"] = "Debbie Tkel-Sbal";
	if(in_array($items[0]["org"] . "-" . strtoupper($items[0]["costCenter"]), $bciOrgs)) $rqInfo["director"] = "Debbie Tkel-Sbal";

	$rqInfo["minister"] = "Sinton Soalablai";
	$rqInfo["procurementOfficer"] = "Millan Isak";
	$rqInfo["budgetROP"] = "Casmir Remengesau";

	foreach($rqInfo as $key=>$value) {
		$tpl = str_replace("{" . $key . "}", $value, $tpl);
	}

}

print $tpl;

?>