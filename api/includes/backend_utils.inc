<?php

if($local) {
	echo "
<span style='font-weight: bold;'>" . $_GET["t1"] . "</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style='font-size: small; color: grey;'> Enter an Id to look at form data:</span>
<form style='display: inline; margin: 0px;' action='' method=get>
	<input type=hidden name=pn value='${page_name}' />
	<input type=hidden name=t1 value='" . $_GET["t1"] . "' />
	<input type=text name=id value='' size=5 />
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

if($_GET["t1"]) {

	$t1 = strtolower(str_replace(" ", "", trim($_GET["t1"])));
	$file = "includes/" . strtolower($page_name) . "_" . $t1 . ".inc";
	
	if(is_file($file)) {
		require_once($file);
	}	
	
}

$db->close;

?>