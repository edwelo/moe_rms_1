<div id="listView" class="div_wrap">

	<div id="listViewHeader">
		<div class="header-right">
			<button class = "level1button" onclick="setRQId('new')">New RQ</button>
		</div>
		List of Purchase Orders.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>
	</div>

	<div id="listViewDetail">
		<table id="listTable" class="level1table">
			<caption>
				distributionId,refPOs,numItems,deliveredBy,deliveredDate,destination,receivedBy,receivedDate,remarks
			</caption>
			<tr>
				<th>Id</th>
				<th>POs / numItems</th>
				<th>Dlvr By/Date</th>
				<th>Destination /<br />Rcv By/Date</th>
				<th>Remarks</th>
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
			</tr>
		</table>
	</div>
</div>

<div id="formView" class="div_wrap">

		<div id="formViewHeader">

			<div class="header-right">
				<button class = "level1button" onclick="print_rq();">Print</button>
				<button class = "level1button" onclick="main('save');">Save</button>
			</div>
			<div class="header-left">
				<button class = "level1button" onclick="setRQId(0)">Back to List</button>
			</div>

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

		<div id="formViewRightPanel" class="div_wrap2" style="float: left; width: 850px; min-height: 500px; margin-top: 0; margin-bottom: 0;">

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

				<tr>
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
