//front end mainfunction main(prm) {	if(page_name != "Info") {		var json = null;		var url = "api/backend.php?pn=" + page_name;		if(rqId) url += "&requisitionId=" + rqId;		if(prm == "button") {			url += "&save=1";			var json = save();		}		//alert(url);		//alert((typeof json == "string") + "\n" + (rqId !== "new"));		var xmlhttp = new XMLHttpRequest();		xmlhttp.onreadystatechange = function() {			if (this.readyState == 4 && this.status == 200) {				//console.log(this.responseText);				obj = JSON.parse(this.responseText);				if(obj == null) alert("No purchase orders found!\nPls check with Bonnie if there are any.");				type = Object.keys(obj)[0]; //either 'rq' or 'rqlist'				if(type == "rqlist") {					rq_list(obj[type]); //does the rq list				} else {					//console.log(this.responseText);					switch(page_name) {						case "Requisitioning":							rqId = obj[type]["requisitionId"];							break;						case "Receiving":							rqId = obj[type]["requisitionId"];							break;						case "Distribution":							rqId = obj[type]["distrib"]["distributionId"];							//addRowHandlers();							break;						case "Inventory":							rqId = obj[type]["inventoryId"];							break;						default:							alert("Bad Page Name!");							exit;					}					rq_form(obj[type]); //does the rq form				}			}		}		if(rqId == "new") rq_form();		if(typeof json == "string") {			//alert(url + "\n" + json);			console.log("JSON: " + json);			xmlhttp.open("POST", url, true);			//xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');			//xmlhttp.setRequestHeader('Content-type','application/json; charset=utf-8');			xmlhttp.setRequestHeader('Content-type','application/json');			xmlhttp.send(json);		} else if(rqId !== "new") {			//alert("GETting " + page_name + " data from " + url);			xmlhttp.open("GET", url, true);			xmlhttp.send();		}	}}