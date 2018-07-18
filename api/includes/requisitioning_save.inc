<?php
//rq save, called by backend.php
//eo 180717

	if($_GET["a"]) {
		echo "json from \$_GET[\"save\"]:<br /><br />\n" . $_GET["save"] . "<br /><br />\n";
		//$json = '{"requisitionId":"20","requisitionNo":"2018-19","initiatingOffice":"dsfa","requestedBy":"dfdas","requestedDate":null,"preparedById":"709","preparedByName":"Bonnie Imeong","preparedDate":"2017-11-02","vendorId":"13","vendorName":"Jezrrae Wear II","justification":"Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450\/RP#3992.","numItems":"6","rqAmount":"2236.400","quotationId":null,"moeApprovedDate":null,"mofDeliveredDate":null,"poNo":null,"poDate":null,"poAmount":null,"rcvDate":null,"rcvBy":null,"invoiceNo":null,"invoiceAmount":null,"invoiceDate":null,"isValid":"","items":[{"requisitionItemId":"24","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOEO3","opt":null,"acc":"1420","description":"Feed Clutch","quantity":"1.000","unit":"Each","price":"375.000","extended":"375.000","fiscalYear":null,"sequenceNo":"1","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"26","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Separator Base Unit","quantity":"2.000","unit":"Each","price":"64.800","extended":"130.000","fiscalYear":null,"sequenceNo":"3","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"27","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Paper Feed Roller","quantity":"6.000","unit":"Each","price":"152.800","extended":"917.000","fiscalYear":null,"sequenceNo":"4","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"28","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":"sdf","acc":"sdf","description":"Service Labor","quantity":"1.000","unit":"Lot","price":"55.000","extended":"55.000","fiscalYear":null,"sequenceNo":"5","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"136","requisitionId":"20","org":"adsf","costCenter":"dsa","task":"df","opt":null,"acc":"fsad","description":"delete this too","quantity":"20.000","unit":"ea","price":"20.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"137","requisitionId":"20","org":"sdfa","costCenter":"d","task":"sasd","opt":"dd","acc":"ds","description":"666xxx","quantity":"6.000","unit":"ea","price":"60.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""}]}';
		$json = '{"requisitionId":"new","initiatingOffice":"180718 1006","requestedBy":"edwel","preparedById":"","preparedDate":"2018-07-18","vendorId":"13","justification":"dfjo osdfj oidfj osijfjidsoji","rqAmount":"","moeApprovedDate":"","poNo":"","poDate":"","poAmount":"","items":[{"requisitionItemId":"","org":"1322","costCenter":"boe","task":"","opt":"","acc":"1420","quantity":"50","unit":"cs","price":"57","extended":"","description":"Copier Paper","del":""}]}';
		$rqArr = json_decode($json);
		echo "<p>json from \$_POST:<br /><span style='font-size: small;'>${json}</span></p>";
		echo "<p>rqID: " . $_GET["requisitionId"] . " :: " . $rqArr->requisitionId . " :: " . $rqId . "</p>";
	} else {
		if(isset($_POST)) {
			$rqArr = json_decode(file_get_contents('php://input'));
			#echo "post_got_this_" . json_encode($save_arr);
			#echo "<pre>"; print_r($save_arr); echo "</pre>"; exit;
		} else {
			echo "POST_NOT_RECEIVED!";
			exit;
		}
	}

	if($_GET["a"]) {
		echo "array from json:<br /><br />\n";
		echo "<pre>"; print_r($rqArr); echo "</pre>";
	}

	if(!isset($rqArr)) $rqArr = new stdClass();

	$rqId = $rqArr->requisitionId;
		
	$items = $rqArr->items;
	
	//remove the following fiels from \$rqArr
	$tmp = array("items", "requisitionId", "description", "isValid", "rqAmount");
	foreach($tmp as $key) { unset($rqArr->$key); }

	//tables
	$t1 = "finance3.requisitions";
	$t2 = "finance3.requisitions_items";

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

?>