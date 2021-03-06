<?php
//read rq, called by backend.php
//eo 180717

if($rqId && is_numeric($rqId)) {

	//one rq

	$sql = "
		SELECT
			a.*,
			b.vendorId AS vId, b.vendorName AS vName,
			CONCAT(b.address1, ' ', b.address2) AS vAddress,
			CONCAT(b.city, ', ', b.state, ' ', b.zip) AS vCityStateZip,
			CONCAT(b.phone, ' ', b.fax, ' ', b.email) AS vContact,
			d.description,
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

	$sql3 = "SELECT vendorId, vendorName FROM ${vendorTable} ORDER BY vendorName, vendorId";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql3) . "</p>";

	$rs = $db->query($sql3) or die("GET_VENDORS: " . $db->error);
	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) { $data["rq"]["vendors"][$tmp["vendorId"]] = $tmp["vendorName"]; }
	}

} else {

	//list of rqs

	$sql = "
	SELECT
		a.*,
		b.vendorName, d.description AS itemDescription, SUM(IF(d.requisitionId, 1, 0)) AS numItems,
		SUM(ROUND(d.quantity * d.price, 3)) AS rqAmount
	FROM
		${rqTable} a LEFT JOIN
		${vendorTable} b ON a.vendorId=b.vendorId LEFT JOIN
		${staffTable} c ON a.preparedById=c.persid LEFT JOIN
		${rqItemsTable} d ON a.requisitionId=d.requisitionId
	WHERE
		a.isValid NOT LIKE 'void%' AND d.isValid NOT LIKE 'void%'
	GROUP BY a.requisitionId
	";

	if($page_name == "Receiving" || $page_name == "Distribution") {
		$sql = str_replace("a.isValid NOT LIKE", "a.poNo IS NOT NULL AND poNo != '' AND a.isValid NOT LIKE", $sql);
	}

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$data["rqlist"][] = $tmp;
	}

}


?>