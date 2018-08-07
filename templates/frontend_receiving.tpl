	<!-- requisition list section -->
	<div id="listView" class="div_wrap" style="display: none;">

		List of Purchase Orders.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>

		<table id="rqListTable" class="level1table">
			<!-- Field names in the caption element. These match data source field names.
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

	<div id="formView" class="div_wrap" style="display: none;">

		<div id="formViewHeader">
			<div class="header-right">
				<button class = "level1button" id="btnRcvAction">&nbsp;&nbsp;</button>
			</div>
			<div class="header-left">
				<button class = "level1button" onclick="setRQId(0)">Back to List</button>
			</div>
			<h2>Requisition ID <span id="rqId" style="font-weight: bold;"></span></h2>
			<div style="clear: both;"></div>
			<br />
		</div>

		<div id="rqData">
			PO Info: 		<data value="poNo"></data>&nbsp;&nbsp;
							<data value="poDate"></data>&nbsp;&nbsp;
							$<data value="poAmount"></data>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Office Info:	<data value="initiatingOffice"></data>&nbsp;&nbsp;
							<data value="requestedBy"></data><br />
			Vendor info:	<data value="vendorId"></data>&nbsp;
							<data value="vendorName"></data><br />
			Justification:	<br />
							<data value="justification"></data><br />
		</div>

		<div id="rcvList">

			<hr />

			List of Receivings
			<table id = "rcvListTable" class="level2table">
				<tr>
					<th> Id </th>
					<th> RcvBy </th>
					<th> RcvDate </th>
					<th> Purpose </th>
					<th> InvNo </th>
					<th> InvDate </th>
					<th> InvAmount </th>
					<th> Status</th>
					<th> StatusDate </th>
				</tr>
				<tr style="vertical-align: top; cursor: pointer;">
					<td> <input type="hidden" name="requisitionItemId" value="" />
						<data value="receivingId"></data>
						</td>
					<td> <data value="rcvBy"> </td>
					<td> <data value="rcvDate"></data></td>
					<td> <data value="justification"></data></td>
					<td> <data value="invoiceNo"></data></td>
					<td> <data value="invoiceDate"></data></td>
					<td> <data value="invoiceAmount"></data></td>
					<td> <data value="status"></data></td>
					<td> <data value="statusDate"></data></td>
				</tr>
			</table>
		</div>

		<div id="rcv" class="div_wrap2">

			<div id="rcvData">
				<button class = "level2button" type="button" onclick="setRcvId(0);">&nbsp; < &nbsp;</button>&nbsp;
				<span>Receiving Id Number: #<data value="receivingId"></data></span><br />

				<hr />

				<input type="hidden" name="requisitionId" value="" />

				Office:		<input type=text name="initiatingOffice" value="" size=25 />
				RqBy:		<input type=text name="requestedBy" value="" size=25 />
				RqDate:		<input type="text" name="requestedDate" value="" size=12 />
				PrepBy:		<input type=text name="preparedBy" value="" size=25 />
				PrepDate:	<input type="text" name="preparedDate" value="" size=12 />

				<br />

				AuthNo:		<input type=text name="authNo" value="" size=12 />
				AuthDate:	<input type="text" name="authDate" value="" size=12 />
				AuthAmount:	<input type="text" name="authAmount" value="" size=12 />
				Purpose:	<input type=text name="justification" value="" size=60 />

				<br />

				RcvBy:		<input type=text name="rcvBy" value="" size=25 />
				RcvDate:	<input type="text" name="rcvDate" value="" size=12 />
				InvNo:		<input type="text" name="invoiceNo" value="" size=12 />
				InvDate:	<input type="text" name="invoiceDate" value="" size=12 />
				InvAmt:		<input type="text" name="invoiceAmount" value="" size=12 />
				Date:		<input type="text" name="statusDate" value="" size=20 />

				<br />

				Remarks:	<input type="text" name="remarks" value="" size=120 />

			</div>
			
			<hr />

			<table id = "rcvTable" class="level3table">
				<tr>
					<th> Id </th>
					<th> RqItemInfo </th>
					<th> Qty </th>
					<th> Unit </th>
					<th> Price </th>
					<th> Extended</th>
					<th> Description </th>
					<th>Del</th>
				</tr>

				<!--
					The items should have the following fields:
					receivingItemId, receivingId, requisitionItemId, quantity, unit, price,
					extended, description, del
					The fields must be set up properly in the html so all the js
					has to do is read them in.
				-->

				<tr>
					<!-- This td has to be on one line. The function deleteRcvItem
					     parses it to find the receivingItemId. -->
					<td><input type="hidden" name="receivingItemId" value="" /><input type="hidden" name="receivingId" value="" /><data value="receivingItemId"></data></td>
					<td>
						<input type="hidden" name="requisitionItemId" value="" style="width: 35repx;" />
						<data value="requisitionItemId"></data>
						<data value="org"></data>
						<data value="acc"></data>
						<select style="display: none; width: 130;" id="rqItemsSelector" onchange="setRcvItemRqItemId(this);"></select>
					</td>
					<td>
						<input type="text" name="quantity" value="" onchange="extPriceCalc(this);" />
					</td>
					<td>
						<input type="text" name="unit" value=""  />
					</td>
					<td>
						<input type="text" name="price" value="" onchange="extPriceCalc(this);" />
					</td>
					<td>
						<input type="text" name="extended" value="" readonly />
					</td>
					<td>
						<input type="text" name="description" value="" />
					</td>
					<td>
						<input type="checkbox" name="del" value=0  onclick="deleteRcvItem(this);" />
					</td>
				</tr>
			</table>
			<button class = "level2button" onclick="addNewItemToItemTable();">
				&nbsp; + &nbsp;
			</button>
		</div>
	</div>
