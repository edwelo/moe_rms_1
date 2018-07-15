<html>
<head>
	<title> MOE Expenditure Tracker </title>

    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/frontend_functions_rq.js"></script>
    <script src="js/frontend_main.js"></script>

	<script type="text/javascript">
		var qGET = new URLSearchParams(location.search);
		if(qGET.has("pn")) {
			var page_name = qGET.get("pn");
		} else { var page_name = "Info"; }
		//wait for page to fully load, then run the javascripts
		window.onload = function() { main(); } 
	</script>
</head>
<body>

<div id="site_wrap">

	<div class="header">
	  <div class="header-left"><a href="#"> MOE Forms </a></div>
	  <div class="header-right">
		<a href="?pn=Info"> Info </a>
		<a href="?pn=Requisitioning">Requisitioning </a>
		<a href="?pn=Receiving">Receiving </a>
		<a href="?pn=Distribution">Distribution </a>
		<a href="?pn=Inventory">Inventory </a>
	  </div>
	</div>

	<!-- content -->

</div>

</body>
</html>