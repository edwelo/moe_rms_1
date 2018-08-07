//rq listfunction rq_list(myRequisitions) {	document.getElementById("listView").style.display = "block";	document.getElementById("formView").style.display = "none";	//get the rqListTable	var tbl = document.getElementById("listTable");	//the data field names are specified in a hidden caption of	//the rqListTable. Here we load them into 'col' variable.	var col = tbl.caption.innerText.trim().split(",");	// ADD JSON DATA TO THE TABLE AS ROWS.	for (var i = 0; i < myRequisitions.length; i++) {		//check if there is a row. if not, add it.		if(tbl.rows[i + 1] === undefined) {			var cln = tbl.rows[i].cloneNode(true);			tbl.appendChild(cln);		}		var tr = tbl.rows[i + 1];		//populate the spans of the row		var spans = tr.getElementsByTagName("span");		for (var j = 0; j < col.length; j++) {			spans[j].innerHTML = myRequisitions[i][col[j]];		}		//set the onclick and the cursor of this table row		var onclickStr = "setRQId(" + myRequisitions[i]["distributionId"] + ")";		tr.setAttribute('onclick', onclickStr)	}}//rq formfunction rq_form(myRequisition) {	document.getElementById("listView").style.display = "none";	document.getElementById("formView").style.display = "block";	document.getElementById("rqId").innerHTML = rqId;	if(rqId == "new") {		var user = document.getElementById("user").innerHTML;		var userId = document.getElementById("userId").innerHTML;		//alert(user + " :: " + userId);		clearForm();		var inputs = document.getElementById("distInfo").getElementsByTagName("input");		for(i=0, l=inputs.length; i<l; i++) {			if(inputs[i].name == "preparedByName") {				//alert("Gonna insert " + user + " into " + inputs[i].name);				inputs[i].value = user;			}			if(inputs[i].name == "preparedById") {				//alert("Gonna insert " + userId + " into " + inputs[i].name);				inputs[i].value = userId;			}		}	}	//populate the rq data elements	if(typeof myRequisition == "object") {		//console.log(myRequisition.rcv);		//console.log(myRequisition.distrib);		//form view left panel stuff		var tbl = document.getElementById("rcvTable");		// ADD JSON DATA TO THE TABLE AS ROWS.		var rcvData = myRequisition["rcv"];		var rowNum = 0;		for (var i = 0; i < rcvData.length; i++) {			rowNum++;			//check if there is a row. if not, add it.			if (tbl.rows[rowNum] == undefined) {				var cln = tbl.rows[i].cloneNode(true);				tbl.appendChild(cln);			}			var tr = tbl.rows[rowNum];			var datas = tr.getElementsByTagName("data");			for(j=0, jl=datas.length; j < jl; j++) {				var fieldName = datas[j].value;				datas[j].innerHTML = rcvData[i][fieldName];			}		}		//form view right panel stuff		// ADD JSON DATA TO THE right TABLE AS ROWS.		if(rqId != "new") {			var distribData = myRequisition["distrib"];			var data;			//populate the distrib with distribution data			var frmInfo = document.getElementById("distInfo");			var inputs = frmInfo.getElementsByTagName("input");			for(i=0, l=inputs.length; i<l; i++) {				fieldName = inputs[i].name;				data = distribData[fieldName];				inputs[i].value = data;			}			//populate the distrib items table with distribution items data			var tbl = document.getElementById("distTable");			var distribItems = myRequisition["distribItems"];			excessRowNum = distribItems.length + 1;			while(tbl.rows[excessRowNum] != undefined) {				tbl.deleteRow(excessRowNum);			}			var rowNum = 0;			for(i=0, il = distribItems.length; i < il; i++) {				rowNum++;				//check if there is a row. if not, add it.				if (tbl.rows[rowNum] == undefined) {					var cln = tbl.rows[i].cloneNode(true);					tbl.appendChild(cln);				}				var tr = tbl.rows[rowNum];				var datas = tr.getElementsByTagName("data");				for(j=0, jl=datas.length; j < jl; j++) {					var fieldName = datas[j].value;					datas[j].innerHTML = distribItems[i][fieldName];				}				var inputs = tr.getElementsByTagName("input");				for(j=0, l=inputs.length; j<l; j++) {					var fieldName = inputs[j].name;					inputs[j].value = distribItems[i][fieldName];				}			}		}	}}//copy last row, clear it and append to tablefunction copyRow(tableId) {	var tbl = document.getElementById(tableId);	var lastRow = tbl.rows.length - 1;	var cln = tbl.rows[lastRow].cloneNode(true);	inputs = cln.getElementsByTagName("input");	for(j=0, l=inputs.length; j<l; j++) {		inputs[j].value = "";	}	tbl.appendChild(cln);}//delete last row from table if it is blankfunction deleteRow(tableId) {	var tbl = document.getElementById(tableId);	var lastRow = tbl.rows.length - 1;	inputs = tbl.rows[lastRow].getElementsByTagName("input");	var noContent = true;	for(j=0, l=inputs.length; j<l; j++) {		if(inputs[j].name == "requisitionItemId") {			if(inputs[j].value.length > 0) { noContent = false; break; }		}	}	if(noContent && lastRow > 1) {		tbl.deleteRow(lastRow);	}}function deleteDistItem(delObj) {	var row = delObj.parentNode.parentNode;	var distItemId = row.getElementsByTagName("input")[0].value; //distItemid	var tbl = row.parentNode;	var rowIndex = Array.prototype.indexOf.call(tbl.rows, row);	//alert(delRowIndex);	if(!distItemId) {		if(rowIndex > 1) {			tbl.deleteRow(rowIndex);		} else {			delObj.checked = false;		}	}}//set the rqId and call mainfunction setRQId(value) {	rqId=value;	main();}//clear the form for a new rqfunction clearForm() {	var tbl = document.getElementById("distTable");	var excessRows = tbl.rows.length - 2;	if(excessRows > 0) {		for(i=0; i<excessRows; i++) {			tbl.deleteRow(2);		}	}	var inputs = document.getElementById("distInfo").getElementsByTagName("input");	for(let i=0, l=inputs.length; i<l; i++) {		inputs[i].value = "";	}}function rq_form_validate() {	var valid = true;	//rq data	var inputs = document.getElementById("distInfo").getElementsByTagName("input");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			if(name == "destination") { valid = false; break; }			if(name == "preparedBy") { valid = false; break; }			if(name == "preparedDate") { valid = false; break; }		}	}	//rq items, checking row 1	var inputs = document.getElementById("distTable").rows[1].getElementsByTagName("input");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			if(name == "quantity") { valid = false; break; }		}	}	return valid;}function addRowHandlers(obj) {	//alert("I am addRowHandlers");	//get the data from the rcv row	var row = obj.parentNode.parentNode;	var rcvData = {};	var datas = row.getElementsByTagName("data");	for(i=0, il=datas.length; i<il; i++) {		var fieldName = datas[i].value;		var fieldData = datas[i].innerHTML;		//console.log(fieldName, fieldData);		rcvData[fieldName] = fieldData;	}	console.log(rcvData);    var tbl = document.getElementById("distTable");	var rcvPoNo = tbl.rows[1].cells[0].getElementsByTagName("data")[0];	if(rcvPoNo.innerHTML) {		//append a row to the distTable		var cln = tbl.rows[1].cloneNode(true);		tbl.appendChild(cln);	}	//populate the appended row	var lastRowIndex = tbl.rows.length - 1;	row = tbl.rows[lastRowIndex];	var datas = row.getElementsByTagName("data");	for(i=0, il=datas.length; i<il; i++) {		fieldName = datas[i].value;		if(fieldName == "distributionItemId") {			datas[i].innerHTML = "-";		} else {			if(rcvData[fieldName]) {				datas[i].innerHTML = rcvData[fieldName];			} else {				datas[i].innerHTML = "";			}		}	}	var inputs = row.getElementsByTagName("input");	for(i=0, il=inputs.length; i<il; i++) {		fieldName = inputs[i].name;		if(rcvData[fieldName]) {			inputs[i].value = rcvData[fieldName];		} else {			inputs[i].value = "";		}	}}function save() {	if(rq_form_validate() == true) {		var rqId = document.getElementById("rqId").innerHTML;		if(Number(rqId) == rqId || rqId == "new") {			var text = {};			text.distInfo = {};			text.distInfo.distributionId = rqId;			//get the requisition info			var inputs = document.getElementById("distInfo").getElementsByTagName("input");			for(i=0, l=inputs.length; i<l; i++) {				text.distInfo[inputs[i].name] = inputs[i].value;			}			text.distItems = [];			//get the items info			var rows = document.getElementById("distTable").rows;			for (i = 1, il=rows.length; i < il; i++) {				text.distItems[i - 1] = {};				var inputs = rows[i].getElementsByTagName("input");				for(j=0, jl=inputs.length; j<jl; j++) {					text.distItems[i - 1][inputs[j].name] = inputs[j].value;				}				//mark the deletes, skipping the first item.				if(inputs[jl - 1].checked == true && i > 1) {					text.distItems[i - 1]["del"] = 1;				}			}			return JSON.stringify(text);		}	} else {		alert("Could not save. Incomplete data.");	}}function print_rq() {	rcvId = document.getElementById("rqId").innerText;	window.open("templates/distribution_print.html?receivingId=" + rcvId);}