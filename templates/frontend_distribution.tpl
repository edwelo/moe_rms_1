	<div id="listView">

		List of Distributions.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>

		<table id="listTable" class="tbl">
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
			<tr style="vertical-align: top; cursor: pointer;">
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
	<div id="formView">
		<div class = "align-left" style="width: 30%;"">
		  <table id = "distTable">
			<caption> poNo, requisitionItemId, description, quantity </caption>
			<tr>
			  <th> PO# </th>
			  <th> Req Item Id </th>
			  <th> Description </th>
			  <th> Quantity </th>
			  <th> </th>
			</tr>
			<tr>
			  <td></td>
			  <td></td>
			  <td></td>
			  <td></td>
			  <td class="btn btn-info btn-lg" id = "plus"> + </td>
			</tr>
		  </table>
		</div>
		<div class = "align-right" style="width: 60%;">
		  <table id = "distTable2">
			<tr>
			  <th> Req Item Id </th>
			  <th> Req Id </th>
			  <th> Asset No </th>
			</tr>
		  </table>
		</div>
	</div>