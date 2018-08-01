<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>MOE Print RQ</title>

  <!-- Normalize or reset CSS with your favorite library -->
  <!-- https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css -->

  <!-- Load paper.css for happy printing -->
  <!-- https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.4.0/paper.css -->

  <style type="text/css">

		@page { margin: 0 }
		body { margin: 0 }
		.sheet {
		  margin: 0;
		  overflow: hidden;
		  position: relative;
		  box-sizing: border-box;
		  page-break-after: always;
		}

		/** Paper sizes **/
		body.A3               .sheet { width: 297mm; height: 419mm }
		body.A3.landscape     .sheet { width: 420mm; height: 296mm }
		body.A4               .sheet { width: 210mm; height: 296mm }
		body.A4.landscape     .sheet { width: 297mm; height: 209mm }
		body.A5               .sheet { width: 148mm; height: 209mm }
		body.A5.landscape     .sheet { width: 210mm; height: 147mm }
		/*body.letter           .sheet { width: 216mm; height: 279mm }*/
		body.letter           .sheet { width: 216mm; }
		body.letter.landscape .sheet { width: 280mm; height: 215mm }
		body.legal            .sheet { width: 216mm; height: 356mm }
		body.legal.landscape  .sheet { width: 357mm; height: 215mm }

		/** Padding area **/
		.sheet.padding-10mm { padding: 10mm }
		.sheet.padding-15mm { padding: 15mm }
		.sheet.padding-20mm { padding: 20mm }
		.sheet.padding-25mm { padding: 25mm }

		/**   **/
		#header_table { table-layout: fixed; width: 100%; border-collapse: collapse; border: none; }
		#header_table th { border: 1px solid #ccc; padding: 0 4px 0 4px; }
		#header_table td { border: 1px solid #ccc; padding: 0 4px 0 4px; vertical-align: top; }

		#itemHdgs_table { table-layout: fixed; width: 100%; border-collapse: collapse; border: none; }
		#itemHdgs_table th {
			border-left: 1px solid #ccc;
			border-right: 1px solid #ccc;
			font-size: small;
			color: #ccc;
		}

		#items_div { position: relative; height: 140mm; }

		#items_table { table-layout: fixed; width: 100%; border-collapse: collapse; border: none; }
		#items_table tr { vertical-align: top; }
		#items_table td { padding-top: 2mm; border: 1px solid transparent; font-size: medium; }

		#itemsBackground_table { position: absolute; top: 0; left: 0;
				table-layout: fixed; width: 100%; border-collapse: collapse; border: 1px solid #ccc; }
		#itemsBackground_table td { height: 139mm; border: 1px solid #ccc; font-size: small; }

		#rqTotal { width: 30mm; margin-left: 103mm; padding-right: 2mm; border: 1px solid #ccc; text-align: right; }

		#footer_table { table-layout: fixed; width: 100%; border-collapse: collapse; border: 1px solid #ccc; }
		#footer_table th { border: 1px solid #ccc; padding: 0 4px 0 4px; }
		#footer_table td { border: 1px solid #ccc; padding: 0 4px 0 4px; vertical-align: top; }

		.lbl1 { font-size: small; color: grey; }
		.data { font-size: medium; margin: 2mm 0 0 4mm; }

		#c01 { width: 08mm; padding-right: 1mm; text-align: right; }
		#c02 { width: 08mm; padding-left: 1mm; }
		#c03 { width: 08mm; padding-left: 1mm; }
		#c04 { width: 14mm; padding-left: 1mm; }
		#c05 { width: 14mm; padding-left: 1mm; }
		#c06 { width: 12mm; padding-left: 1mm; }
		#c07 { width: 12mm; padding-right: 1mm; text-align: right; }
		#c08 { width: 08mm; padding-left: 1mm; }
		#c09 { width: 18mm; padding-right: 1mm; text-align: right; }
		#c10 { width: 18mm; padding-right: 1mm; text-align: right; }
		#c11 { padding-left: 1mm; }

		/** For screen preview **/
		@media screen {
		  body { background: #e0e0e0 }
		  .sheet {
			background: white;
			box-shadow: 0 .5mm 2mm rgba(0,0,0,.3);
			margin: 5mm auto;
		  }
		}

		/** Fix for Chrome issue #273306 **/
		@media print {
				   body.A3.landscape { width: 420mm }
		  body.A3, body.A4.landscape { width: 297mm }
		  body.A4, body.A5.landscape { width: 210mm }
		  body.A5                    { width: 148mm }
		  body.letter, body.legal    { width: 216mm }
		  body.letter.landscape      { width: 280mm }
		  body.legal.landscape       { width: 357mm }
		}

  </style>

  <!-- Set page size here: A5, A4 or A3 -->
  <!-- Set also "landscape" if you need -->
  <style>@page { size: letter }</style>
</head>

<!-- Set "A5", "A4" or "A3" for class name -->
<!-- Set also "landscape" if you need -->
<body class="letter">

  <!-- Each sheet element should have the class "sheet" -->
  <!-- "padding-**mm" is optional: you can set 10, 15, 20 or 25 -->
  <section class="sheet padding-10mm">

    <!-- Write HTML just like a web page -->
 		<table id="header_table">
			<tr>
				<td colspan=6>
					<span>REPUBLIC OF PALAU</span>
					<h1 style="margin: 0; padding: 0; text-align: center;"><strong>REQUISITION</strong></h1>
					<span class=lbl1>Requisition Id:</span> <span>{requisitionId}</span>
				</td>
			</tr>
			<tr>
				<td colspan=2 style="width: 60mm;">
					<span class=lbl1>Requesting Office:</span>
					<p class=data>{initiatingOffice}</p>
				</td>
				<td colspan=2 style="width: 60mm;">
					<span class=lbl1>Prepared By:</span>
					<p class=data>{preparedByName}</p>
				</td>
				<td>
					<span class=lbl1>Date Entered:</span>
					<p class=data>{preparedDate}</p>
				</td>
				<td>
					<span class=lbl1>Purchase Order No:</span>
					<p class=data>{poNo}</p>
				</td>
			</tr>
			<tr>
				<td colspan=3 style="width: 70mm;">
					<span class=lbl1>Vendor Name, Number and Address:</span>
					<p class=data>{vendorName}<br />
					{vAddress}<br />
					{vCityStateZip}<br />
					<span style="font-size: small;">{vContact}</span></p>
				</td>
				<td colspan=3>
				<span class=lbl1>Delivery Name and Address:</span>
					<p class=data>Ministry of Education<br />
					Main Street Madalaii Box 189<br />
					Koror, PW 96940<br />
					<span style="font-size: small;">Tel: +680 488-6425 &nbsp; fax: +680 488-8465</span></p>
				</td>
			</tr>
		</table>

		<table id="itemHdgs_table">
			<tr>
				<th id="c01">No</th>
				<th id="c02">Fund</th>
				<th id="c03">Sub</th>
				<th id="c04">Task</th>
				<th id="c05">Opt</th>
				<th id="c06">CCtr</th>
				<th id="c07">Qty</th>
				<th id="c08">Unit</th>
				<th id="c09">Price</th>
				<th id="c10">Total</th>
				<th id="c11">Description</th>
			</tr>
		</table>

		<div id="items_div">

			<table id="items_table">
				<tr id=row>
					<td id="c01">{no}</td>
					<td id="c02">{org}</td>
					<td id="c03">{acc}</td>
					<td id="c04">{task}</td>
					<td id="c05">{opt}</td>
					<td id="c06">{costCenter}</td>
					<td id="c07">{quantity}</td>
					<td id="c08">{unit}</td>
					<td id="c09">{price}</td>
					<td id="c10">{extended}</td>
					<td id="c11">{description}</td>
				</tr>
			</table>

			<table id="itemsBackground_table">
				<tr>
					<td id="c01"></td>
					<td id="c02"></td>
					<td id="c03"></td>
					<td id="c04"></td>
					<td id="c05"></td>
					<td id="c06"></td>
					<td id="c07"></td>
					<td id="c08"></td>
					<td id="c09"></td>
					<td id="c10"></td>
					<td id="c11"></td>
				</tr>
			</table>

		</div>

		<div id="rqTotal">{rqAmount}</div>

		<div style="height: 23mm; padding-right: 2em;">
			<span class=lbl1>Justification:</span>
			<p class=data>{justification}</p>
		</div>

 		<table id="footer_table">
			<tr class="footer">
				<td colspan=2>
					<span class=lbl1>Approved by Director:</span><br /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size: small;">{director}</span>
				</td>
				<td>
					<span class=lbl1>Date:</span><br /><br />
				</td>
				<td colspan=2>
					<span class=lbl1>Approved by Procurement Officer:</span><br /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size: small;">{procurementOfficer}</span>
				</td>
				<td>
					<span class=lbl1>Date:</span><br /><br />
				</td>
			</tr>
			<tr class="footer">
				<td colspan=2>
					<span class=lbl1>Approved by Minister:</span><br /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size: small;">{minister}</span>
				</td>
				<td>
					<span class=lbl1>Date:</span><br /><br />
				</td>
				<td colspan=2>
					<span class=lbl1>Funds Availability:</span><br /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size: small;">{budgetROP}</span>
				</td>
				<td>
					<span class=lbl1>Date:</span><br /><br />
				</td>
			</tr>
		</table>

  </section>

	<!--  https://github.com/cognitom/paper-css/blob/master/examples/letter.html -->
</body>

</html>