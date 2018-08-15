<?php
//read rq, called by backend.php
//eo 180717

if($rqId && (is_numeric($rqId) || $rqId=="new")) {

	//one rq
	if($rqId != "new") {
		$sql = "SELECT
					a.*, b.*, c.description, e.poNo
				FROM
					$distribTable a, $distribItemsTable b,
					$rcvItemsTable c, $rcvTable d,
					$rqTable e
				WHERE
					a.distributionId=b.distributionId AND
					b.receivingItemId=c.receivingItemId AND
					c.receivingId=d.receivingId AND
					d.requisitionId=e.requisitionId AND
					a.distributionId=${rqId}";

		$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

		$rs = $db->query($sql) or die("GET_DISTRIB: " . $db->error . $sqlHTML);

		if(mysqli_num_rows($rs)) {
			while($tmp = $rs->fetch_assoc()) {
				if(!isset($data["rq"]["distrib"])) {
					$data["rq"]["distrib"] = array_slice($tmp, 0, 12);
				}
				$data["rq"]["distribItems"][] = array_slice($tmp, 12, 9);
			}
		}
	}

	$sql = "SELECT
				e.poNo, d.receivingId, c.receivingItemId,
				c.requisitionItemId, c.description, c.quantity
			FROM
				$rcvItemsTable c, $rcvTable d,
				$rqTable e
			WHERE
				c.receivingId=d.receivingId AND
				d.requisitionId=e.requisitionId
			ORDER BY
				e.poNo, c.receivingItemId";

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

	$rs = $db->query($sql) or die("GET_DISTRIB: " . $db->error . $sqlHTML);

	if(mysqli_num_rows($rs)) {
		while($tmp = $rs->fetch_assoc()) {
			$data["rq"]["rcv"][] = $tmp;
		}
	}


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

	$sqlHTML .= "<p style='font-size: small;'>" . str_replace("<", "&lt;", $sql) . "</p>";

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

	if(is_array($data["rqlist"])) $data["rqlist"] = array_values($data["rqlist"]);
}


?>