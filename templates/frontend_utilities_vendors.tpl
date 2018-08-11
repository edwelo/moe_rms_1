<!-- list section -->
<div id="listView" style="float: left; width: 920px;">

	<div id="listViewHeader" class="level2header">
		<button class="newButton" onclick="setvId('new')">New Vendor</button>
		List of Vendors.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>
	</div>

	<div id="listViewTable">
		<table id="listTable" class="level1table">
			<thead>
				<tr>
					<th>
						<data value="vendorId">Id</data>
					</th>
					<th>
						<data value="vendorName">Vendor Name / </data>
						<data value="city">City, </data>
						<data value="state">State </data>
						<data value="zip">Zip</data>
					</th>
					<th>
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
				<td>
					<span></span>
				</td>
				<td>
					<span></span><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span></span>, <span></span> <span></span>
				</td>
				<td>
					<span></span><br /><span></span>
				</td>
				<td>
					<span></span><br /><span></span>
					<!-- <span></span>, <span></span> -->
				</td>
			</tr>

			</tbody>
		</table>
	</div>

</div>

<div id="formView" style="float: left; margin: 1em; padding: 1em; border: 1px solid red;">

	<div id="formViewHeader" style="margin: 1em; padding: 1em; border: 1px solid green;">
		Form View Header
	</div>

	<div id="formViewData" style="margin: 1em; padding: 1em; border: 1px solid green;">

		<span class=lbl1>Id: </span><input name="vendorId" value="" size=10 />
		<span class=lbl1>Name: </span><input name="vendorName" value="" size=50 />
		<br />

		<span class=lbl1>Addr1/2: </span><input name="address1" value="" size=30 />
			<input name="address2" value="" size=30 />
		<br />

		<span class=lbl1>City/State/Zip: </span><input name="city" value="" size=10 />
			<input name="state" value="" size=10 />
			<input name="zip" value="" size=10 />
		&nbsp;&nbsp;&nbsp;

		<span class=lbl1>Tel/Fax: </span><input name="telephone" value="" size=12 />
			<input name="facsimile" value="" size=12 />
		<br />

		<span class=lbl1>Email/Web: </span><input name="email" value="" size=30 />
			<input name="website" value="" size=30 />
	</div>

</div>

<div style="clear: both;"></div>
