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
				requisitionId,poNo,poDate,vendorName,rqAmount,justification,rcvDate,rcvBy,invoiceAmount,invoiceDate
			</caption>
			<tr>
				<th>Id</th>
				<th>PO</th>
				<th>PO Date</th>
				<th>Vendor</th>
				<th style="text-align: right;">Amount</th>
				<th>Justification</th>
				<th>rcvDate</th>
				<th>rcvBy</th>
				<th style="text-align: right;">invAmount</th>
				<th>invDate</th>
			</tr>
			<tr style="vertical-align: top; cursor: pointer;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align: right;"></td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align: right;"></td>
				<td></td>
			</tr>
		</table>
	</div>

	<!-- requisition form section -->
	<div id="rq" class="div_wrap" style="display: none;">

		<div class="align-right">
			<button onclick="main('button');">Save</button>
		</div>
		<div class="align-left"><button onclick="setRQId(0)">Back to List</button></div>
		<center>Requisition ID <span id="rqId" style="font-weight: bold;"></span></center>
		<div style="clear: both;"></div>

		<br />

		<form id = "MyForm">
			<div id="rqData">
				<p style="margin-bottom: 6px;">
				office: <input disabled name="initiatingOffice" value="" size=10 />
				rqBy: <input disabled name="requestedBy" value="" size=10 />
				vendor: <input disabled name="vendorId" value="" size=5 />
				</p>
				<p style="margin-bottom: 6px;">
				justification:<input disabled name="justification" value="" size=100 />
				</p>
				rcvDate: <input type=text name="rcvDate" value="" size=12 />
				rcvBy: <input type=text name="rcvBy" value="" size=12 />
				invNo:<input name="invoiceNo" value="" size=10 />
				invAmount: <input type=text name="invoiceAmount" value="" size=5 />
				invDate: <input type=text name="invoiceDate" value="" size=12 />
			</div>

			<table id = "items_table" class="tbl">
				<tr>
					<th style="color: grey; text-align: right;"> Id </th>
					<th style="color: grey;"> Acc </th>
					<th style="color: grey;"> Description </th>
					<th style="text-align: right; color: grey;"> Qty </th>
					<th style="color: grey;"> Unit </th>
					<th style="text-align: right; color: grey;"> Price </th>
					<th style="text-align: right;"> rcvQty </th>
					<th style="text-align: right;"> rcvPrice </th>
				</tr>
				<tr>
					<td style="text-align: right;"> <input disabled type="text" name="requisitionItemId" value="" style="width: 3em; text-align: right;" /> </td>
					<td> <input disabled type="text" name="acc" value="" size=4 /> </td>
					<td> <input disabled type="text" name="description" value="" size=25 /> </td>
					<td style="text-align: right;"> <input disabled type="text" name="quantity" value="" size=4 style="text-align: right;" /> </td>
					<td> <input disabled type="text" name="unit" value="" size=5 /> </td>
					<td style="text-align: right;"> <input disabled type="text" name="price" value="" size=6 style="text-align: right;" /> </td>
					<td style="text-align: right;"> <input type="text" name="rcvQuantity" value="" size=4 style="text-align: right;" /> </td>
					<td style="text-align: right;"> <input type="text" name="rcvPrice" value="" size=6 style="text-align: right;" /> </td>
				</tr>
			</table>
		</form>
	</div>