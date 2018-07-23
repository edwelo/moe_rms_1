<?php
//rq save, called by backend.php
//eo 180717

if(trim($_GET["requisitionId"])) $tmp = trim($_GET["requisitionId"]);
if($tmp && ($tmp == "new" || is_numeric($tmp))) {

	$rcvId = $tmp;

	if($_GET["a"]) {
		//$json = '{"requisitionId":"20","requisitionNo":"2018-19","initiatingOffice":"dsfa","requestedBy":"dfdas","requestedDate":null,"preparedById":"709","preparedByName":"Bonnie Imeong","preparedDate":"2017-11-02","vendorId":"13","vendorName":"Jezrrae Wear II","justification":"Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450\/RP#3992.","numItems":"6","rqAmount":"2236.400","quotationId":null,"moeApprovedDate":null,"mofDeliveredDate":null,"poNo":null,"poDate":null,"poAmount":null,"rcvDate":null,"rcvBy":null,"invoiceNo":null,"invoiceAmount":null,"invoiceDate":null,"isValid":"","items":[{"requisitionItemId":"24","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOEO3","opt":null,"acc":"1420","description":"Feed Clutch","quantity":"1.000","unit":"Each","price":"375.000","extended":"375.000","fiscalYear":null,"sequenceNo":"1","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"26","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Separator Base Unit","quantity":"2.000","unit":"Each","price":"64.800","extended":"130.000","fiscalYear":null,"sequenceNo":"3","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"27","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Paper Feed Roller","quantity":"6.000","unit":"Each","price":"152.800","extended":"917.000","fiscalYear":null,"sequenceNo":"4","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"28","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":"sdf","acc":"sdf","description":"Service Labor","quantity":"1.000","unit":"Lot","price":"55.000","extended":"55.000","fiscalYear":null,"sequenceNo":"5","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"136","requisitionId":"20","org":"adsf","costCenter":"dsa","task":"df","opt":null,"acc":"fsad","description":"delete this too","quantity":"20.000","unit":"ea","price":"20.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"137","requisitionId":"20","org":"sdfa","costCenter":"d","task":"sasd","opt":"dd","acc":"ds","description":"666xxx","quantity":"6.000","unit":"ea","price":"60.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""}]}';
		//$json = '{"requisitionId":"new","initiatingOffice":"180718 1006","requestedBy":"edwel","preparedById":"","preparedDate":"2018-07-18","vendorId":"13","justification":"dfjo osdfj oidfj osijfjidsoji","rqAmount":"","moeApprovedDate":"","poNo":"","poDate":"","poAmount":"","items":[{"requisitionItemId":"","org":"1322","costCenter":"boe","task":"","opt":"","acc":"1420","quantity":"50","unit":"cs","price":"57","extended":"","description":"Copier Paper","del":""}]}';
		$json = '{"requisitionId":"1","initiatingOffice":"BEA Transportation Services","requestedBy":"Godinez","requestedDate":"2017-12-23","preparedBy":"","preparedDate":"2017-12-23","authNo":"Temp001.03","authDate":"2018-01-28","authAmount":"372.600","justification":"Repair Bus #3","rcvBy":"Godinez","rcvDate":"2018-02-28","invoiceNo":"KM009","invoiceDate":"2018-02-28","invoiceAmount":"372.600","statusDate":"","remarks":"","items":[{"receivingItemId":"17","receivingId":"9","requisitionItemId":"1","quantity":"8.000","unit":"pts","price":"7.950","extended":"63.600","description":"Motor Oil 10-30","del":"undefined"},{"receivingItemId":"18","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"ea","price":"48.000","extended":"144.000","description":"Belts (Fan, Alternator, Main)","del":"undefined"},{"receivingItemId":"19","receivingId":"9","requisitionItemId":"1","quantity":"3.000","unit":"hrs","price":"55.000","extended":"165.000","description":"Service Labor","del":"undefined"}]}';
		$rcvArr = json_decode($json);
	} else {
		if(isset($_POST)) {
			$rcvArr = json_decode(file_get_contents('php://input'));
			#echo "post_got_this_" . json_encode($save_arr);
			#echo "<pre>"; print_r($save_arr); echo "</pre>"; exit;
		} else {
			echo "POST_NOT_RECEIVED!";
			exit;
		}
	}

	if($_GET["a"]) {
		echo "array from json:<br /><br />\n";
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
	$rqInsertSQL = "INSERT INTO ${t1} SET %s";
	$rqUpdateSQL = "UPDATE ${t1} SET %s WHERE requisitionId = %s";
	$itemInsertSQL = "INSERT INTO ${t2} SET requisitionId = %s, %s";
	$itemUpdateSQL = "UPDATE ${t2} SET %s WHERE requisitionItemId = %s";
	$itemVoidSQL = "UPDATE ${t2} SET isValid = 'x" . date("ymdHi") . "' WHERE requisitionItemId = %s";

	//sqls array
	$sqls = array();
	$sqls[0] = ""; //rq sql. next ones are items sqls.

	//rq array

	$tmp = is_numeric($rqArr->poAmount) ? $rqArr->poAmount : "null";
	foreach($rqArr as $key=>$value) { $rqArr->$key = "${key} = \"" . mysqli_real_escape_string($db, $value) . "\""; }
	$rqArr->poAmount = "poAmount = " . $tmp;

	//items arrays

	$blankItemRow = array(
						"org"=>"null",
						"costCenter"=>"null",
						"task"=>"null",
						"opt"=>"null",
						"acc"=>"null",
						"quantity"=>0,
						"unit"=>"null",
						"price"=>0,
						"extended"=>0,
						"description"=>"null"
						);

	//items data and sqls
	unset($preppedItems, $rqAmount);
	unset($tmp1, $tmp2);
	foreach($items as $row) {
		$itemId = $row->requisitionItemId;
		$del = $row->del == 1 ? 1 : null;

		//prepare the item data

		$tmp = $blankItemRow;

		foreach($tmp as $key=>$type) {
			$value = $row->$key;
			if($type = 0) {
				$value = is_numeric($value) && $value >= 0 ? $value : "null";
			} else {
				$value = $value ? "\"" . mysqli_real_escape_string($db, $value) . "\"" : "null";
			}
			$tmp[$key] = "${key} = " . $value;
		}

		if(is_numeric($row->quantity) && is_numeric($row->price)) {
			$value = $row->quantity * $row->price;
			$tmp["extended"] = "extended = " . $value;
			$rqAmount += $value;
		}

		$tmp1[] = $itemId;
		$tmp2[] = $del;
		$preppedItems[] = $tmp;
	}

	if($_GET["a"]) { echo "<pre>"; print_r($preppedItems); echo "</pre>"; }

	//save the rq

	$tmp = implode(", ", (array) $rqArr);
	$tmp .=  ", rqAmount=" . $rqAmount;
	$tmp = str_replace("\"\"", "null", $tmp);
	if(!$rqId || $rqId == "new") {
		$sql = sprintf($rqInsertSQL, $tmp);
	} else {
		$sql = sprintf($rqUpdateSQL, $tmp, $rqId);
	}

	if($_GET["a"]) {
		echo "<br />RQ SQL:<br /><br />\n";
		echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br /><br />\n";
	}

	//code testing, delete for production
	$save_activity .= "$sql\n";

	$db->query($sql) or die("RQ_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	if(!$rqId || $rqId == "new") $rqId = $db->insert_id;

	//save requisition items

	if($_GET["a"]) echo "<br />RQ Items SQLs:<br /><br />\n";

	foreach($preppedItems as $i=>$row) {
		$itemId = $tmp1[$i];
		$del = $tmp2[$i];

		if(!$itemId && $del != 1) {
			//insert
			$sql = sprintf($itemInsertSQL, $rqId, implode(", ", $row));

			//code testing, delete for production
			$save_activity .= "$sql\n";

		} else if(is_numeric($itemId) && $del != 1) {
			//update
			$sql = sprintf($itemUpdateSQL, implode(", ", $row), $itemId);

			//code testing, delete for production
			$save_activity .= "$sql\n";

		} else if(is_numeric($itemId) && $del == 1) {
			//items to delete
			$sql = sprintf($itemVoidSQL, $itemId);

			//code testing, delete for production
			$save_activity .= "$sql\n";

		}

		if($_GET["a"]) echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br />\n";

		$db->query($sql) or die("RQ_Item_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	}
}
?>