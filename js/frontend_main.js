//front end mainfunction main(params) {	if(page_name != "Info") {		var json = null;		var url = "api/backend.php?pn=" + page_name;		if(rqId) url += "&requisitionId=" + rqId;		if(qGET.get("t1")) url += "&t1=" + qGET.get("t1");		if(params == "save") {			//alert("saving");			url += "&save=1";			var json = save();		}				var xmlhttp = new XMLHttpRequest();		xmlhttp.onreadystatechange = function() {			if (this.readyState == 4 && this.status == 200) {				console.log(this.responseText);				obj = JSON.parse(this.responseText);				if(obj == null) alert("No purchase orders found!\nPls check with Bonnie if there are any.");				type = Object.keys(obj)[0]; //either 'rq' or 'rqlist'				if(type == "rqlist") {					switch(page_name) {						case "Utilities":							if(qGET.get("t1") == "Vendors") {								list(obj[type]); //does the rq form							}							break;												default:											rq_list(obj[type]);					}				} else {					switch(page_name) {						case "Requisitioning":							rqId = obj[type]["requisitionId"];							rq_form(obj[type]); //does the rq form							break;						case "Receiving":							rqId = obj[type]["requisitionId"];							rq_form(obj[type]); //does the rq form							break;						case "Distribution":							if(obj[type]["distrib"] != undefined) {								rqId = obj[type]["distrib"]["distributionId"];							}							rq_form(obj[type]); //does the rq form							break;						case "Inventory":							rqId = obj[type]["inventoryId"];							rq_form(obj[type]); //does the rq form							break;						case "Utilities":							if(qGET.get("t1") == "Vendors") {								rqId = obj[type].vendorId;								form(obj[type]); //does the rq form							}							break;						default:							alert("Bad Page Name!");							return;					}				}			}		}				function ajax_post() {			//alert(url + "\n" + json);			console.log("JSON: " + json);			xmlhttp.open("POST", url, true);			//xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');			//xmlhttp.setRequestHeader('Content-type','application/json; charset=utf-8');			xmlhttp.setRequestHeader('Content-type','application/json');			xmlhttp.send(json);		}				function ajax_get() {			//alert("GETting " + page_name + " data from " + url);			xmlhttp.open("GET", url, true);			xmlhttp.send();		}		if(page_name=="Requisitioning" && rqId=="new") rq_form();		if(page_name=="Utilities" && rqId=="new") form();		if(page_name=="Utilities") {			if(!qGET.has("t1")) {				return;			} else {				if(qGET.get("t1") != "Vendors") return;			}		}				if(typeof json == "string") {			ajax_post();		} else {			ajax_get();		}	}}