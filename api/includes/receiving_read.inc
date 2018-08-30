<?php
//read rq, called by backend.php
//eo 180720

if($rqId && is_numeric($rqId)) {

	//#########
	//## one rq
	//#########

	$sql = "
		SELECT
			*
		FROM
			${rqTable}
		WHERE
			isValid NOT LIKE 'void%' AND
			requisitionId=${rqId}
		";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RQ: " . $db->error . $sqlHTML);
	$data["rq"] = $rs->fetch_assoc();
	$data["rq"]["items"] = array();
	$data["rq"]["rcvlist"] = array();

	//#########
	//## one rq's items to be used in receiving items selector
	//#########

	$sql = "SELECT
				*
			FROM
				${rqItemsTable}
			WHERE
				requisitionId = ${rqId} AND
				isValid NOT LIKE 'x%'
			";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RQ_ITEMS: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			$data["rq"]["items"][$tmp["requisitionItemId"]] = $tmp;
		}
	}

	//Reset the indexes so it is non-associative for later use by javascript
	$data["rq"]["items"] = array_values($data["rq"]["items"]);

	//#########
	//## receivings for the one rq
	//#########

	$sql = "SELECT *
			FROM ${rcvTable}
			WHERE
				requisitionId = ${rqId} AND
				isValid NOT LIKE 'x%'";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RCV: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			unset($tmp["isValid"]);
			$tmp["items"] = array();
			$data["rq"]["rcvlist"][$tmp["receivingId"]] = $tmp;
		}
	}

	//#########
	//## items for each of the receivings above
	//#########

	$sql = "SELECT
				b.*
			FROM
				${rcvTable} a, ${rcvItemsTable} b
			WHERE
				a.receivingId=b.receivingId AND
				a.requisitionId = ${rqId} AND
				a.isValid NOT LIKE 'x%' AND
				b.isValid NOT LIKE 'x%'
			";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RCV_ITEMS: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			unset($tmp["isValid"]);
			$data["rq"]["rcvlist"][$tmp["receivingId"]]["items"][] = $tmp;
		}
	}

	//Reset the indexes so it is non-associative for later use by javascript
	$data["rq"]["rcvlist"] = array_values($data["rq"]["rcvlist"]);

	if($newSaved) {
		$data["rq"]["newSaved"] = $newSaved;
	}

} else {

	//list of pos
	
	unset($data, $tmp2);

	$sql = "
	SELECT
		requisitionId, numItems, poNo, poType, poAmount, poDate,
		vendorName, justification,
		0 AS rcvActivityCount,
		0 AS rcvActivityAmount,
		0 AS distribActivityCount,
		0 AS distribActivityAmount,
		status, statusDate
	FROM
		${rqTable}
	WHERE
		isValid NOT LIKE 'void%' AND poNo IS NOT NULL AND poNO != ''
	";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$tmp2[$tmp["requisitionId"]] = $tmp;
	}

	$sql = "
	SELECT
		requisitionId,
		COUNT(*) AS rcvActivityCount,
		SUM(invoiceAmount) AS rcvActivityAmount
	FROM
		${rcvTable}
	WHERE
		isValid NOT LIKE 'x%'
	GROUP BY
		requisitionId
	";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_RCV_COUNTS: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$tmp2[$tmp["requisitionId"]]["rcvActivityCount"] = $tmp["rcvActivityCount"];
		$tmp2[$tmp["requisitionId"]]["rcvActivityAmount"] = $tmp["rcvActivityAmount"];
	}

	//distribution activity count
	$sql = "
	SELECT t1.requisitionId, COUNT(t1.dCount) AS dCount FROM
		(SELECT c.requisitionId, COUNT(b.distributionId) AS dCount 
		FROM finance4.receiving_items a, finance4.distributions_items b, finance4.receiving c 
		WHERE a.receivingItemId = b.receivingItemId AND a.receivingId=c.receivingId AND a.isValid NOT LIKE 'x%' AND b.isValid NOT LIKE 'x%' 
		GROUP BY a.requisitionId, b.distributionId) t1
	GROUP BY t1.requisitionId
	";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_DISTR_COUNTS: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$tmp2[$tmp["requisitionId"]]["distribActivityCount"] = $tmp["dCount"];
	}

	//distribution activity amount
	$sql = "
	SELECT
		c.requisitionId, SUM(b.quantity * a.price) AS amount
	FROM
		${rcvItemsTable} a, ${distribItemsTable} b, ${rcvTable} c
	WHERE
		a.receivingItemId = b.receivingItemId AND 
		a.receivingID = c.receivingId AND 
		a.isValid NOT LIKE 'x%' AND b.isValid NOT LIKE 'x%'
	GROUP BY
		a.requisitionId
	";

	if($local) printf($smallP, str_replace("<", "&lt;", $sql) . ";");

	$rs = $db->query($sql) or die("GET_DISTR_AMOUNT: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$tmp2[$tmp["requisitionId"]]["distribActivityAmount"] = $tmp["amount"];
	}
	
	$data["rqlist"] = array_values($tmp2);

}


?>