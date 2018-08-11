<?php
//utilities, called by backend.php
//eo 180806

$sql = "SELECT * FROM finance4.vendors ORDER BY vendorName";

$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

$rs = $db->query($sql) or die("GET_VENDOR_LIST: " . $db->error . $sqlHTML);
while($tmp = $rs->fetch_assoc()) {
	if(!isset($data["keys"])) {
		$data["keys"] = array_keys($tmp);
	}
	$data["values"][] = array_values($tmp);
}

?>