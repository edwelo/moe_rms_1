<div id="listView" class="div_wrap">

	<div id="listViewHeader">
		<button class="level1button" style="float: right;" onclick="setId('new')">New Dist</button>
		List of Purchase Orders.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>
	</div>

	<div id="listViewDetail">
		<table id="listTable" class="level1table">
			<caption>
				distributionId,refPOs,numItems,deliveredBy,deliveredDate,destination,receivedBy,receivedDate,remarks
			</caption>
			<thead>
				<tr>
					<th style="width: 35px;">Id</th>
					<th style="width: 80px;">POs/#Items</th>
					<th style="width: 100px;">Dlvr By/Date</th>
					<th style="width: 150px;">Dest/Rcvr/Date</th>
					<th style="width: 580px;">Remarks</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 35px;">
						<span></span>
					</td>
					<td style="width: 80px;">
						<span></span><br />
						<span></span>
					</td>
					<td style="width: 100px;">
						<span></span><br />
						<span></span>
					</td>
					<td style="width: 150px;">
						<span></span><br />
						<span></span><br />
						<span></span>
					</td>
					<td style="width: 580px;">
						<span></span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div id="formView" class="div_wrap" style="display: none;">

		<div id="formViewHeader">
			<button class="level1button" style="float: right;" onclick="main('save');">Save</button>
			<button class="level1button" style="float: right;" onclick="print_rq();">Print</button>
			<button class="level1button" style="float: left;" onclick="setId(0)">Back to List</button>
			<h2>Distribution ID <span id="rqId" style="font-weight: bold;"></span></h2>
			<div style="clear: both;"></div>
			<br />
		</div>

		<div id = "formViewLeftPanel">

			<table id="rcvTable">

				<tr>
				  <th>PO</th>
				  <th>Description</th>
				  <th>Qty</th>
				  <th> </th>
				</tr>

				<tr>
				  <td>
				  	<data value="poNo"></data>
					<data value="receivingId" style="display: none;"></data>
					<data value="receivingItemId" style="display: none;"></data>
					<data value="requisitionItemId" style="display: none;"></data>
				  </td>
				  <td><data value="description"></data></td>
				  <td><data value="quantity"></data></td>
				  <td><button onclick="addRowHandlers(this);"> > </button></td>
				</tr>

			</table>
		</div>

		<div id="formViewRightPanel" class="div_wrap2" style="float: left; width: 665px; height: 496px; margin-top: 0; margin-bottom: 0;">

			<div id="distInfo">
				Distrib Id:		<input type="text" name="distributionId" value="" size=4 />
				Destination:	<input type="text" name="destination" value="" />
				PrepBy:			<input type="text" name="preparedBy" value="" />
				PrepDate:		<input type="text" name="preparedDate" value="" size=12 />

				<br />

				DlvrBy:			<input type="text" name="deliveredBy" value="" />
				DlvrDate:		<input type="text" name="deliveredDate" value="" size=12 />
				RcvBy:			<input type="text" name="receivedBy" value="" />
				RcvDate:		<input type="text" name="receivedDate" value="" size=12 />

				<br />

				Status:			<input type="text" name="status" value="" />
				Status Date:	<input type="date" name="statusDate" value="" size=10 />
				<br />
				Remarks:		<input type="text" name="remarks" value="" size=60 />
			</div>

			<hr />

			<table id = "distTable" class="level3table">
				<tr>
					<th>PO</th>
					<th>Description</th>
					<th>Qty</th>
					<th>AssetTag</th>
					<th>ModelNo</th>
					<th>SerialNo</th>
					<th style="width: 20px;"> del </th>
				</tr>

				<tr style="vertical-align: top; font-size: small;">
					<td>
						<data value="poNo"></data>&nbsp;
						<input type=hidden name="distributionItemId" value="" />
						<input type=hidden name="receivingItemId" value="" />
						<input type=hidden name="requisitionItemId" value="" />
					</td>
					<td>
						<data value="description"></data>
					</td>
					<td>
						<input type="text" name="quantity" value="" size=4 />
					</td>
					<td>
						<input type="text" name="assetTag" value="" size=8 />
					</td>
					<td>
						<input type="text" name="modelNo" value="" size=15 />
					</td>
					<td>
						<input type="text" name="serialNo" value="" size=15 />
					</td>
					<td>
						<input type="checkbox" name="del" value=0 onclick="deleteDistItem(this);" />
					</td>
				</tr>
			</table>
		</div>

		<div style="clear: both;"></div>

	</div>
</div>
