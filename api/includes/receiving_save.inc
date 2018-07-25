<?php
//rq save, called by backend.php
//eo 180717

echo "<p>Save start ...</p>";

if(trim($_GET["requisitionId"])) $tmp = trim($_GET["requisitionId"]);
if($tmp && ($tmp == "new" || is_numeric($tmp))) {

	$rcvId = $tmp;

	if($_GET["a"]) {
		//$json = '{"requisitionId":"20","requisitionNo":"2018-19","initiatingOffice":"dsfa","requestedBy":"dfdas","requestedDate":null,"preparedById":"709","preparedByName":"Bonnie Imeong","preparedDate":"2017-11-02","vendorId":"13","vendorName":"Jezrrae Wear II","justification":"Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450\/RP#3992.","numItems":"6","rqAmount":"2236.400","quotationId":null,"moeApprovedDate":null,"mofDeliveredDate":null,"poNo":null,"poDate":null,"poAmount":null,"rcvDate":null,"rcvBy":null,"invoiceNo":null,"invoiceAmount":null,"invoiceDate":null,"isValid":"","items":[{"requisitionItemId":"24","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOEO3","opt":null,"acc":"1420","description":"Feed Clutch","quantity":"1.000","unit":"Each","price":"375.000","extended":"375.000","fiscalYear":null,"sequenceNo":"1","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"26","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Separator Base Unit","quantity":"2.000","unit":"Each","price":"64.800","extended":"130.000","fiscalYear":null,"sequenceNo":"3","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"27","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Paper Feed Roller","quantity":"6.000","unit":"Each","price":"152.800","extended":"917.000","fiscalYear":null,"sequenceNo":"4","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"28","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":"sdf","acc":"sdf","description":"Service Labor","quantity":"1.000","unit":"Lot","price":"55.000","extended":"55.000","fiscalYear":null,"sequenceNo":"5","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"136","requisitionId":"20","org":"adsf","costCenter":"dsa","task":"df","opt":null,"acc":"fsad","description":"delete this too","quantity":"20.000","unit":"ea","price":"20.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"137","requisitionId":"20","org":"sdfa","costCenter":"d","task":"sasd","opt":"dd","acc":"ds","description":"666xxx","quantity":"6.000","unit":"ea","price":"60.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""}]}';
		//$json = '{"requisitionId":"new","initiatingOffice":"180718 1006","requestedBy":"edwel","preparedById":"","preparedDate":"2018-07-18","vendorId":"13","justification":"dfjo osdfj oidfj osijfjidsoji","rqAmount":"","moeApprovedDate":"","poNo":"","poDate":"","poAmount":"","items":[{"requisitionItemId":"","org":"1322","costCenter":"boe","task":"","opt":"","acc":"1420","quantity":"50","unit":"cs","price":"57","extended":"","description":"Copier Paper","del":""}]}';
		//$json = '{"requisitionId":"1","initiatingOffice":"BEA Transportation Services","requestedBy":"Godinez","requestedDate":"2017-12-23","preparedBy":"","preparedDate":"2017-12-23","authNo":"Temp001.03","authDate":"2018-01-28","authAmount":"372.600","justification":"Repair Bus #3","rcvBy":"Godinez","rcvDate":"2018-02-28","invoiceNo":"KM009","invoiceDate":"2018-02-28","invoiceAmount":"372.600","statusDate":"","remarks":"","items":[{"receivingItemId":"17","receivingId":"9","requisitionItemId":"1","quantity":"8.000","unit":"pts","price":"7.950","extended":"63.600","description":"Motor Oil 10-30","del":"undefined"},{"receivingItemId":"18","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"ea","price":"48.000","extended":"144.000","description":"Belts (Fan, Alternator, Main)","del":"undefined"},{"receivingItemId":"19","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"hrs","price":"55.000","extended":"165.000","description":"Service Labor","del":"undefined"}]}';
		//$json = '{"requisitionId":"1","initiatingOffice":"BEA Transportation Services","requestedBy":"Godinez","requestedDate":"2017-12-23","preparedBy":"","preparedDate":"2017-12-23","authNo":"Temp001.03","authDate":"2018-01-28","authAmount":"372.600","justification":"Repair Bus #3","rcvBy":"Godinez","rcvDate":"2018-02-28","invoiceNo":"KM009","invoiceDate":"2018-02-28","invoiceAmount":"372.600","statusDate":"","remarks":"","items":[{"receivingItemId":"17","receivingId":"9","requisitionItemId":"1","quantity":"8.000","unit":"pts","price":"7.950","extended":"63.600","description":"Motor Oil 10-30","del":"undefined"},{"receivingItemId":"18","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"ea","price":"48.000","extended":"144.000","description":"Belts (Fan, Alternator, Main)","del":"undefined"},{"receivingItemId":"19","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"hrs","price":"55.000","extended":"165.000","description":"Service Labor","del":"undefined"},{"receivingItemId":"","receivingId":"","requisitionItemId":"","quantity":"3","unit":"ea","price":"1500","extended":"0","description":"kickback","del":""}]}';
		//$json = '{"requisitionId":"1","initiatingOffice":"BEA Transportation Services","requestedBy":"Godinez","requestedDate":"2017-12-23","preparedBy":"","preparedDate":"2017-12-23","authNo":"Temp001.03","authDate":"2018-01-28","authAmount":"372.600","justification":"Repair Bus #3","rcvBy":"Godinez","rcvDate":"2018-02-28","invoiceNo":"KM009","invoiceDate":"2018-02-28","invoiceAmount":"372.600","statusDate":"","remarks":"","items":[{"receivingItemId":"17","receivingId":"9","requisitionItemId":"1","quantity":"8.000","unit":"pts","price":"7.950","extended":"63.600","description":"Motor Oil 10-30","del":"undefined"},{"receivingItemId":"18","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"ea","price":"48.000","extended":"144.000","description":"Belts (Fan, Alternator, Main)","del":"undefined"},{"receivingItemId":"19","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"hrs","price":"55.000","extended":"165.000","description":"Service Labor","del":"1"},{"receivingItemId":"","receivingId":"9","requisitionItemId":"1","quantity":"5","unit":"e","price":"25","extended":"25000","description":"kickbak","del":""}]}';
		$json = '{"requisitionId":"1","initiatingOffice":"BEA Transportation Services","requestedBy":"Godinez","requestedDate":"2017-12-23","preparedBy":"","preparedDate":"2017-12-23","authNo":"Temp001.03","authDate":"2018-01-28","authAmount":"372.600","justification":"Repair Bus #3","rcvBy":"Godinez","rcvDate":"2018-02-28","invoiceNo":"KM009","invoiceDate":"2018-02-28","invoiceAmount":"372.600","statusDate":"","remarks":"","items":[{"receivingItemId":"17","receivingId":"9","requisitionItemId":"1","quantity":"8.000","unit":"pts","price":"7.950","extended":"63.600","description":"Motor Oil 10-30","del":"undefined"},{"receivingItemId":"18","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"ea","price":"48.000","extended":"144.000","description":"Belts (Fan, Alternator, Main)","del":"undefined"},{"receivingItemId":"19","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"hrs","price":"55.000","extended":"165.000","description":"Service Labor","del":"1"},{"receivingItemId":"","receivingId":"9","requisitionItemId":"1","quantity":"5","unit":"ea","price":"300","extended":"1250","description":"Kickback for me","del":""}]}';
		$rcvArr = json_decode($json);
		$json = "JSON - GET: " . $json;
	} else {
		if(isset($_POST)) {
			$json = file_get_contents('php://input');
			$rcvArr = json_decode($json);
			$json = "JSON FROM POST:<br />" . $json;
			#echo "post_got_this_" . json_encode($save_arr);
			#echo "<pre>"; print_r($save_arr); echo "</pre>"; exit;
		} else {
			echo "POST_NOT_RECEIVED!";
			exit;
		}
	}

	if($_GET["a"]) {
		echo "<p>JSON and Array from JSON:</p>";
		echo "<p style='x-small;'>" . $json . "</p>";
		echo "<pre>"; print_r($rcvArr); echo "</pre>";
	}

	if(!isset($rcvArr)) $rcvArr = new stdClass();

	$rqId = $rcvArr->requisitionId;

	$items = $rcvArr->items;

	//remove the following fields from \$rcvArr
	$tmp = array("items", "receivingId");
	foreach($tmp as $key) { unset($rqArr->$key); }

	//tables

	//base sqls
	$rcvInsertSQL = "INSERT INTO ${rcvTable} SET %s";
	$rcvUpdateSQL = "UPDATE ${rcvTable} SET %s WHERE receivingId = %s";
	$itemInsertSQL = "INSERT INTO ${rcvItemsTable} SET %s";
	$itemUpdateSQL = "UPDATE ${rcvItemsTable} SET %s WHERE receivingItemId = %s";
	$itemVoidSQL = "UPDATE ${rcvItemsTable} SET isValid = 'x" . date("ymdHi") . "' WHERE receivingItemId = %s";

	//rq

	#####
	# Set up the rcving sql
	#####

	$fields[] = array("receivingId", "int", 4, "NOT NULL", "AUTO_INCREMENT");
	$fields[] = array("requisitionId", "int", 4, "DEFAULT NULL", "");
	$fields[] = array("initiatingOffice", "varchar", 30, "DEFAULT NULL", "");
	$fields[] = array("requestedBy", "varchar", 30, "DEFAULT NULL", "");
	$fields[] = array("requestedDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("preparedById", "int", 5, "DEFAULT NULL", "");
	$fields[] = array("preparedByName", "varchar", 30, "DEFAULT NULL", "");
	$fields[] = array("preparedDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("justification", "varchar", 255, "DEFAULT NULL", "");
	$fields[] = array("numItems", "int", 4, "DEFAULT NULL", "");
	$fields[] = array("authNo", "varchar", 12, "DEFAULT NULL", "");
	$fields[] = array("authDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("authAmount", "decimal", 10, "DEFAULT NULL", "");
	$fields[] = array("rcvDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("rcvBy", "varchar", 30, "DEFAULT NULL", "");
	$fields[] = array("invoiceNo", "varchar", 12, "DEFAULT NULL", "");
	$fields[] = array("invoiceAmount", "decimal", 10, "DEFAULT NULL", "");
	$fields[] = array("invoiceDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("status", "varchar", 30, "DEFAULT NULL", "");
	$fields[] = array("statusDate", "date", "", "DEFAULT NULL", "");
	$fields[] = array("remarks", "varchar", 255, "DEFAULT ''", "");
	$fields[] = array("isValid", "varchar", 20, "NOT NULL", "");

	$l = count($fields) - 1;

	$sqlData = "";

	for($i=1; $i<$l; $i++) {
		$fieldName=$fields[$i][0]; $fieldType=$fields[$i][1]; $fieldLength = $fields[$i][2];
		if($rcvArr->$fieldName) {
			//echo "<p>" . $fieldName . ": " . $rcvArr->$fieldName . "</p>";
			$value = $rcvArr->$fieldName;
			if($fieldType == "varchar") {
				$value = "\"" . substr(mysqli_real_escape_string($db, $value), 0, $fieldLength) . "\"";
			}
			if($fieldType == "int" || $fieldType == "decimal") {
				if(!is_numeric($value)) $value = "NULL";
				if(strlen($value) > $fieldLength) $value = "NULL";
			}
			if($fieldType == "date") {
				$value = date("Y-m-d", strtotime($value));
				$minValue = "2009-10-01"; $maxValue = date("Y-m-d");
				if($value < $minValue || $value > $maxValue) {
					$value = "NULL";
				} else {
					$value = "\"" . $value . "\"";
				}
			}
			$sqlData .= " " . $fieldName . "=" . $value . ",";
		}
	}
	$sqlData = trim($sqlData, ",");

	if(is_numeric($rcvId)) {
		$sql = sprintf($rcvUpdateSQL, $sqlData, $rcvId);
	} else {
		$sql = sprintf($rcvInsertSQL, $sqlData);
	}

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . ";</p>";

	$db->query($sql) or die("RQ_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	if(!$rcvId || $rcvId == "new") $rcvId = $db->insert_id;

	#####
	# Set up the rcving items sql
	#####

	unset($fields);

	$fields[] = array("receivingItemId", "int", "5");
	$fields[] = array("receivingId", "int", "4");
	$fields[] = array("requisitionId", "int", "5");
	$fields[] = array("requisitionItemId", "int", "5");
	$fields[] = array("org", "varchar", "4");
	$fields[] = array("costCenter", "varchar", "10");
	$fields[] = array("acc", "varchar", "4");
	$fields[] = array("description", "varchar", "255");
	$fields[] = array("quantity", "decimal", "10");
	$fields[] = array("unit", "varchar", "45");
	$fields[] = array("price", "decimal", "10");
	$fields[] = array("extended", "decimal", "10");
	$fields[] = array("isValid", "varchar", "30");

	$l = count($fields) - 1;

	foreach($items as $item) {
		$sqlData = ""; unset($sql);
		for($i=1; $i<$l; $i++) {
			$fieldName=$fields[$i][0]; $fieldType=$fields[$i][1]; $fieldLength = $fields[$i][2];
			if($fieldName == "receivingId") {
				$item->$fieldName = $rcvId;
			}
			if($item->$fieldName) {
				$value = $item->$fieldName;
				if($fieldType == "varchar") {
					$value = "\"" . substr(mysqli_real_escape_string($db, $value), 0, $fieldLength) . "\"";
				}
				if($fieldType == "int" || $fieldType == "decimal") {
					if(!is_numeric($value)) $value = "NULL";
					if(strlen($value) > $fieldLength) $value = "NULL";
				}
				if($fieldType == "date") {
					$value = date("Y-m-d", strtotime($value));
					$minValue = "2009-10-01"; $maxValue = date("Y-m-d");
					if($value < $minValue || $value > $maxValue) {
						$value = "NULL";
					} else {
						$value = "\"" . $value . "\"";
					}
				}
				$sqlData .= " " . $fieldName . "=" . $value . ",";
			}
		}
		$sqlData = trim($sqlData, ",");

		if(is_numeric($item->receivingItemId)) {
			if($item->del == 1) {
				$sql = sprintf($itemVoidSQL, $item->receivingItemId);
			} else {
				$sql = sprintf($itemUpdateSQL, $sqlData, $item->receivingItemId);
			}
		} else {
			$sql = sprintf($itemInsertSQL, $sqlData);
		}

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . ";</p>";

	}

	if($_GET["a"]) {
		echo "<p>Save SQLs:</p>" . $sqlHTML;
		unset($sqlHTML);
	}

}
?>