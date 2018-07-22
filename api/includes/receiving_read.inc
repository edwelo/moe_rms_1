<?php
//read rq, called by backend.php
//eo 180720

if($rqId && is_numeric($rqId)) {

	//one rq

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

	//receivings for the one rq

	$sql2 = "SELECT 
				* 
			FROM 
				${rcvTable} a LEFT JOIN 
				${rcvItemsTable} b ON a.receivingId=b.receivingId
			WHERE 
				a.requisitionId = ${rqId} AND 
				a.isValid NOT LIKE 'x%' AND 
				b.isValid NOT LIKE 'x%'
			";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql2) . "</p>";

	$rs = $db->query($sql2) or die("GET_ITEMS: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) { 
			if(!isset($data["rq"]["rcvlist"][$tmp["receivingId"]])) {
				$array1 = array_slice($tmp, 0, 22);
				$array1["items"] = array();
				$data["rq"]["rcvlist"][$tmp["receivingId"]] = $array1;
			}
			$array2 = array_slice($tmp, 22, 13);			
			$data["rq"]["rcvlist"][$tmp["receivingId"]]["items"][] = $array2;
		}
	}
	$data["rq"]["rcvlist"] = array_values($data["rq"]["rcvlist"]);

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