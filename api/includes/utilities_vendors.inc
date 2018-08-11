<?php
//utilities, called by backend.php
//eo 180806

if($_GET["t1"] == "Vendors") {

	$vId = $_GET["requisitionId"];
	
	if($_GET["save"]) {
	
		$json = file_get_contents('php://input');
	
		if(!$json) {
			$json = '{"saveVendor":{"vendorId":"12","vendorName":"Mason\'s Hardware Do-It Center","address1":"P.O. Box 295","address2":"","city":"Koror","state":"Palau","zip":"96940","phone":"(680) 488-3660","fax":"(680) 488-5353","email":"","website":""}}';
		}
	
		if(!$json) {
			echo "POST_NOT_RECEIVED!"; exit;
		}
		
		$tmp = json_decode($json);
		$saveData = $tmp->saveVendor;

		if($local) {
			echo "<p>JSON:<br /><span style='font-size: small;'>${json}</span></p>";
			if(is_object($saveData)) {
				echo "<p>rqID: " . $_GET["requisitionId"] . " :: " . $saveData->vendorId . " :: " . $rqId . "</p>";
				echo "<p>Object from json:</p>";
				echo "<pre>"; print_r($saveData); echo "</pre>";
			} else {
				echo "<p>There is no array from JSON.</p>"; exit;
			}
		}

		$vId = $saveData->vendorId;
		
		unset($saveData->vendorId);
		
		$sqlItems = "";
		foreach($saveData as $key=>$value) {
			if($value) {
				$sqlItems .= "$key = \"" . mysqli_real_escape_string($db, $value) . "\", ";
			} else {
				$sqlItems .= "$key = NULL, ";
			}
		}
		$sqlItems = trim($sqlItems, ", ");
		
		if($vId == "new") {
			$sql = "INSERT INTO finance4.vendors SET $sqlItems";
		} else {
			$sql = "UPDATE finance4.vendors SET $sqlItems WHERE vendorId=$vId";
		}

		$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";
	
	}

	if(is_numeric($vId)) {
	
		$sql = "SELECT * FROM finance4.vendors WHERE vendorId=$vId";
		
		$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

		$rs = $db->query($sql) or die("GET_VENDOR: " . $db->error . $sqlHTML);
		$data["rq"] = $rs->fetch_assoc();
	
	} else {

		$sql = "SELECT * FROM finance4.vendors ORDER BY vendorName";

		$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

		$rs = $db->query($sql) or die("GET_VENDOR_LIST: " . $db->error . $sqlHTML);
		while($tmp = $rs->fetch_assoc()) {
			if(!isset($data["rqlist"]["keys"])) {
				$data["rqlist"]["keys"] = array_keys($tmp);
			}
			$data["rqlist"]["values"][] = array_values($tmp);
		}
	
	}
}

?>