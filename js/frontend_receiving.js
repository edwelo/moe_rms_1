//rq listfunction rq_list(myRequisitions) {	rcvId = 0;	document.getElementById("listView").style.display = "block";	document.getElementById("formView").style.display = "none";	//get the rqListTable	var tbl = document.getElementById("rqListTable");	var tBody = tbl.tBodies[0];	//the data field names are specified in a hidden caption of	//the rqListTable. Here we load them into 'col' variable.	var col = tbl.caption.innerText.trim().split(",");	// ADD JSON DATA TO THE TABLE AS ROWS.	for (var i = 0; i < myRequisitions.length; i++) {		//check if there is a row. if not, add it.		if(tBody.rows[i] === undefined) {			var cln = tBody.rows[i - 1].cloneNode(true);			tBody.appendChild(cln);		}		var tr = tBody.rows[i];		//populate the spans of the row		var spans = tr.getElementsByTagName("span");		for (var j = 0; j < col.length; j++) {			spans[j].innerHTML = myRequisitions[i][col[j]];		}		//set the onclick and the cursor of this table row		var onclickStr = "setId(" + myRequisitions[i]["requisitionId"] + ")";		tr.setAttribute('onclick', onclickStr)	}}//rq formfunction rq_form(myRequisition) {	//alert(rcvId);	document.getElementById("listView").style.display = "none";	document.getElementById("formView").style.display = "block";	document.getElementById("rqId").innerHTML = rqId;	var divRcvList = document.getElementById("rcvList");	var divRcv = document.getElementById("rcv");	var btnRcvAction = document.getElementById("btnRcvAction");	btnRcvAction.innerHTML = "New";	btnRcvAction.setAttribute("onclick", "setRcvId('new');");	//populate the rq	var rowData = null, fieldName = null, datas = null, row = null;	var rcvArray = null, rcvArrayKeys = null;	if(typeof myRequisition == "object") {		//set the rq items selector, needed if a new item is added		rqItemSel = [];		for(i=0, l=myRequisition["items"].length; i<l; i++) {			rqItemSel[i] = myRequisition["items"][i];		}		if(!rcvId) {			divRcvList.style.display = "block";			divRcv.style.display = "none";			clearRcvForm();			var frmEl = document.getElementById("rqData");			var datas = frmEl.getElementsByTagName("data");			for(i=0, l=datas.length; i<l; i++) {				datas[i].innerHTML = myRequisition[datas[i].value];			}			var datas = frmEl.getElementsByTagName("input");			for(i=0, l=datas.length; i<l; i++) {				datas[i].innerHTML = myRequisition[datas[i].value];			}			//populate the receive list table			var tbl = document.getElementById("rcvListTable");			var tBody = tbl.tBodies[0];			var numRcvs = myRequisition.rcvlist.length;			//delete excess table rows if necessary			while(tBody.rows[numRcvs] !== undefined) {				tBody.deleteRow(numRcvs);			}			//var rcvId = 9; //temporary, specifies selected rcv			if(numRcvs) {				for (i = 0; i < numRcvs; i++) {					//check if there is a row. if not, add it.					if(tBody.rows[i] == undefined) {						var cln = tBody.rows[i - 1].cloneNode(true);						tbl.appendChild(cln);					}										var row = tBody.rows[i];					rowData =  myRequisition["rcvlist"][i];					//set the onclick and the cursor of this table row					var onclickStr = "setRcvId(" + rowData["receivingId"] + ")";					row.setAttribute('onclick', onclickStr)					//populate data elements					datas = row.getElementsByTagName("data");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].value;						datas[j].innerHTML = rowData[fieldName];					}					//populate input elements					datas = row.getElementsByTagName("input");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].name;						datas[j].innerHTML = rowData[fieldName];					}				}			} else {					var row = tbl.rows[0];					//populate data elements					datas = row.getElementsByTagName("data");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].value;						datas[j].innerHTML = "";					}					//populate input elements					datas = row.getElementsByTagName("input");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].name;						datas[j].innerHTML = "";					}							}		}		//populate the receiving info		if(rcvId) {			divRcvList.style.display = "none";			divRcv.style.display = "block";			clearRcvForm();			console.log(rqItemSel);			btnRcvAction.innerHTML = "Save";			btnRcvAction.setAttribute("onclick", "main('save');");			if(rcvId != "new") {				var rcvRecNo = null;				console.log("Receiving Id: " + rcvId);				//get the receiving data that matches the rcvId				for(i=0, l=myRequisition["rcvlist"].length; i<l; i++) {					if(myRequisition["rcvlist"][i]["receivingId"] == rcvId) {						rcvRecNo = i; break;					}				}				//alert(rcvId + " :: " + rcvArray.length);				var rcv = myRequisition["rcvlist"][rcvRecNo];				var rcvKeys = Object.keys(rcv);				var rcvValues = Object.values(rcv);				var rcvLength = rcvKeys.length;				var rcvItems = rcv.items;				//console.log("rcv: ");				//console.log(rcv);				//console.log("rcvKeys: ");				//console.log(rcvKeys);				//console.log("rcvValues: ");				//console.log(rcvValues);				//console.log("rcvLength: " + rcvLength);				//console.log(rcvItems);				var tmp = "rcv keys and values:\n";				for(i=0; i<rcvLength; i++) {					fieldName = rcvKeys[i];					fieldValue = rcvValues[i];					tmp += "\t" + fieldName + ": " + (fieldValue) + "\n";					//console.log(fieldName + ": " + fieldValue);				}				//console.log(tmp);				//data elements				datas = document.getElementById("rcvData").getElementsByTagName("data");				//console.log("rcvData elements - data: ");				//console.log("datas length: " + datas.length);				//console.log(datas);				for(i=0, l=datas.length; i<l; i++) {					fieldName = datas[i].value;					for(j=0; j<rcvLength; j++) {						if(fieldName == rcvKeys[j]) {							fieldValue = rcvValues[j];							//console.log(fieldName + ": " + fieldValue);							datas[j].innerHTML = fieldValue;							break;						}					}				}				//input elements				datas = document.getElementById("rcvData").getElementsByTagName("input");				//console.log("rcvData elements - input: ");				//console.log("datas length: " + datas.length);				//console.log(datas);				for(i=0, l=datas.length; i<l; i++) {					fieldName = datas[i].name;					//console.log(fieldName + ": ");					for(j=0; j<rcvLength; j++) {						if(fieldName == rcvKeys[j]) {							fieldValue = rcvValues[j];							if(!fieldValue) fieldValue == "";							//console.log("\t" + fieldValue);							datas[i].value = fieldValue;							break;						}					}				}				//populate the receiving items table				var tbl = document.getElementById("rcvTable");				var rcvItems = rcv.items;				var rcvItemsLength = rcvItems.length;				//console.log("rcvItems");				//console.log(rcvItems);				//console.log("rcvItemsLength: " + rcvItemsLength);				//delete table rows if necessary				while(tbl.rows[rcvItemsLength + 1] !== undefined) {					tbl.deleteRow(rcvItemsLength + 1);				}				for (i = 0; i < rcvItemsLength; i++) {					//check if there is a row. if not, add it.					if(tbl.rows[i + 1] == undefined) {						var cln = tbl.rows[i].cloneNode(true);						tbl.appendChild(cln);					}					row = tbl.rows[i + 1];					//populate data elements					datas = row.getElementsByTagName("data");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].value;						datas[j].innerHTML = rcvItems[i][fieldName];					}					//console.log("data elements: item #" + rcvItems[i]["receivingItemId"]);					//console.log(datas);					//populate input elements					datas = row.getElementsByTagName("input");					for(j=0, l=datas.length; j<l; j++) {						fieldName = datas[j].name;						datas[j].value = rcvItems[i][fieldName];					}					//console.log("input elements: item #" + rcvItems[i]["receivingItemId"]);					//console.log(datas);				}			}		}	}}//copy last row, clear it and append to tablefunction copyRow(tableId) {	var tbl = document.getElementById(tableId);	var lastRow = tbl.rows.length - 1;	var cln = tbl.rows[lastRow].cloneNode(true);	inputs = cln.getElementsByTagName("input");	for(j=0, l=inputs.length; j<l; j++) {		inputs[j].value = "";		if(inputs[j].name == "del") {			inputs[j].checked = false;		}	}	datas = cln.getElementsByTagName("data");	for(j=0, l=datas.length; j<l; j++) {		datas[j].innerHTML = "";	}	tbl.appendChild(cln);}function setRcvItemRqItemId(obj) {	var rqItemId = obj.options[obj.selectedIndex].value;	if(rqItemId) {		for(i=0, l=rqItemSel.length; i<l; i++) {			if(rqItemSel[i]["requisitionItemId"] == rqItemId) {				var theItem = rqItemSel[i]; break;			}		}		var tr = obj.parentNode.parentNode;		var inputs = tr.getElementsByTagName("input");		for(i=0, l=inputs.length; i<l; i++) {			if(inputs[i].name == "requisitionItemId") inputs[i].value = rqItemId;			if(inputs[i].name == "unit") inputs[i].value = theItem["unit"];			if(inputs[i].name == "price") inputs[i].value = theItem["price"];			if(inputs[i].name == "description") inputs[i].value = theItem["description"];		}		var datas = tr.getElementsByTagName("data");		for(i=0, l=datas.length; i<l; i++) {			if(datas[i].value == "requisitionItemId") datas[i].innerHTML = rqItemId;			if(datas[i].value == "org") datas[i].innerHTML = theItem["org"];			if(datas[i].value == "acc") datas[i].innerHTML = theItem["acc"];		}		obj.options.length = 0;		obj.style.display = "none";	}}//copy last row, clear it and append to tablefunction addNewItemToItemTable() {	var tbl = document.getElementById("rcvTable");	var lastRow = tbl.rows.length - 1;	var cln = tbl.rows[lastRow].cloneNode(true);	var tmp = cln.getElementsByTagName("select");	var rqItemsSelector = tmp[0];	rqItemsSelector.options.length = 0;	rqItemsSelector.options[rqItemsSelector.options.length] = new Option("-- Select RQ Item --", 0);	for(i=0, l=rqItemSel.length; i<l; i++) {		rqItemsSelector.options[rqItemsSelector.options.length] = new Option(rqItemSel[i]["description"], rqItemSel[i]["requisitionItemId"]);	}	rqItemsSelector.style.display = "inline";	inputs = cln.getElementsByTagName("input");	for(j=0, l=inputs.length; j<l; j++) {		inputs[j].value = "";		if(inputs[j].name == "receivingId") { inputs[j].value = rcvId; }		if(inputs[j].name == "del") { inputs[j].checked = false; }	}	datas = cln.getElementsByTagName("data");	for(j=0, l=datas.length; j<l; j++) {		datas[j].innerHTML = "";		if(datas[j].value == "receivingId") { datas[j].innerHTML = rcvId; }	}	tbl.appendChild(cln);}function deleteRcvItem(delObj) {	var delRow = delObj.parentNode.parentNode;	var tbl = delRow.parentNode;	var delRowIndex = Array.prototype.indexOf.call(tbl.rows, delRow);	//alert(delRowIndex);	delRcvItemId = delRow.cells[0].childNodes[0].value;	if(delRcvItemId) {		;	} else {		if(delRowIndex > 1) {			tbl.deleteRow(delRowIndex);		} else {			delObj.checked = false;		}	}}//set the rqId and call main//rqId is a module level variable. The value set here is accessible//from any other script or function in this module.function setId(value) {	rqId=value;	main();}function setNewRcvItemRow() {	var row = document.getElementById("rcvTable").rows[1];	var rqItemsSelector = document.getElementById("rqItemsSelector");	rqItemsSelector.options.length = 0;	rqItemsSelector.options[rqItemsSelector.options.length] = new Option("-- Select RQ Item --", 0);	for(i=0, l=rqItemSel.length; i<l; i++) {		rqItemsSelector.options[rqItemsSelector.options.length] = new Option(rqItemSel[i]["description"], rqItemSel[i]["requisitionItemId"]);	}	rqItemsSelector.style.display = "inline";}//set the rcvId and call main//rcvId is a module level variable. The value set here is accessible//from any other script or function in this module.function setRcvId(value) {	rcvId=value;	clearRcvForm();	if(rcvId == "new") setNewRcvItemRow();	main();}//clear the form for a new receivingfunction clearRcvForm() {	var tbl = document.getElementById("rcvTable");	var excessRows = tbl.rows.length - 2;	if(excessRows > 0) {		for(i=0; i<excessRows; i++) {			tbl.deleteRow(2);		}	}	var frm = document.getElementById("rcv");	var datas = frm.getElementsByTagName("data");	for(let i=0, l=datas.length; i<l; i++) {		datas[i].innerHTML = "";		if(datas[i].value == "receivingId") datas[i].innerHTML = rcvId;	}	var inputs = frm.getElementsByTagName("input");	for(let i=0, l=inputs.length; i<l; i++) {		inputs[i].value = "";		if(inputs[i].name == "requisitionId") inputs[i].value = rqId;	}}function rq_form_validate() {	var valid = true;	return valid; // 180724 0430 bypass while rewriting save function	//the relevant html sections that need to be saved	var rcvData = document.getElementById("rcvData");	var rcvItems = document.getElementById("rcvTable");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			//if(name == "initiatingOffice") { valid = false; break; }			if(name == "preparedDate") { valid = false; break; }			if(name == "vendorId") { valid = false; break; }			if(name == "justification") { valid = false; break; }		}	}	//rq items, checking row 1	var inputs = document.getElementById("items_table").rows[1].getElementsByTagName("input");	for(i = 0, l=inputs.length; i<l; i++) {		var name = inputs[i].name; var value = inputs[i].value;		if(value == "") {			if(name == "quantity") { valid = false; break; }			if(name == "unit") { valid = false; break; }			if(name == "price") { valid = false; break; }			if(name == "description") { valid = false; break; }		}	}	return valid;}function save() {	if(rq_form_validate() == true) {		//the relevant html sections and fields that need to be saved		var rcvData = document.getElementById("rcvData");		var rcvItems = document.getElementById("rcvTable");		var rqId = document.getElementById("rqId").innerHTML;		if(Number(rqId) == rqId || rqId == "new") {			var text = {}; //we will get all the form data into this object			text["requisitionId"] = rqId;			//get the requisition info			var inputs = rcvData.getElementsByTagName("input");			//console.log("Get RCV Data");			//console.log(inputs);			for(i=0, l=inputs.length; i<l; i++) {				text[inputs[i].name] = inputs[i].value;			}			//this will hold the items data. It will be added to text later.			var items_list = [];			//get the items info			var rows = rcvItems.rows;			//The items should have the following fields:			//receivingItemId, receivingId, requisitionItemId, quantity, unit, price,			//extended, description, del			//The fields must be set up properly in the html so all the js below			//has to do is read them in.			for (i = 1, l=rows.length; i < l; i++) {				items_list[i-1] = {};				var inputs2 = rows[i].getElementsByTagName("input");				for(j=0, jl=inputs2.length; j<jl; j++) {					if(inputs2[j].name == "del") {						if(inputs2[j].checked) inputs2[j].value = 1;					}					if(inputs2[j].value == undefined) {						items_list[i - 1][inputs2[j].name] = "";					} else {						items_list[i - 1][inputs2[j].name] = inputs2[j].value;					}				}			}			text["items"] = items_list;			//alert("Will return: \n" + JSON.stringify(text));			return JSON.stringify(text);		}	} else {		alert("Could not save. Incomplete data.");	}}function extPriceCalc(obj) {	var row = obj.parentNode;	if(row.tagName != "TR") row = row.parentNode;	if(row.tagName != "TR") {		alert("Could not calculate extended price - could not find the item row.");		exit;	}	var qty=0, price=0, extended=null;	var inputs = row.getElementsByTagName("input");	for(i=0, l=inputs.length; i<l; i++) {		if(inputs[i].name == "quantity") qty = inputs[i].value;		if(inputs[i].name == "price") price = inputs[i].value;		if(inputs[i].name == "extended") extended = inputs[i];	}	extended.value = qty * price;}function print_rq() {	rqId = document.getElementById("rqId").innerText;	window.open("requisitioning_rq_print.html?requisitionId=" + rqId);}