<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

if(!$_SERVER["HTTP_REFERER"] || substr(basename($_SERVER["HTTP_REFERER"]), 0, 7) == "backend") {
	$local = true;
}

$pages = array("Requisitioning", "Receiving", "Distribution", "Inventory", "Utilities");
if(!in_array($_GET["pn"], $pages)) {
	header("location: backend.php?pn=Requisitioning");
}

$page_name = $_GET["pn"];

unset($rqId);
if($_GET["requisitionId"] && ($_GET["requisitionId"] == "new" || is_numeric($_GET["requisitionId"]))) {
	$rqId = $_GET["requisitionId"];
}

if($local) {
	$html = file_get_contents("html/backend_local.tpl");
	
	$search = "value=\"" . $page_name . "\"";
	$html = str_replace($search, $search . " checked", $html);
	
	$html = str_replace("{rqId}", "${rqId}", $html);
	if($rqId) {
		$html = str_replace("{heading}", "${page_name} Form Data, rqId #${rqId}", $html);
	} else {
		$html = str_replace("{heading}", "${page_name} List Data", $html);
	}
	print $html;
}

if(!$page_name) { exit; }

if($page_name == "Utilities") {
	require_once("includes/backend_utils.inc");
} else {
	require_once("includes/backend_main.inc");
}

if($local) {
	echo "<p>SQLs:</p>" . $sqlHTML;
	$myJSON = json_encode($data);
	echo "<p>Returned JSON:<br /><br /><span style='font-size: small;'>" . $myJSON . "</span></p>";
	echo "Returned Array:<pre>"; print_r($data); echo "</pre>";
} else {
	//code testing, delete for production
	#if($save_activity) $data["save_activity"] = $save_activity;
	$myJSON = json_encode($data);
	echo $myJSON;
}



?>