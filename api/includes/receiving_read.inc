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

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

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

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

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

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

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

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

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

	$sql = "
	SELECT
		a.requisitionId, a.numItems, a.poNo, a.poType, a.poAmount, a.poDate,
		a.vendorName, a.justification,
		COUNT(b.receivingId) AS rcvActivityCount,
		SUM(b.invoiceAmount) AS rcvActivityAmount,
		NULL AS distribActivityCount,
		NULL AS distribActivityAmount,
		a.status, a.statusDate
	FROM
		${rqTable} a LEFT JOIN ${rcvTable} b ON a.requisitionId=b.requisitionId
	WHERE
		a.isValid NOT LIKE 'void%' AND b.isValid NOT LIKE 'x%' AND a.poNo IS NOT NULL AND a.poNO != ''
	GROUP BY
		a.requisitionId
	";

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$result1[$tmp["requisitionId"]] = $tmp;
	}

	//distribution activity count
	$sql = "
	SELECT t1.requisitionId, COUNT(t1.dCount) AS dCount FROM
		(SELECT
			a.requisitionId, COUNT(b.distributionId) AS dCount
		FROM
			${rcvItemsTable} a, ${distribItemsTable} b
		WHERE
			a.receivingItemId = b.receivingItemId AND
			a.isValid NOT LIKE 'x%' AND b.isValid NOT LIKE 'x%'
		GROUP BY a.requisitionId, b.distributionId) t1
	GROUP BY t1.requisitionId
	";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$result1[$tmp["requisitionId"]]["distribActivityCount"] = $tmp["dCount"];
	}

	//distribution activity amount
	$sql = "
	SELECT
		a.requisitionId, SUM(b.quantity * a.price) AS amount
	FROM
		${rcvItemsTable} a, ${distribItemsTable} b
	WHERE
		a.receivingItemId = b.receivingItemId AND
		a.isValid NOT LIKE 'x%' AND b.isValid NOT LIKE 'x%'
	GROUP BY
		a.requisitionId
	";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$result1[$tmp["requisitionId"]]["distribActivityAmount"] = $tmp["amount"];
	}

	foreach($result1 as $row) { $data["rqlist"][] = $row; }

}


?>