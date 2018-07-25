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

<div id="formView" class="div_wrap">

	<div class="align-right">
		<button onclick="print_rq();">Print</button>
		<button onclick="main('button');">Save</button>
	</div>

	<button onclick="setRQId(0)">Back to List</button>
	<center>Distribution ID <span id="rqId" style="font-weight: bold;"></span></center>

	<div class = "align-left" style="width: 45%;">
	  <table id = "distTable">
		<caption> receivingId, receivingItemId, requisitionItemId, description, quantity </caption>
		<tr> 
		  <th> RcvId </th>
		  <th> RcvItemId </th>
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
		  <td></td>
		  <td class="btn btn-info btn-lg" id = "plus"> + </td>
		</tr>
	  </table>
	</div>

	<div class = "align-right" style="width: 55%;">
		
		<form id = "MyForm"> 
			Form ID:          <input type="text" name="formid" value="" >
			Form Date:        <input type="date" name="formdate" value="" ><br/>
			Destination:      <input type="text" name="destination" value="" ><br/>
			Date Completed:   <input type="date" name="dt_compl" value="" >

			<table id = "distTable2">
				<tr> 
					<th> Dist Item Id </th>
					<th> Req Item Id </th>
					<th> Description </th>
					<th> Quantity </th>
					<th style="width: 20px;"> del </th>
				</tr>

				<tr> 
					<td></td>
					<td></td>
					<td></td>
					<td style = "padding: 2px;"> <input type="text" name="quantity" value="" /></td>
					<td> <input type="checkbox" name="del" value=0 /> </td>
				</tr>
			</table>

			<button onclick="deleteRow('distTable2');"> - </button><br/>
			<button onclick="save();"> Save </button>

		</form>
	</div>
</div>
