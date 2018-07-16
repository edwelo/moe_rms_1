<html>
<head>
	<title> MOE Expenditure Tracker </title>

    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/frontend_functions_rq.js"></script>
    <script src="js/frontend_main.js"></script>

	<script type="text/javascript">
		var test = false; //global boolean for various tests
		var rqId = 0; //0 for list view. number or 'new' for form view.
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
		{page_name_selector}
	  </div>
	</div>

	<!-- content -->

</div>

</body>
</html>