//rq listfunction rq_list(myRequisitions) {	document.getElementById("listView").style.display = "block";	document.getElementById("formView").style.display = "none";	//get the rqListTable	var tbl = document.getElementById("rqListTable");	//the data field names are specified in a hidden caption of	//the rqListTable. Here we load them into 'col' variable.	var col = tbl.caption.innerText.trim().split(",");	// ADD JSON DATA TO THE TABLE AS ROWS.	for (var i = 0; i < myRequisitions.length; i++) {		//check if there is a row. if not, add it.		if(tbl.rows[i + 1] === undefined) {			var cln = tbl.rows[i].cloneNode(true);			tbl.appendChild(cln);		}		var tr = tbl.rows[i + 1];		//populate the spans of the row		var spans = tr.getElementsByTagName("span");		for (var j = 0; j < col.length; j++) {			spans[j].innerHTML = myRequisitions[i][col[j]];		}		//set the onclick and the cursor of this table row		var onclickStr = "setRQId(" + myRequisitions[i]["requisitionId"] + ")";		tr.setAttribute('onclick', onclickStr)	}}//rq formfunction rq_form(myRequisition) {	document.getElementById("listView").style.display = "none";	document.getElementById("formView").style.display = "block";	document.getElementById("rqId").innerHTML = rqId;	if(rqId == "new") {		var user = document.getElementById("user").innerHTML;		var userId = document.getElementById("userId").innerHTML;		//alert(user + " :: " + userId);		clearForm();		var inputs = document.getElementById("rqData").getElementsByTagName("input");		for(i=0, l=inputs.length; i<l; i++) {			if(inputs[i].name == "preparedByName") {				//alert("Gonna insert " + user + " into " + inputs[i].name);				inputs[i].value = user;			}			if(inputs[i].name == "preparedById") {				//alert("Gonna insert " + userId + " into " + inputs[i].name);				inputs[i].value = userId;			}		}	}	//populate the rq data elements	if(typeof myRequisition == "object") {		var obj = document.getElementById("rqData").getElementsByTagName("input");		for(i=0, l=obj.length; i<l; i++) {			obj[i].value = myRequisition[obj[i].name];			//console.log(obj[i].name + ": " + myRequisition[obj[i].name]);		}		//populate the rq items data elements		var tbl = document.getElementById("items_table");		var numRqItems = myRequisition.items.length;		//delete table rows if necessary		while(tbl.rows[numRqItems + 1] !== undefined) {			tbl.deleteRow(numRqItems + 1);		}		for (i = 0; i < numRqItems; i++) {			//check if there is a row. if not, add it.			if(tbl.rows[i + 1] === undefined) {				var cln = tbl.rows[i].cloneNode(true);				tbl.appendChild(cln);			}			var inputs = tbl.rows[i + 1].getElementsByTagName("input");			for(j=0, l=inputs.length; j<l; j++) {				inputs[j].value = myRequisition["items"][i][inputs[j].name];			}			inputs[l - 1].checked = false;		}	}}//copy last row, clear it and append to tablefunction copyRow(tableId) {	var tbl = document.getElementById(tableId);	var lastRow = tbl.rows.length - 1;	var cln = tbl.rows[lastRow].cloneNode(true);	inputs = cln.getElementsByTagName("input");	for(j=0, l=inputs.length; j<l; j++) {		inputs[j].value = "";	}	tbl.appendChild(cln);}//delete last row from table if it is blankfunction deleteRow(tableId) {	var tbl = document.getElementById(tableId);	var lastRow = tbl.rows.length - 1;	inputs = tbl.rows[lastRow].getElementsByTagName("input");	var noContent = true;	for(j=0, l=inputs.length; j<l; j++) {		if(inputs[j].name == "requisitionItemId") {			if(inputs[j].value.length > 0) { noContent = false; break; }		}	}	if(noContent && lastRow > 1) {		tbl.deleteRow(lastRow);	}}//set the rqId and call mainfunction setRQId(value) {	rqId=value;	main();}//clear the form for a new rqfunction clearForm() {	var tbl = document.getElementById("items_table");	var excessRows = tbl.rows.length - 2;	if(excessRows > 0) {		for(i=0; i<excessRows; i++) {			tbl.deleteRow(2);		}	}	var inputs = document.getElementById("rqData").getElementsByTagName("input");	for(let i=0, l=inputs.length; i<l; i++) {		inputs[i].value = "";	}}function rq_form_validate() {	var valid = true;	//rq data	var inputs = document.getElementById("rqData").getElementsByTagName("input");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			//if(name == "initiatingOffice") { valid = false; break; }			if(name == "preparedDate") { valid = false; break; }			if(name == "vendorId") { valid = false; break; }			if(name == "justification") { valid = false; break; }		}	}	//rq items, checking row 1	var inputs = document.getElementById("items_table").rows[1].getElementsByTagName("input");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			if(name == "quantity") { valid = false; break; }			if(name == "unit") { valid = false; break; }			if(name == "price") { valid = false; break; }			if(name == "description") { valid = false; break; }		}	}	return valid;}function save() {	if(rq_form_validate() == true) {		var rqId = document.getElementById("rqId").innerHTML;		if(Number(rqId) == rqId || rqId == "new") {			var text = {};			text["requisitionId"] = rqId;			//get the requisition info			var inputs = document.getElementById("rqData").getElementsByTagName("input");			for(i=0, l=inputs.length; i<l; i++) {				if(inputs[i].name == "preparedByName" || !inputs[i].disabled) text[inputs[i].name] = inputs[i].value;			}			var items_list = [];			//get the items info			var rows = document.getElementById("items_table").rows;			if(page_name == "Requisitioning") {				for (i = 1, l=rows.length; i < l; i++) {					items_list[i-1] = {};					var inputs2 = rows[i].getElementsByTagName("input");					for(j=0, jl=inputs2.length; j<jl; j++) {						items_list[i - 1][inputs2[j].name] = inputs2[j].value;					}					//mark the deletes, skipping the first item.					if(inputs2[jl - 1].checked == true && i > 1) { {						items_list[i - 1]["del"] = 1; }					}				}			}			if(page_name == "Receiving") {				for (i = 1, l=rows.length; i < l; i++) {					items_list[i-1] = {};					let itemId = items_list[i - 1]["requisitionItemId"] = null;					var inputs2 = rows[i].getElementsByTagName("input");					for(j=0, jl=inputs2.length; j<jl; j++) {						if(inputs2[j].name == "requisitionItemid") {							itemId = inputs2[j].value						} else {							items_list[i - 1][inputs2[j].name] = inputs2[j].value;							if(!inputs2[j].disabled) text[inputs[i - 1].name] = inputs2[j].value;						}					}				}			}			text["items"] = items_list;			return JSON.stringify(text);		}	} else {		alert("Could not save. Incomplete data.");	}}function print_rq() {	rqId = document.getElementById("rqId").innerText;	window.open("api/print.php?pn=Requisitioning&requisitionId=" + rqId);}