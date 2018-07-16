<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");


//Page Setup and Print

$main_html = file_get_contents("templates/main.tpl");

$page_names = array("Info", "Requisitioning", "Receiving", "Distribution", "Inventory");

if(!$_GET["pn"]) {
	$page_name="Info";
} else {
	if(in_array($_GET["pn"], $page_names)) {
		$page_name = $_GET["pn"];
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

$page_content = file_get_contents("templates/frontend_" . strtolower(str_replace(" ", "", $page_name)) . ".tpl");
$main_html = str_replace("<!-- content -->", $page_content, $main_html);

$main_html = str_replace("{page_name}", $page_name, $main_html);
$main_html = str_replace("{page_name_selector}", $page_name_selector, $main_html);

print $main_html;

?>