<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

session_start();
if($_POST['log_action']=="logout") { $_SESSION = array(); session_destroy(); $uid=""; $cn=""; unset($persid); }

//AUTHENTICATION
if($_POST["username"] && $_POST["password"]) require_once("includes/authenticate.inc");

//include markup parser
require_once("includes/parsedown.inc");

//Page Setup and Print

$main_html = file_get_contents("templates/main.tpl");

$page_names = array("Info", "Requisitioning", "Receiving", "Distribution", "Inventory");

if(!$_GET["pn"]) {
	$page_name="Info";
} else {
	if(in_array($_GET["pn"], $page_names)) {
		if($_SESSION["uid"]) {
			$page_name = $_GET["pn"];
		} else {
			$page_name="Info";
		}
	} else {
		$page_name="Info";
	}
}

$page_name_selector = "";
foreach($page_names as $value) {
	$page_name_selector .= "<a ";
	if($page_name == $value) $page_name_selector .= "id=selected ";
	$page_name_selector .= "href='?pn=${value}'>${value}</a>";
}

if($_POST["log_action"] == "login") {

	$page_content = file_get_contents("templates/login.tpl");

} else {

	$page_content = file_get_contents("templates/frontend_" . strtolower(str_replace(" ", "", $page_name)) . ".tpl");
	if($page_name == "Info") {
		$pd = new Parsedown();
		$pd_content = file_get_contents("ReadMe.md");
		$page_content = str_replace("{content}", $pd->text($pd_content), $page_content);
		$pd_content = file_get_contents("templates/frontend_info_sidebar.md");
		$page_content = str_replace("{content2}", $pd->text($pd_content), $page_content);
	}

}

$main_html = str_replace("<!-- content -->", $page_content, $main_html);

if($_SESSION["uid"]) {
	$main_html = str_replace("{log_action}", "logout", $main_html);
	$main_html = str_replace("{cn}", $_SESSION["cn"], $main_html);
	$main_html = str_replace("{uidnumber}", $_SESSION["uidnumber"], $main_html);
} else {
	$main_html = str_replace("{log_action}", "login", $main_html);
	$main_html = str_replace("{cn}", "Not logged in", $main_html);
	$main_html = str_replace("{uidnumber}", "", $main_html);
}

$main_html = str_replace("{page_name}", $page_name, $main_html);
$main_html = str_replace("{pn}", strtolower($page_name), $main_html);
$main_html = str_replace("{page_name_selector}", $page_name_selector, $main_html);
$main_html = str_replace("{jsForceLoad}", rand(0, 50), $main_html);

if($page_name == "Distribution") {
	$search = "js/frontend_functions_rq.js";
	$replace = "js/frontend_functions_dist.js";
	$main_html = str_replace($search, $replace, $main_html);
}

print $main_html;

?>