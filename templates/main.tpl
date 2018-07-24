<html>
<head>
	<title> MOE Expenditure Tracker </title>

    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/frontend_{pn}.js?{jsForceLoad}"></script>
    <script src="js/frontend_main.js"></script>

	<script type="text/javascript">
		var test = false; //global boolean for various tests
		var rqId = 0; //0 for list view. number or 'new' for form view.
		var rcvId = 0; //0 for rcv list view. number or 'new' for form view.
		var rqItemSel; //for rq items selector in receiving detail form
		//loads the http queries
		var qGET = new URLSearchParams(location.search);
		var page_name = "";
		//wait for page to fully load, then run the javascripts
		window.onload = function() {
			page_name = document.getElementById("selected").innerHTML;
			main();
		}
	</script>
</head>
<body>

<div id="site_wrap">

	<div class="header">
	  <div class="header-left"><a href="#"> MOE Forms </a></div>
	  <div class="header-right">
	  	<div style="float: left;">
			{page_name_selector}
		</div>
		<div style="float: left; margin-left: 1em; text-align: center; font-size: small; color: white;">
			<form style="margin: none; display: inline;" name="login" action="" method=post>
				<span style="cursor: pointer;" onclick="document.login.submit()">{log_action}</span><br />
				<span id="user" style="display: inline-block; padding-top: 6px; font-size: x-small;">{cn}</span>
				<span id="userId" style="display: none;">{uidnumber}</span>
				<input type=hidden name=log_action value="{log_action}" />
			</form>
		</div>
	  </div>
	</div>

	<!-- content -->

</div>

</body>
</html>