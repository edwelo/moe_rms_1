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

	<!-- requisition section -->
	<div id="rq" class="div_wrap" style="display: none;">

		<div class="align-right"><button id="btnRcvAction">&nbsp;&nbsp;</button></div>
		<button onclick="setRQId(0)">Back to List</button>
		<center>Requisition ID <span id="rqId" style="font-weight: bold;"></span></center>
		<div style="clear: both;"></div>

		<br />

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

			<hr style="height: 3px; background-color: #17445E;" />

			List of Receivings
			<table id = "rcvListTable" class="tbl">
				<tr>
					<th> Id </th>
					<th> RcvBy </th>
					<th> RcvDate </th>
					<th> Purpose </th>
					<th> InvNo </th>
					<th> InvDate </th>
					<th style="text-align: right;"> InvAmount </th>
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
					<td style="text-align: right;"> <data value="invoiceAmount"></data></td>
					<td> <data value="status"></data></td>
					<td> <data value="statusDate"></data></td>
				</tr>
			</table>
		</div>

		<div id="rcv">

			<hr style="height: 3px; background-color: #216288;" />

			<div id="rcvData">
				<button style="margin-bottom: 2px; padding: 0 4px 2px 4px; height: auto; border-radius: 2px;" type="button" onclick="setRcvId(0);">&nbsp; < &nbsp;</button>&nbsp;
				<span style="color: #305A72; font-weight: bold;">Receiving Id Number: #<data value="receivingId"></data></span><br />
				
				<input type="hidden" name="requisitionId" value="" />

				<div style="float: left;">Office:<br /><input type=text name="initiatiingOffice" value="" size=25 /></div>
				<div style="float: left;">RqBy:<br /><input type=text name="requestedBy" value="" size=25 /></div>
				<div style="float: left;">RqDate:<br /><input type="text" name="requestedDate" value="" size=12 /></div>
				<div style="float: left;">PrepBy:<br /><input type=text name="preparedBy" value="" size=25 /></div>
				<div style="float: left;">PrepDate:<br /><input type="text" name="preparedDate" value="" size=12 /></div>				
				
				<div style="clear: both;"></div>

				<div style="float: left;">AuthNo:<br /><input type=text name="authNo" value="" size=25 /></div>
				<div style="float: left;">AuthDate:<br /><input type="text" name="authDate" value="" size=12 /></div>				
				<div style="float: left;">AuthAmount:<br /><input style="text-align: right;" type="text" name="authAmount" value="" size=12 /></div>				
				<div style="float: left;">Purpose:<br /><input type=text name="justification" value="" size=80 /></div>
				
				<div style="clear: both;"></div>

				<div style="float: left;">RcvBy:<br /><input type=text name="rcvBy" value="" size=25 /></div>
				<div style="float: left;">RcvDate:<br /><input type="text" name="rcvDate" value="" size=12 /></div>
				<div style="float: left;">InvNo:<br /><input type="text" name="invoiceNo" value="" size=12 /></div>
				<div style="float: left;">InvDate:<br /><input type="text" name="invoiceDate" value="" size=12 /></div>
				<div style="float: left;">InvAmt:<br /><input style="text-align: right;" type="text" name="invoiceAmount" value="" size=12 /></div>
				<div style="float: left;">Date:<br /><input type="text" name="statusDate" value="" size=20 /></div>
				
				<div style="clear: both;"></div>

				<div style="float: left;">Remarks:<br /><input type="text" name="remarks" value="" size=120 /></div>
				
				<div style="clear: both;"></div>
			</div>

			<table id = "rcvTable" class="tbl">
				<tr>
					<th> Id </th>
					<th> RqItemInfo </th>
					<th style="text-align: right;"> Qty </th>
					<th> Unit </th>
					<th style="text-align: right;"> Price </th>
					<th style="text-align: right;"> Extended</th>
					<th> Description </th>
					<th style="text-align: center;">Del</th>
				</tr>
				<tr>
					<td><input type="hidden" name="receivingItemId" value="" /><data value="receivingItemId"></data></td>
					<td><input disabled type="text" name="requisitionItemId" value="" style="width: 3em; text-align: center;" /> <data value="org"></data> <data value="acc"></data></td>
					<td><input style="text-align: right;" type="text" name="quantity" value="" size=5 /></td>
					<td><data value="unit"></data></td>
					<td><input style="text-align: right;" type="text" name="price" value="" size=8 /></td>
					<td style="text-align: right;"><data value="extended"></data></td>
					<td><input type="text" name="description" value="" /></td>
					<td style="cursor: pointer; text-align: center;">
						<input style="border: 1px solid #17445E; border-radius: 3px; color: white; background-color: #216288; text-align: center;" type="checkbox" name="del" value=0  onclick="deleteRcvItem(this);" />
						</td>
				</tr>
			</table>
			<button style="margin-bottom: 2px; padding: 0 4px 2px 4px; height: auto; border-radius: 2px;" type="button" onclick="copyRow('rcvTable');">
				&nbsp; + &nbsp;
			</button>
		</div>
	</div>
