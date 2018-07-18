<?php
//Distribution module
//read rq, called by backend.php
//eo 180719

if($rqId && is_numeric($rqId)) {

	//one rq

	$sql = "
		SELECT
			a.*,
			b.vendorName, d.description,
			SUM(IF(d.requisitionId, 1, 0)) AS numItems,
			SUM(ROUND(d.quantity * d.price, 3)) AS rqAmount
		FROM
			${rqTable} a LEFT JOIN
			${vendorTable} b ON a.vendorId=b.vendorId LEFT JOIN
			${staffTable} c ON a.preparedById=c.persid LEFT JOIN
			${rqItemsTable} d ON a.requisitionId=d.requisitionId AND d.isValid NOT LIKE 'x%'
		WHERE
			a.isValid NOT LIKE 'void%' AND
			a.requisitionId=${rqId}";

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ: " . $db->error . $sqlHTML);
	$data["rq"] = $rs->fetch_assoc();

	//items for the one rq

	$sql2 = "SELECT * FROM ${rqItemsTable} WHERE requisitionId = ${rqId} AND isValid NOT LIKE 'x%'";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql2) . "</p>";

	$rs = $db->query($sql2) or die("GET_ITEMS: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) { $data["rq"]["items"][] = $tmp; }
	}

} else {
	//list of rqs for left distribution table

	$sql = "
	SELECT
		a.requisitionId, a.poNo, a.poAmount, a.vendorName, a.initiatingOffice, 
		a.preparedByName, a.justification,
		b.requisitionItemId,
		b.org, b.costCenter, b.acc, b.quantity, b.description
	FROM
		${rqTable} a, ${rqItemsTable} b 
	WHERE
		a.requisitionId=b.requisitionId AND
		a.isValid NOT LIKE 'void%' AND 
		b.isValid NOT LIKE 'x%' AND
		a.poNo IS NOT NULL AND
		a.poNo != ''
	";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$rqId = $tmp["requisitionId"];
		$array1 = array_slice($tmp, 0, 7);
		$array2 = array_slice($tmp, 7, 6);
		
		if(!isset($tmp2[$rqId])) {
			$tmp2[$rqId] = $array1;
		}
		
		$tmp2[$rqId]["items"][] = $array2;
		
	}
	
	foreach($tmp2 as $row) {
		$data["rqlist"][] = $row;
	}

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

}


?>