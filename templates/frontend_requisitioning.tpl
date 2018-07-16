	<!-- requisition list section -->
	<div id="rqList" class="div_wrap" style="display: none;">

		<div class="align-right">
			<button onclick="setRQId('new')">New RQ</button>
		</div>
		List of Purchase Orders. 
		<span style="color: grey;">Click on a row to edit.</span> <br><br>

		<table id="rqListTable" class="tbl">
			<!-- Field names in the caption element. These match  data source field names.
				Must be one contiguous line, no spaces after or before commas.
				Must have 1 to 1 correspondence with the th's below. To change the
				items in the rq list, change the field names and the corresponding th's. -->
			<caption>
				requisitionId,initiatingOffice,preparedByName,preparedDate,vendorName,rqAmount,justification,poNo,poDate
			</caption>
			<tr>
				<th>Id</th>
				<th>Office</th>
				<th>PrepBy</th>
				<th>PrepDate</th>
				<th>Vendor</th>
				<th style="text-align: right;">Amount</th>
				<th>Justification</th>
				<th>PO</th>
				<th>PO Date</th>
			</tr>
			<tr style="vertical-align: top; cursor: pointer;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align: right;"></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>

	<!-- requisition form section -->
	<div id="rq" class="div_wrap" style="display: none;">

		<div class="align-right">
			<button onclick="print_rq();">Print</button>
			<button onclick="main('button');">Save</button>
		</div>
		<div class="align-left"><button onclick="setRQId(0)">Back to List</button></div>
		<center>Requisition ID <span id="rqId" style="font-weight: bold;"></span></center>
		<div style="clear: both;"></div>
		
		<br />

		<form id = "MyForm">
			<div id="rqData">
				Office: 		<input type="text" name="initiatingOffice" value="" />
				RqBy: 			<input type="text" name="requestedBy" value="" />
				PrepBy: 		<input disabled type="text" name="preparedByName" value="" /><input type=hidden name="preparedById" value="" />
				PrepDate: 		<input size = "10%" type="text" name="preparedDate" value=""/><br />
				Vendor: 		<input size = "10%" type="text" name="vendorId" value=""/>
								<input disabled name="vendorName" value="" /> <br>
				Justification:	<input type="text" name="justification" value="" size = 100%/>
				RqAmount: 	   $<input size = "10%" type=text name="rqAmount" value=""/>
				RqApprvDate: 	<input size = "10%" type="text" name="moeApprovedDate" value=""/>
				PO: 			<input size = "10%" type="text" name="poNo" value=""/>
				PO Date:		<input size = "10%" type="text" name="poDate" value="" />
				PO Amount: 	   $<input size = "10%" type="text" name="poAmount" value=""  />
			</div>

			<table id = "items_table" class="tbl">
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
					<td style="width: 50px;"> <input disabled type="text" name="requisitionItemId" value="" style="text-align: right;" /> </td>
					<td style="width: 60px;"> <input type="text" name="org" value="" /> </td>
					<td style="width: 80px;"> <input type="text" name="costCenter" value="" /> </td>
					<td style="width: 60px;"> <input type="text" name="task" value="" /> </td>
					<td style="width: 60px;"> <input type="text" name="opt" value="" /> </td>
					<td style="width: 60px;"> <input type="text" name="acc" value="" /> </td>
					<td style="width: 60px;"> <input type="text" name="quantity" value="" style="text-align: right;" /> </td>
					<td style="width: 40px;"> <input type="text" name="unit" value="" /> </td>
					<td style="width: 80px;"> <input type="text" name="price" value="" style="text-align: right;" /> </td>
					<td style="width: 80px;"> <input disabled type="text" name="extended" value="" style="text-align: right;" /> </td>
					<td> <input type="text" name="description" value="" /> </td>
					<td> <input type="checkbox" name="del" value=0 /> </td>
				</tr>
			</table>
			<button type="button" onclick="copyRow('items_table');"> + </button>
			<button type="button" onclick="deleteRow('items_table');"> - </button>
		</form>
	</div>