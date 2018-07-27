<div id="listView" class="div_wrap">

	List of Distributions.
	<span style="color: grey;">Click on a row to edit.</span> <br><br>

	<table id="listTable">
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

<div id="formView" class="div_wrap">
		<!-- added this div wrapper -->
		<div id="formViewHeader">

			<div class="align-right">
				<button class = "level1button" onclick="print_rq();">Print</button>
				<button class = "level1button" onclick="main('button');">Save</button>
			</div>
			<div class="align-left"><button class = "level1button" onclick="setRQId(0)">Back to List</button></div>
			<center>Distribution ID <span id="rqId" style="font-weight: bold;"></span></center>
			<div style="clear: both;"></div>

		</div>

		<!-- changed the id of this div  from "setheight" to "formViewLeftPanel" -->
		<div id = "formViewLeftPanel" class = "align-left" style="width: 34%;"">

			<!-- changed the id of this table from "distTable" to "rcvTable" -->
			<table id = "rcvTable">

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
				  <td class="btn btn-info btn-lg" id = "plus">
				  	<span onclick="addRowHandlers(this);"> + </span></td>
				</tr>
			</table>
		</div>

		<!-- changed the id of this div wrapper from "distform" to "formViewRightPanel" -->
		<div id = "formViewRightPanel" class = "align-right" style="width: 65%;">

			<form id = "MyForm">

				<!-- added this div wrapper -->
				<div id="distInfo">
					Distrib Id:		<input type="text" name="distributionId" value="" size=4 />
					Destination:	<input type="text" name="destination" value="" />
					PrepBy:			<input type="text" name="preparedBy" value="" />
					PrepDate:		<input type="text" name="preparedDate" value="" size=12 />
					DlvrBy:			<input type="text" name="deliveredBy" value="" />
					DlvrDate:		<input type="text" name="deliveredDate" value="" size=12 />
					RcvBy:			<input type="text" name="receivedBy" value="" />
					RcvDate:		<input type="text" name="receivedDate" value="" size=12 />
					Status:			<input type="text" name="status" value="" />
					Status Date:	<input type="date" name="statusDate" value="" size=10 />
					<br />
					Remarks:		<input type="text" name="remarks" value="" size=60 />
				</div>

				<!-- changed the id of this table from "distTable2" to "distTable" -->
				<table id = "distTable">
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

		</form>
	</div>
</div>
