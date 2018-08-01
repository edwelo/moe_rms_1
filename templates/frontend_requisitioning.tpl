	<!-- requisition list section -->
	<div id="listView" class="div_wrap" style="display: none;">

		<div id="listViewHeader">
			<div class="align-right">
				<button class = "level1button" onclick="setRQId('new')">New RQ</button>
			</div>
			List of Purchase Orders.
			<span style="color: grey;">Click on a row to edit.</span> <br><br>
		</div>

		<table id="rqListTable" class="tbl">
			<!-- Field names in the caption element. These match  data source field names.
				Must be one contiguous line, no spaces after or before commas.
				Must have 1 to 1 correspondence with the th's below. To change the
				items in the rq list, change the field names and the corresponding th's. -->
			<caption>
				requisitionId,initiatingOffice,requestedBy,preparedByName,preparedDate,vendorName,numItems,rqAmount,justification,poNo,poDate
			</caption>
			<tr>
				<th>Id</th>
				<th>Office<br />Requested By</th>
				<th>Prepared By<br />PrepDate</th>
				<th>Vendor / Amount / numItems</th>
				<th>Justification</th>
				<th>PO No/Date</th>
			</tr>
			<tr>
				<td>
					<span></span>
				</td>
				<td>
					<span></span><br />
					<span></span>
				</td>
				<td>
					<span></span><br />
					<span></span>
				</td>
				<td>
					<span></span><br />
					<span></span><br />
					<span></span>
				</td>
				<td>
					<span></span>
				</td>
				<td>
					<span></span><br />
					<span></span>
				</td>
			</tr>
		</table>
	</div>

	<!-- requisition form section -->
	<div id="formView" class="div_wrap" style="display: none;">

		<div id="formViewHeader">
			<div class="align-right">
				<button class = "level1button" onclick="print_rq();">Print</button>
				<button class = "level1button" onclick="main('button');">Save</button>
			</div>
			<div class="align-left"><button class = "level1button" onclick="setRQId(0)">Back to List</button></div>
			<center>Requisition ID <span id="rqId" style="font-weight: bold;"></span></center>
			<div style="clear: both;"></div>

			<br />
		</div>

		<div id="formViewData">

			<div id="rqData" style="padding: 0 2em 0 2em;">
				Office: 		<input type="text" name="initiatingOffice" value="" />
				RqBy: 			<input type="text" name="requestedBy" value="" />
				PrepBy: 		<input disabled type="text" name="preparedByName" value="" /><input type=hidden name="preparedById" value="" />
				PrepDate: 		<input type="text" name="preparedDate" value="" size=10 />
				RqAmount: 	   $<input type=text name="rqAmount" value="" readonly size=12 />
				RqApprvDate: 	<input type="text" name="approvedDate" value="" size=10 /><br />

				Vendor: 		<input type="text" name="vendorId" value="" size=2 />
								<input disabled name="vendorName" value="" /><br />

				Justification:	<input type="text" name="justification" value="" size = 100% /><br />

				PO: 			<input type="text" name="poNo" value="" size=10 />
				PO Type: 		<input type="text" name="poType" value="" size=10 />
				PO Date:		<input type="text" name="poDate" value="" size=10 />
				PO Amount: 	   $<input type="text" name="poAmount" value="" size=12 />
			</div>

			<table id = "items_table" class="level2table">
				<tr>
					<th> Id </th>
					<th> Org </th>
					<th> CCtr </th>
					<th> Task </th>
					<th> Opt </th>
					<th> SAcc </th>
					<th> Qty </th>
					<th> Unit </th>
					<th> Price </th>
					<th> Extended</th>
					<th> Description </th>
					<th style="width: 20px;"> del </th>
				</tr>
				<tr>
					<td style = "width: 15px;"> <input class = "small" disabled type="text" name="requisitionItemId" value=""> </td>
					<td style = "width: 25px;"> <input class = "small" type="text" name="org" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="costCenter" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="task" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="opt" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="acc" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="quantity" value=""> </td>
					<td style = "width: 35px;"> <input class = "small" type="text" name="unit" value=""> </td>
					<td style = "width: 45px;"> <input class = "medium" type="text" name="price" value=""> </td>
					<td style = "width: 45px;"> <input class = "medium" disabled type="text" name="extended" value=""> </td>
					<td> <input class = "big" type="text" name="description" value=""> </td>
					<td> <input type="checkbox" name="del" value=0> </td>
				</tr>
			</table>
			<button class = "level2button" onclick="copyRow('items_table');"> + </button>
			<button class = "level2button" onclick="deleteRow('items_table');"> - </button>
		</div>
	</div>