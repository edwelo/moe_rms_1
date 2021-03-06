<?php
//rq save, called by backend.php
//eo 180717

$json = file_get_contents('php://input');

if($_GET["save"] && !$json) {
	//$json = '{"requisitionId":"20","requisitionNo":"2018-19","initiatingOffice":"dsfa","requestedBy":"dfdas","requestedDate":null,"preparedById":"709","preparedByName":"Bonnie Imeong","preparedDate":"2017-11-02","vendorId":"13","vendorName":"Jezrrae Wear II","justification":"Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450\/RP#3992.","numItems":"6","rqAmount":"2236.400","quotationId":null,"moeApprovedDate":null,"mofDeliveredDate":null,"poNo":null,"poDate":null,"poAmount":null,"rcvDate":null,"rcvBy":null,"invoiceNo":null,"invoiceAmount":null,"invoiceDate":null,"isValid":"","items":[{"requisitionItemId":"24","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOEO3","opt":null,"acc":"1420","description":"Feed Clutch","quantity":"1.000","unit":"Each","price":"375.000","extended":"375.000","fiscalYear":null,"sequenceNo":"1","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"26","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Separator Base Unit","quantity":"2.000","unit":"Each","price":"64.800","extended":"130.000","fiscalYear":null,"sequenceNo":"3","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"27","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":null,"acc":"1420","description":"Paper Feed Roller","quantity":"6.000","unit":"Each","price":"152.800","extended":"917.000","fiscalYear":null,"sequenceNo":"4","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"28","requisitionId":"20","org":"1322","costCenter":"OPR","task":"EBOE03","opt":"sdf","acc":"sdf","description":"Service Labor","quantity":"1.000","unit":"Lot","price":"55.000","extended":"55.000","fiscalYear":null,"sequenceNo":"5","rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"136","requisitionId":"20","org":"adsf","costCenter":"dsa","task":"df","opt":null,"acc":"fsad","description":"delete this too","quantity":"20.000","unit":"ea","price":"20.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""},{"requisitionItemId":"137","requisitionId":"20","org":"sdfa","costCenter":"d","task":"sasd","opt":"dd","acc":"ds","description":"666xxx","quantity":"6.000","unit":"ea","price":"60.000","extended":null,"fiscalYear":null,"sequenceNo":null,"rcvQuantity":null,"rcvPrice":null,"isValid":""}]}';
	//$json = '{"requisitionId":"new","initiatingOffice":"180718 1006","requestedBy":"edwel","preparedById":"","preparedDate":"2018-07-18","vendorId":"13","justification":"dfjo osdfj oidfj osijfjidsoji","rqAmount":"","moeApprovedDate":"","poNo":"","poDate":"","poAmount":"","items":[{"requisitionItemId":"","org":"1322","costCenter":"boe","task":"","opt":"","acc":"1420","quantity":"50","unit":"cs","price":"57","extended":"","description":"Copier Paper","del":""}]}';
	//$json = '{"requisitionId":"","initiatingOffice":"BEA","requestedBy":"Andrew Tabelual","requestedDate":"2017-10-01","preparedByName":"Bonnie Imeong","preparedById":"709","preparedDate":"2017-10-11","vendorId":"2","vendorName":"Flamingo Restaurant","rqAmount":"2000.000","approvedDate":"2017-10-20","justification":"Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.","remarks":"","mofDeliveredDate":"2017-10-21","poNo":"Temp002","poType":"Open","poDate":"2017-10-30","poAmount":"2000.000","userId":"71","items":[{"requisitionItemId":"64","org":"1322","costCenter":"EBOE03","task":"OPT","opt":"","acc":"1440","quantity":"1.000","unit":"Lot","price":"2000.000","extended":"2000.000","description":"Open PO Meeting Expenses","del":"undefined"}]}';
	$json = '{"requisitionId":"1","initiatingOffice":"PREP Program","requestedBy":"Debbie Sbal","requestedDate":"2017-08-27","preparedByName":"Ameeshi Goel","preparedById":"3999","preparedDate":"2017-08-28","vendorId":"13","vendorName":"","rqAmount":"127680.000","approvedDate":"2017-08-31","justification":"Request open purchase order for Ministry of Education, Bureau of Curriculum & Instruction for Classroom Digital Technology Component and accessories.Refer to IFB:16-17.","remarks":"","mofDeliveredDate":"2017-09-01","poNo":"L72089","poType":"R","poDate":"2017-09-08","poAmount":"127680.000","userId":"71","items":[{"requisitionItemId":"1","org":"3650","costCenter":"E73650","task":"E05","opt":"000","acc":"1555","quantity":"80.000","unit":"ea","price":"1596.000","extended":"127680.000","description":"EPSON POWERLITE EB-535W 3 LCD PROJECTOR","del":"undefined"}]}';
}

if(!$json) {
	echo "RQ_POST_NOT_RECEIVED!"; exit;
}

if(!isset($postArr)) $postArr = new stdClass();
$postArr = json_decode($json);

if($local) {
	echo "<p>JSON:<br /><span style='font-size: small;'>${json}</span></p>";
	if(is_object($postArr)) {
		echo "<p>rqID: " . $_GET["requisitionId"] . " :: " . $postArr->requisitionId . " :: " . $rqId . "</p>";
		echo "<p>Object from json:</p>";
		echo "<pre>"; print_r($postArr); echo "</pre>";
	} else {
		echo "<p>There is no array from JSON.</p>"; exit;
	}
}

$rqId = $postArr->requisitionId;

$items = $postArr->items;

//remove the following fiels from \$postArr
$tmp = array("items", "requisitionId", "description", "isValid", "rqAmount");
foreach($tmp as $key) { unset($postArr->$key); }

//tables
$t1 = "finance4.requisitions";
$t2 = "finance4.requisitions_items";

//base sqls
$rqInsertSQL = "INSERT INTO ${t1} SET %s";
$rqUpdateSQL = "UPDATE ${t1} SET %s WHERE requisitionId = %s";
$itemInsertSQL = "INSERT INTO ${t2} SET requisitionId = %s, %s";
$itemUpdateSQL = "UPDATE ${t2} SET %s WHERE requisitionItemId = %s";
$itemVoidSQL = "UPDATE ${t2} SET isValid = 'x" . date("ymdHi") . "' WHERE requisitionItemId = %s";

//sqls array
$sqls = array();
$sqls[0] = ""; //rq sql. next ones are items sqls.

//rq info

$rqInfoArr = array(
	'initiatingOffice'	 => 	$postArr->initiatingOffice																 ? 	"\"" . mysqli_real_escape_string($db, $postArr->initiatingOffice) . "\""	 : 	"NULL" 	,
	'requestedBy'		 => 	$postArr->requestedBy																	 ? 	"\"" . mysqli_real_escape_string($db, $postArr->requestedBy) . "\""		 : 	"NULL" 	,
	'requestedDate'		 => 	$postArr->requestedDate		 == date('Y-m-d', strtotime($postArr->requestedDate))		 ? 	"\"" . $postArr->requestedDate . "\""										 : 	"NULL" 	,
	'preparedById'		 => 	$postArr->preparedById																	 ? 	$postArr->preparedById													 : 	"NULL" 	,
	'preparedByName'	 => 	$postArr->preparedByName																 ? 	"\"" . mysqli_real_escape_string($db, $postArr->preparedByName) . "\""	 : 	"NULL" 	,
	'preparedDate'		 => 	$postArr->preparedDate		 == date('Y-m-d', strtotime($postArr->preparedDate))		 ? 	"\"" . $postArr->preparedDate . "\""									 : 	"NULL" 	,
	'vendorId'			 => 	$postArr->vendorId																		 ? 	$postArr->vendorId														 : 	"NULL" 	,
	'vendorName'		 => 	$postArr->vendorName																	 ? 	"\"" . mysqli_real_escape_string($db, $postArr->vendorName) . "\""		 : 	"NULL" 	,
	'justification'		 => 	$postArr->justification																	 ? 	"\"" . mysqli_real_escape_string($db, $postArr->justification) . "\""	 : 	"NULL" 	,
	'numItems'			 => 	$postArr->numItems																		 ? 	$postArr->numItems														 : 	"NULL" 	,
	'rqAmount'			 => 	$postArr->rqAmount																		 ? 	$postArr->rqAmount														 : 	"NULL" 	,
	'quotationId'		 => 	$postArr->quotationId																	 ? 	$postArr->quotationId													 : 	"NULL" 	,
	'approvedDate'		 => 	$postArr->approvedDate		 == date('Y-m-d', strtotime($postArr->approvedDate))		 ? 	"\"" . $postArr->approvedDate . "\""										 : 	"NULL" 	,
	'mofDeliveredDate'	 => 	$postArr->mofDeliveredDate	 == date('Y-m-d', strtotime($postArr->mofDeliveredDate))	 ? 	"\"" . $postArr->mofDeliveredDate . "\""									 : 	"NULL" 	,
	'poType'			 => 	$postArr->poType																		 ? 	"\"" . mysqli_real_escape_string($db, $postArr->poType) . "\""			 : 	"NULL" 	,
	'poNo'				 => 	$postArr->poNo																			 ? 	"\"" . mysqli_real_escape_string($db, $postArr->poNo) . "\""				 : 	"NULL" 	,
	'poDate'			 => 	$postArr->poDate			 == date('Y-m-d', strtotime($postArr->poDate))				 ? 	"\"" . $postArr->poDate . "\""											 : 	"NULL" 	,
	'poAmount'			 => 	$postArr->poAmount																		 ? 	$postArr->poAmount														 : 	"NULL" 	,
	'status'			 => 	$postArr->status																		 ? 	"\"" . mysqli_real_escape_string($db, $postArr->status) . "\""			 : 	"NULL" 	,
	'statusDate'		 => 	$postArr->statusDate		 == date('Y-m-d', strtotime($postArr->statusDate))			 ? 	"\"" . $postArr->statusDate . "\""											 : 	"NULL" 	,
	'remarks'			 => 	$postArr->remarks																		 ? 	"\"" . mysqli_real_escape_string($db, $postArr->remarks) . "\""			 : 	"NULL"
);

$tmp = "";
foreach($rqInfoArr as $key=>$value) { $tmp .= "$key = $value, "; }
$tmp = trim($tmp, ", ");

if($rqId == "new" || !$rqId) {
	$tmp .= ", enteredBy = " . $postArr->userId . ", enteredDate = NOW()";
	$sql = sprintf($rqInsertSQL, $tmp);
	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";
	$db->query($sql) or die("RQ_Insert_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
	$rqId = $db->insert_id;
} else {
	$tmp .= ", modifiedBy = " . $postArr->userId . ", modifiedDate = NOW()";
	$sql = sprintf($rqUpdateSQL, $tmp, $rqId);
	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";
	$db->query($sql) or die("RQ_Update_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
}

if($local) {
	echo "<p>RQ SQL:<br /><span style='font-size: small;'" . str_replace("<", "&lt;", $sql) . "</span></p>";
}

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

if($local) { echo "<pre>"; print_r($preppedItems); echo "</pre>"; }

//save the rq

if($local) {
	echo "<br />RQ SQL:<br /><br />\n";
	echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br /><br />\n";
}

//code testing, delete for production
$save_activity .= "$sql\n";

$db->query($sql) or die("RQ_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
if(!$rqId || $rqId == "new") $rqId = $db->insert_id;

//save requisition items

if($local) echo "<br />RQ Items SQLs:<br /><br />\n";

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

	if($local) echo "<span style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</span><br /><br />\n";

	$db->query($sql) or die("RQ_Item_Save_Error: " . $db->error . "<br />\n<code>${sql}</code>\n");
}

?>