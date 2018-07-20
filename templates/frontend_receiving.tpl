	<!-- requisition list section -->
	<div id="rqList" class="div_wrap" style="display: none;">

		List of Purchase Orders.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>

		<table id="rqListTable" class="tbl">
			<!-- Field names in the caption element. These match  data source field names.
				Must be one contiguous line, no spaces after or before commas.
				Must have 1 to 1 correspondence with the th's below. To change the
				items in the rq list, change the field names and the corresponding th's. -->
			<caption>
				requisitionId,poNo,poType,poDate,poAmount,vendorName,numItems,justification,rcvActivityCount,rcvActivityAmount,distribActivityCount,distribActivityAmount,statusDate,status
			</caption>
			<tr>
				<th>Id</th>
				<th>PO No/Type<br />/Date/Amount</th>
				<th>Vendor / numItems</th>
				<th>Justification</th>
				<th>Rcv Activity</th>
				<th>Distr Activity</th>
				<th>Status</th>
			</tr>
			<tr style="vertical-align: top; cursor: pointer;">
				<td>
					<span></span>
				</td>
				<td>
					<span></span><br />
					<span></span><br />
					<span></span><br />
					$<span></span>
				</td>
				<td>
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
				<td>
					<span></span><br />
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
				PO Info 		<input disabled size = "10%" type="text" name="poNo" value=""/>
								<input disabled size = "10%" type="text" name="poDate" value="" />
								$<input disabled size = "10%" type="text" name="poAmount" value=""  />
				RcvBy: 	   <input type=text name="rcvBy" value="" size = 25 />
				RcvDate: 	<input type="text" name="rcvDate" value="" size = 12 /><br />
				Office Info: 	<input disabled type="text" name="initiatingOffice" value="" />
					 			<input disabled type="text" name="requestedBy" value="" /><br />
				Vendor: 		<input disabled type="text" name="vendorName" value="" size=100 /><br />
				Justification:	<input disabled type="text" name="justification" value="" size = 100% /><br />
			</div>

			<table id = "items_table" class="tbl">
				<tr>
					<th> Id </th>
					<th> Org </th>
					<th> SAcc </th>
					<th> Qty </th>
					<th> Unit </th>
					<th> Price </th>
					<th> Extended</th>
					<th> Description </th>
					<th> Rcv Qty </th>
					<th> Rcv Price </th>
				</tr>
				<tr>
					<td> <input disabled type="text" name="requisitionItemId" value="" style="text-align: right;" /> </td>
					<td> <input disabled type="text" name="org" value="" /> </td>
					<td> <input disabled type="text" name="acc" value="" /> </td>
					<td> <input disabled type="text" name="quantity" value="" style="text-align: right;" /> </td>
					<td> <input disabled type="text" name="unit" value="" /> </td>
					<td> <input disabled type="text" name="price" value="" style="text-align: right;" /> </td>
					<td> <input disabled type="text" name="extended" value="" style="text-align: right;" /> </td>
					<td> <input disabled type="text" name="description" value="" /> </td>
					<td> <input type="text" name="rcvQuantity" value="" style="text-align: right;" /> </td>
					<td> <input type="text" name="rcvPrice" value="" /> </td>
				</tr>
			</table>
		</form>
	</div>