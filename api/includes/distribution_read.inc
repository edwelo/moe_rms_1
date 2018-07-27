<?php
//read rq, called by backend.php
//eo 180717

if($rqId && is_numeric($rqId)) {

	//one rq

	$sql = "
		SELECT
			*
		FROM
			${distribTable} a LEFT JOIN
			${distribItemsTable} b ON a.distributionId=b.distributionId
		WHERE
			a.isValid NOT LIKE 'x%' AND
			b.isValid NOT LIKE 'x%' AND
			a.distributionId=${rqId}";

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ: " . $db->error . $sqlHTML);

	$data["rq"]["distrib"] = array();
	$data["rq"]["rcv"] = array();

	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			$distId = $tmp["distributionId"];
			$array1 = array_slice($tmp, 0, 12);
			$array2 = array_slice($tmp, 12, 9);
			if(!isset($data["rq"]["distrib"]["distributionId"])) {
				$array1["numItems"] = 0;
				$array1["items"] = array();
				$data["rq"]["distrib"] = $array1;
			}
			$data["rq"]["distrib"]["numItems"]++;
			$data["rq"]["distrib"]["items"][] = $array2;
		}
	}

	$sql = "
		SELECT
			a.poNo, a.poDate, a.requisitionId, d.requisitionItemId,
			b.receivingId, c.receivingItemId, c.description, c.quantity
		FROM
			${rqTable} a,
			${rcvTable} b,
			${rcvItemsTable} c,
			${rqItemsTable} d
		WHERE
			a.requisitionId=b.requisitionId AND
			b.receivingId=c.receivingId AND
			c.requisitionItemId=d.requisitionItemId AND
			a.isValid NOT LIKE 'void%' AND
			b.isValid NOT LIKE 'x%' AND
			c.isValid NOT LIKE 'x%' AND
			d.isValid NOT LIKE 'x%'
	";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RCVs: " . $db->error . $sqlHTML);

	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			$poNo = $tmp["poNo"];
			$array1 = array_slice($tmp, 0, 2);
			$array2 = array_slice($tmp, 2, 7);
			if(!isset($tmp[$poNo])) {
				$array1["items"] = array();
				$tmp[$poNo] = $array1;
			}
			$tmp2[$poNo]["items"][] = $array2;
		}
	}

	$data["rq"]["rcv"] = array_values($tmp2);

} else {

	//list of rqs

	$sql = "
	SELECT
		a.*,
		SUM(IF(b.distributionId, 1, 0)) AS numItems
	FROM
		${distribTable} a LEFT JOIN
		${distribItemsTable} b ON a.distributionId=b.distributionId
	WHERE
		a.isValid NOT LIKE 'void%' AND b.isValid NOT LIKE 'void%'
	GROUP BY a.distributionId
	";

	$sqlHTML = "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_RQ_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$tmp["refPOs"] = "";
		$data["rqlist"][$tmp["distributionId"]] = $tmp;
	}

	$sql2 = "SELECT
				a.distributionId,
				a.distributionItemId,
				a.requisitionItemId,
				b.requisitionId,
				c.poNo
			FROM
				${distribItemsTable} a,
				${rqItemsTable} b,
				${rqTable} c
			WHERE
				a.requisitionItemId=b.requisitionItemId AND
				b.requisitionId=c.requisitionId
			GROUP BY a.distributionId, c.poNo";


	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql2) . "</p>";

	$rs = $db->query($sql2) or die("GET_PO_LIST: " . $db->error . $sqlHTML);
	while($tmp = $rs->fetch_assoc()) {
		$data["rqlist"][$tmp["distributionId"]]["refPOs"] .= $tmp["poNo"] . " ";
	}

	$data["rqlist"] = array_values($data["rqlist"]);
}


?>