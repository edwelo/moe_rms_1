<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" type="text/css" href="html/main.css">
    <title>RQ->RCV->DIST Tracker Backend</title>
</head>
<body>

<h3>Welcome to the MOE Expenditure Tracker App Backend</h3>

<p>
<span>Get the Data </span><span class=lbl1>(Leave rqId empty to see list)</span><span>:</span><br />
<form id=pn class=frm1 action="" method=get>
	<input type=radio name=pn value="Requisitioning" />Requisitioning &nbsp;&nbsp;
	<input type=radio name=pn value="Receiving" />Receiving &nbsp;&nbsp;
	<input type=radio name=pn value="Distribution" />Distribution &nbsp;&nbsp;
	<input type=radio name=pn value="Inventory" />Inventory &nbsp;&nbsp;
	<span>rqId</span>
	<input type=text name=requisitionId value="{rqId}" size=5 /> &nbsp;&nbsp;
	<input type=submit value=go />
</form>
</p>

<p>
<span style='color: grey;'>Utilities:</span>&nbsp;&nbsp;
[ <a href="?pn=Utilities">Utilities</a> ]
[ <a href="?pn=Utilities&t1=Vendors">Vendors</a> ]
[ <a href="?pn=Utilities&t1=Orgs">Orgs</a> ]
[ <a href="?pn=Utilities&t1=Tasks">Tasks</a> ]
[ <a href="?pn=Utilities&t1=Cost Centers">Cost Centers</a> ]
</p>
