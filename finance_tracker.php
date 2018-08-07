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

$page_names = array("Info", "Requisitioning", "Receiving", "Distribution", "Inventory", "Utilities");

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

//build the top menu
$page_name_selector = "";
foreach($page_names as $value) {
	$page_name_selector .= "<a ";
	if($page_name == $value) $page_name_selector .= "id=selected ";
	$page_name_selector .= "href='?pn=${value}'>${value}</a>";
}

if($_POST["log_action"] == "login") {

	$page_content = file_get_contents("templates/login.tpl");

} else {

	$tplFilePath = "templates/frontend_" . strtolower(str_replace(" ", "", $page_name)) . ".tpl";

	if(is_file($tplFilePath)) {

		$page_content = file_get_contents($tplFilePath);

		//check for presence of sidebar and add it to content
		if(stripos($page_content, "{sidebar}")) {
			//look for sidebar file. tpl has precedence over md file.
			$tmp = str_replace(".tpl", "_sidebar.tpl", $tplFilePath);
			if(is_file($tmp)) {
				$tmp = file_get_contents($tmp);
				$page_content = str_replace("{sidebar}", $tmp, $page_content);
			} else {
				$tmp = str_replace(".tpl", ".md", $tmp);
				if(is_file($tmp)) {
					$tmp = file_get_contents($tmp);
					$pd = new Parsedown();
					$page_content = str_replace("{sidebar}", $pd->text($tmp), $page_content);
				}
			}
		}

		//check for additional content and add it

		if(stripos($page_content, "{content}")) {

			//Additional content for the Info module is the app's ReadMe file
			if($page_name == "Info") {
				$tmp = file_get_contents("ReadMe.md");
				$pd = new Parsedown();
				$page_content = str_replace("{content}", $pd->text($tmp), $page_content);
			}

			//Additional content for the other pages are parts of sub modules.
			//$_GET["t1"] identifies the sub module.
			//We check for sub module, and alert if there isn't any
			if(trim($_GET["t1"])) {
				$tmp = strtolower(str_replace(" ", "", trim($_GET["t1"])));
				$tmp = str_replace(".tpl", "_${tmp}.tpl", $tplFilePath);
				//check for tpl file
				if(is_file($tmp)) {
					$additionalContent = file_get_contents($tmp);
				} else {
					//by default, we assume the module is missing
					$additionalContent = "<h1>Missing Sub MOdule</h1>";
					//check for md file and override missing alert
					$tmp = str_replace(".tpl", ".md", $tplFilePath);
					if(is_file($tmp)) {
						$pd = new Parsedown();
						$additionalContent = $pd->text(file_get_contents($tmp));
					}
				}
				//insert the additional content
				$page_content = str_replace("{content}", $additionalContent, $page_content);
			} else {
				$tmp = "<h1>Missing Sub Module</h1>";
				$page_content = str_replace("{content}", $tmp, $page_content);
			}
		}

	} else {

		$page_content = file_get_contents("templates/no_content.tpl");
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

//insert the page's major dynamic pieces
$main_html = str_replace("{page_name}", $page_name, $main_html);
$main_html = str_replace("{pn}", strtolower($page_name), $main_html);
$main_html = str_replace("{page_name_selector}", $page_name_selector, $main_html);
$main_html = str_replace("{jsForceLoad}", rand(0, 50), $main_html);

print $main_html;

?>