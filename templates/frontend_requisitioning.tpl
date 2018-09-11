	<!-- requisition list section -->
	<div id="listView" class="div_wrap" style="display: none;">

		<div id="listViewHeader">
			<button class="level1button" style="float: right;" onclick="setId('new')">New RQ</button>
			List of Purchase Orders.
			<span style="color: grey;">Click on a row to edit.</span> <br><br>
		</div>

		<div id="listViewDetail">
			<table id="rqListTable" class="level1table" style="width: 100%;">
				<caption>
					requisitionId,initiatingOffice,requestedBy,preparedByName,preparedDate,numItems,rqAmount,vendorName,justification,poNo,poDate
				</caption>
				<thead>
					<tr>
						<th style="width: 30px;">Id</th>
						<th style="width: 100px;">Requestor</th>
						<th style="width: 100px;">By/Amount</th>
						<th style="width: 100px;">Vendor</th>
						<th style="width: 515px;">Justification</th>
						<th style="width: 80px;">PO No/Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 30px;">
							<span></span>
						</td>
						<td style="width: 100px;">
							<span></span><br />
							<span></span>
						</td>
						<td style="width: 100px;">
							<span></span><br />
							<span></span><br />
							<span></span>, $<span></span>
						</td>
						<td style="width: 100px;">
							<span></span>
						</td>
						<td style="width: 515px;">
							<span></span>
						</td>
						<td style="width: 80px;">
							<span></span><br />
							<span></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- requisition form section -->
	<div id="formView" class="div_wrap" style="display: none;">

		<div id="formViewHeader">
			<button class="level1button" style="float: right;" onclick="main('save');">Save</button>
			<button class="level1button" style="float: right;" onclick="print_rq();">Print</button>
			<button class="level1button" style="float: left;" onclick="setId(0)">Back to List</button>
			<h2>Requisition ID <span id="rqId" style="font-weight: bold;"></span></h2>
			<div style="clear: both;"></div>
		</div>

		<div id="formViewData" style="min-height: 450px;">

			<div id="rqData" class="div_wrap3">
				<span style="cursor: pointer" onclick="window.open('?pn=Utilities&t1=Cost Centers', '_blank')">Request Office</span>/By/Date:
								<input type="text" name="initiatingOffice" value="" size=15 id="costCenter" onchange="check_cctr()" />
				 				<input type="text" name="requestedBy" value="" size=15 />
								<input type="text" name="requestedDate" value="" size=10 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Prep By/Date: 	<input readonly type="text" name="preparedByName" value="" size=15 /><input type=hidden name="preparedById" value="" />
						 		<input type="text" name="preparedDate" value="" size=10 /><br />
				
				Vendor: 		<input type="text" name="vendorId" value="" size=2 onchange="get_vendor(this);"/>
								<input readonly name="vendorName" value="" size=60 id="vendorName" onclick="window.open('?pn=Utilities&t1=Vendors', '_blank')" />
				RqAmount: 	   $<input type=text name="rqAmount" value="" readonly size=12 />
				ApprvDate:		<input type="text" name="approvedDate" value="" size=10 /><br />

				Justification:	<input type="text" name="justification" value="" size=120 /><br />
				Remarks:	<input type="text" name="remarks" value="" size=120 /><br />

				MOFdlvrDate: 	<input type="text" name="mofDeliveredDate" value="" size=10 />
				PO: 			<input type="text" name="poNo" value="" size=10 />
				PO Type: 		<input type="text" name="poType" value="" size=10 />
				PO Date:		<input type="text" name="poDate" value="" size=10 />
				PO Amount: 	   $<input type="text" name="poAmount" value="" size=12 />
				
								<input type="hidden" name="userId" value="{uidnumber}" />
			</div>

			<div id="rqItems" class="div_wrap3" style="height: 350px;">
				<table id="items_table" class="level3table">
					<thead>
						<tr>
							<th> Id </th>
							<th> Org </th>
							<th> CCtr </th>
							<th> Task </th>
							<th> Opt </th>
							<th> SAcc </th>
							<th style="text-align: right;"> Qty </th>
							<th> Unit </th>
							<th style="text-align: right;"> Price </th>
							<th style="text-align: right;"> Extended</th>
							<th> Description </th>
							<th style="width: 20px;"> del </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input style="width: 30px;" readonly type="text" name="requisitionItemId" value=""></td>
							<td><input style="width: 40px;" type="text" name="org" value=""></td>
							<td><input style="width: 63px;" type="text" name="costCenter" value=""></td>
							<td><input style="width: 55px;" type="text" name="task" value=""></td>
							<td><input style="width: 55px;" type="text" name="opt" value=""></td>
							<td><input style="width: 40px;" type="text" name="acc" value=""></td>
							<td><input style="width: 90px; text-align: right;" type="text" name="quantity" value=""></td>
							<td><input style="width: 62px;" type="text" name="unit" value=""></td>
							<td><input style="width: 90px; text-align: right;" type="text" name="price" value=""></td>
							<td><input style="width: 90px; text-align: right;" readonly type="text" name="extended" value=""></td>
							<td><input style="width: 300px;" type="text" name="description" value=""></td>
							<td><input type="checkbox" name="del" value=0 onclick="deleteRowItem(this);"></td>
						</tr>
					</tbody>
				</table>
				<button class = "level2button" onclick="copyRow('items_table');"> + </button>
			</div>
		</div>
	</div>