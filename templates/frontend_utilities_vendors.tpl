<!-- list section -->
<div id="listView" style="margin: 1em; padding: 1em; border: 1px solid red;">

	<div id="listViewHeader" style="margin: 1em; padding: 1em; border: 1px solid green;">
		<div class="align-right">
			<button class = "level1button" onclick="setvId('new')">New Vendor</button>
		</div>
		List of Vendors.
		<span style="color: grey;">Click on a row to edit.</span> <br><br>
	</div>

	<div id="listViewTable" style="margin: 1em; padding: 1em; border: 1px solid green;">
		<table id="listTable">
			<thead>
				<tr>
					<th>
						<data value="vendorId">Id</data>
					</th>
					<th>
						<data value="vendorName">Name</data>
					</th>
					<th>
						<data value="address1">Address1 </data>
						<data value="address2">, </data>
						<data value="city">City, </data>
						<data value="state">State </data>
						<data value="zip">Zip</data>
					</th>
					<th>
						Contact:
						<data value="telephone"> Tel </data>
						<data value="facsimile">Fax </data>
						<data value="email">Email </data>
						<data value="website">Web</data>
					</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<span></span>
				</td>
				<td>
					<span></span>
				</td>
				<td>
					<span></span> <span></span><br />
					<span></span>, <span></span> <span></span>
				</td>
				<td>
					<span></span>, <span></span><br />
					<span></span>, <span></span>
				</td>
			</tr>

			</tbody>
		</table>
	</div>


</div>

<div id="formView" style="margin: 1em; padding: 1em; border: 1px solid red;">

	<div id="formViewHeader" style="margin: 1em; padding: 1em; border: 1px solid green;">
		Form View Header
	</div>

	<div id="formViewData" style="margin: 1em; padding: 1em; border: 1px solid green;">
	
		<span class=lbl1>Id: </span><input name="vendorId" value="" size=10 />
		<span class=lbl1>Name: </span><input name="vendorName" value="" size=10 />
		<br />
		
		<span class=lbl1>Addr1/2: </span><input name="address1" value="" size=10 />
			<input name="address2" value="" size=10 />
		<br />
		
		<span class=lbl1>City/State/Zip: </span><input name="city" value="" size=10 />
			<input name="state" value="" size=10 />
			<input name="zip" value="" size=10 />
		<br />
		
		<span class=lbl1>Tel/Fax: </span><input name="telephone" value="" size=10 />
			<input name="facsimile" value="" size=10 />
		<br />
		
		<span class=lbl1>Email/Web: </span><input name="email" value="" size=10 />
			<input name="website" value="" size=10 />
	</div>

	<div id="formViewDataItems" style="margin: 1em; padding: 1em; border: 1px solid green;">
		Form View Header Data Items
	</div>

</div>
