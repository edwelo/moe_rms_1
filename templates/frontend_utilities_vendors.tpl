<div id="formView" style="float: left; width: 100%;">

	<div id="formViewHeader" class="level2Header">
		<button class="button" style="float: right;" onclick="main('save')">Save</button>
		<button class="button" style="float: left;" onclick="setId(0)">Back to List</button>
		Enter/Edit This Vendor.
	</div>

	<div id="formViewData" class="div_wrap2">

		<span class=lbl1>Id: </span>
			<span id="rqId" style="font-size: x-large; font-weight: bold;"></span>
			<input hidden name="vendorId" value="new" size=10 />
		<br /><br />

		<span class=lbl1>Name: </span><input name="vendorName" value="" size=50 />
		<br />

		<span class=lbl1>Addr1/2: </span><input name="address1" value="" size=30 />
			<input name="address2" value="" size=30 />
		<br />

		<span class=lbl1>City/State/Zip: </span><input name="city" value="" size=10 />
			<input name="state" value="" size=10 />
			<input name="zip" value="" size=10 />
		<br />

		<span class=lbl1>Tel/Fax: </span><input name="phone" value="" size=20 />
			<input name="fax" value="" size=20 />
		<br />

		<span class=lbl1>Email/Web: </span><input name="email" value="" size=30 />
			<input name="website" value="" size=30 />
	</div>

</div>

<div id="listView" style="float: left; width: 100%;">

	<div id="listViewHeader" class="level2header" style="margin: 0; padding: 0;">
		<button class="level2button" style="float: right;" onclick="setId('new')">New Vendor</button>
		List of Vendors.
		<span style="color: grey;">Click on a row to edit.</span>
	</div>

	<div id="listViewTable" style="margin: 0; padding: 0;">
		<table id="listTable" class="level1table">
			<thead>
				<tr>
					<th style="width: 35px;">
						<data value="vendorId">Id</data>
					</th>
					<th style="width: 300px;">
						<data value="vendorName">Vendor Name / </data>
						<data value="city">City, </data>
						<data value="state">State </data>
						<data value="zip">Zip</data>
					</th>
					<th style="width: 300px;">
						<data value="address1">Address</data>
						<data value="address2"></data>
					</th>
					<th style="width: 120px;">
						Contact:
						<data value="phone"> Tel / </data>
						<data value="fax">Fax</data>
						<!--
						<data value="email">Email </data>
						<data value="website">Web</data>
						-->
					</th>
				</tr>
			</thead>
			<tbody>
				<tr style="vertical-align: top;">
					<td style="width: 35px;">
						<span></span>
					</td>
					<td style="width: 300px;">
						<span></span><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span></span>, <span></span> <span></span>
					</td>
					<td style="width: 300px;">
						<span></span><br /><span></span>
					</td>
					<td style="width: 120px;">
						<span></span><br /><span></span>
						<!-- <span></span>, <span></span> -->
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</div>

<div style="clear: both;"></div>
