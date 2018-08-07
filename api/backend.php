<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE); //get rid of undefined variable notice
#error_reporting(E_ALL | E_STRICT);
date_default_timezone_set("Pacific/Palau");

if(!$_SERVER["HTTP_REFERER"] || substr(basename($_SERVER["HTTP_REFERER"]), 0, 7) == "backend") {
	$local = true;
}

$page_name = $_GET["pn"];

$html = "
<h3>Welcome to the MOE Expenditure Tracker App Backend</h3>

<p>
<span style='color: grey;'>Look at other modules:</span>&nbsp;&nbsp;
[ <a href=\"?pn=Requisitioning\">Requisitioning</a> ]
[ <a href=\"?pn=Receiving\">Receiving</a> ]
[ <a href=\"?pn=Distribution\">Distribution</a> ]
[ <a href=\"?pn=Inventory\">Inventory</a> ]
</p>

<p>
<span style='color: grey;'>Utilities:</span>&nbsp;&nbsp;
[ <a href=\"?pn=Utilities&t1=Vendors\">Vendors</a> ]
[ <a href=\"?pn=Utilities&t1=Orgs\">Orgs</a> ]
[ <a href=\"?pn=Utilities&t1=Tasks\">Tasks</a> ]
[ <a href=\"?pn=Utilities&t1=Cost Centers\">Cost Centers</a> ]
</p>
";

if($local) echo $html;

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