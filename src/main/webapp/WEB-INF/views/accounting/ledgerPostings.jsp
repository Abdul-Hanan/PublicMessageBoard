<%--
  Created by Winning Solutions.
  User: Shoaib ul din PC
  Date: 11/06/2019
  Time: 5:16 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
<title>Ledger Postings : Raseel</title>

<!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=account-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Favicon icon -->
<link rel="icon" href="${contextPath}/assets/images/logo-half.png"
	type="image/x-icon">
<!-- fontawesome icon -->
<link rel="stylesheet"
	href="${contextPath}/assets/fonts/fontawesome/css/fontawesome-all.min.css">
<!-- animation css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/animation/css/animate.min.css">
<!-- vendor css -->
<link rel="stylesheet" href="${contextPath}/assets/css/style.css">

<!-- data tables css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/data-tables/css/datatables.min.css">
<style>
td.details-control {
    background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_close.png') no-repeat center center;
}
</style>
</head>

<body>
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<%--    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>--%>
		<img src="${contextPath}/assets/images/pre-loader.gif"
			style="display: block; margin-left: auto; margin-right: auto; width: 40%;"
			align="middle">
	</div>
	<!-- [ Pre-loader ] End -->

	<!-- [ navigation menu ] start -->
	<jsp:include page="../../templates/side-menu.jsp"></jsp:include>
	<!-- [ navigation menu ] end -->

	<!-- [ Header ] start -->
	<jsp:include page="../../templates/header.jsp"></jsp:include>
	<!-- [ Header ] end -->


	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<!-- [ breadcrumb ] start -->
					<div class="page-header">
						<div class="page-block">
							<div class="row align-items-center">
								<div class="col-md-12">
									<div class="page-header-title">
										<%-- <h5 class="m-b-10">${ledger.name}</h5> --%>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a href="#!">Ledger
												Postings</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- [ breadcrumb ] end -->
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ sample-page ] start -->
								<div class="col-sm-12">
									<div class="card">
										<div class="card-header">
											<h5>${ledger.name}</h5>
											
											<div class="card-header-right">
												<sec:authorize access="hasAuthority('create-ledgerPosting')">
													<!--                                            	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#trialBalance">Get Trail Balance</button>
 -->
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#trialBalance"
														data-original-title="Trial Balance">Trial Balance</button>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#entryData"
														data-original-title="Create New Posting">Add
														Posting</button>
												</sec:authorize>


											</div>
											
										                                         
									<form action="${contextPath}/ledgerPostings" method="GET">			                  							
										 <div class="row">
										 <div class="col-md-3">
														<div class="form-group">
														 <br>
															<label>Shipment/Reference no.</label> <input
																class="form-control"  type="text"
																name="shipmentno" value="" />
														</div>
													</div>
													<div class="col-md-3">
														<input type="hidden" name="filter" value="1">
														<input type="hidden" name="ledgerId" value="${ledger.id}">
													
														<div class="form-group">
														 <br>
															<label>Select Customer</label> 
																<select
																		class="form-control js-example-basic-single"
																		name="customer">
																		<option selected disabled value="">Select Customer</option>
																		<c:forEach items="${customers}" var="customer">
																			<option value="${customer.id}">${customer.customerName}</option>
																		</c:forEach>
																	</select>
														</div>
														
													</div>
														<div class="col-md-3">
														<div class="form-group">
														 <br>
															<label>from Date</label> <input
																class="form-control"  type="date"
																name="fromdate" value="" />
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
														 <br>
															<label>to Date</label> <input
																class="form-control"  type="date"
																name="todate" value="" />
														</div>
													</div>
													<div class="col-md-3"  >
													<br>
														<button type="submit" style="margin-top: 25px;" class="btn btn-primary " title=""
															data-toggle="tooltip" data-original-title="Filter">
															Filter</button>
															
													</div>
											</div>
									</form>
													
										</div>
										
										<div class="card-block">

											
											<div class="table-responsive">
												<table id="postingsTable"
													class="display table nowrap table-hover"
													style="width: 100%">
													<thead>
														<tr>
															<th>Shipment/Transaction #</th>
															<th>Date</th>
															<th>Account</th>
															<th>Posting Description</th>
															<th>Entry Description</th>
															<th>Debit</th>
															<th>Credit</th>
															<!-- <th>Balance</th> -->
														</tr>
													</thead>
													<tbody>
														<c:forEach var="posting" items="${postings}">
														<tr style="background-color: #748892; color: white">
														<td>
														<c:if test="${posting.shipmentId != 0}">
														${posting.shipmentId}
														</c:if>
														
														</td>
														<td><fmt:formatDate type="date" value="${posting.postingDate}" /></td>
																			<td></td>
																			<td>${posting.postingMemo}</td>
																			<td></td>
																			<td>
																			<c:if test="${posting.referenceImage eq true}">
																			 <a target="_blank" style="color: white;" href="showPostingReference?id=${posting.postingId}" >view reference Image</a>
																			</c:if>
																			</td>
																			<td></td>
																			<!-- <td></td> -->
														</tr>
															<c:forEach var="entry" items="${posting.entries}">
																<tr style="background-color: #04a9f521; color: black">
																	<td>
																	<c:if test="${entry.posting.shipmentId != 0}">
																		${entry.posting.shipmentId}
																	</c:if>
																	</td>
																	<td></td>
																	<td><a data-toggle="modal"
																		data-target="#account${entry.entryAccount.id}"
																		class="btn btn-sm btn-rounded btn-outline-primary" data-cont="forms" style="color: black">${entry.entryAccount.accountName}</a></td>
																	<td></td>
																	<td>${entry.entryDescription}</td>

																	<c:if test="${entry.entryType eq 'Debit' }">
																		<td style="color: green;">${entry.entryAmount}</td>
																		<c:set var="balance"
																			value="${balance - entry.entryAmount }" />
																		<td></td>
																	</c:if>
																	<c:if test="${entry.entryType eq 'Credit' }">
																		<td></td>
																		<td style="color: red;">${entry.entryAmount}</td>
																		<c:set var="balance"
																			value="${balance + entry.entryAmount }" />
																	</c:if>

																	<%-- <td><fmt:formatNumber currencySymbol=""
																			type="currency" value="${balance}" /></td> --%>
																</tr>
															</c:forEach>
														</c:forEach>
													</tbody>
												</table>
											</div>


										</div>
									</div>
								</div>
								<!-- [ sample-page ] end -->
							</div>
							<!-- [ Main Content ] end -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="entryData" class="modal fade" role="dialog">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #748892;">
					<h6 style="color: white">Insert New Posting</h6>
					<button type="button" style="color: white" class="close"
						data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<form action="${contextPath}/addLegerPosting" method="post"
						id="formPosting">
						<input type="hidden" name="ledger" value="${ledger.id}">

						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label>Posting Description</label> <input type="text"
										name="postingMemo" required="required" class="form-control"
										placeholder="Enter Posting Description">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Shipment / Transaction No.</label> <input type="number"
										name="shipmentId" required="required" class="form-control"
										placeholder="Shipment No">
								</div>
							</div>
							<input type="hidden" name="postings" id="postings">


							<div class="col-md-12">
								<h5>
									<u>Entries</u>
								</h5>
							</div>
						</div>

						<div class="col-md-12">
							<div class="mt-repeater posting">
								<div data-repeater-list="postingDetails">

									<div data-repeater-item>
										<div class="row">
											<div class="col-md-3">
												<div class="form-group">
													<label class="control-label">Account</label> <select
														required class="form-control" name="account">
														<option selected disabled>Select Account</option>
														<c:forEach var="account" items="${accounts}">
															<option value="${account.id}">${account.accountName} | ${account.accountDescription} </option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label">Description</label> <input
														type="text" class="form-control" placeholder="Description"
														name="description" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label class="control-label">Type</label> <select required
														onchange="balanceType()" class="form-control amountType"
														name="type">
														<option selected disabled>Select</option>
														<option value="Debit">Debit</option>
														<option value="Credit">Credit</option>
													</select>

												</div>
											</div>

											<div class="col-md-2">
												<div class="form-group">
													<label class="control-label">Amount</label> <input
														type="text" required onkeyup="balanceAmount()"
														class="form-control" placeholder="Amount" name="amount" />
												</div>
											</div>

											<div class="col-md-1">
												<div class="form-group" style="margin-top: 25px;">
													<a href="javascript:;" data-repeater-delete
														class="btn btn-danger mt-repeater-delete">X </a>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div align="right">
									<div class="form-group">
										<a href="javascript:;" data-repeater-create
											class="btn btn-primary mt-repeater-add">Add </a>
									</div>
								</div>

							</div>

						</div>

						<div class="col-md-12" align="right">
							<hr>
							<button type="submit" disabled id="submitPosting"
								class="btn btn-primary">Submit</button>
						</div>

					</form>

				</div>
			</div>

		</div>
	</div>

	<div id="trialBalance" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #748892;">
					<h6 style="color: white">Trial Balance</h6>
					<button type="button" style="color: white" class="close"
						data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<table class="table datatableTrialBalance">
						<thead>
							<tr>
								<th>Account</th>
								<th>Debit</th>
								<th>Credit</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="debitBalance" value="0" />
							<c:set var="creditBalance" value="0" />
							<c:forEach var="account" items="${accounts}">
								<c:set var="balance" value="0" />
								<tr>
									<td>${account.accountName}</td>
									<c:forEach var="posting" items="${postings}">
										<c:forEach var="entry" items="${posting.entries}">
											<c:if
												test="${entry.entryAccount.accountName eq account.accountName}">
												<c:if test="${entry.entryType eq 'Debit' }">
													<c:set var="balance"
														value="${balance - entry.entryAmount }" />
												</c:if>
												<c:if test="${entry.entryType eq 'Credit' }">
													<c:set var="balance"
														value="${balance + entry.entryAmount }" />
												</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
									<c:if test="${balance >= 0}">
										<td></td>
										<c:set var="toShowB"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${balance}" /></c:set>
										
										<td>${toShowB}</td>
										<c:set var="creditBalance" value="${creditBalance+balance}" />
									</c:if>
									<c:if test="${balance < 0}">
										<c:set var="toShowB"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${balance*(-1)}" /></c:set>
									
										<td>${toShowB}</td>
										<td></td>
										<c:set var="debitBalance" value="${debitBalance+balance}" />
									</c:if>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><strong>Total</strong></td>
								<c:set var="toShowB"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${debitBalance*(-1)}" /></c:set>
								
								<td><strong>${toShowB}</strong></td>
								<c:set var="toShowB"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${creditBalance}" /></c:set>
								
								<td><strong>${toShowB}</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<c:forEach var="accounts" items="${accounts}" varStatus="loop">
		<div id="account${accounts.id}" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color: #748892;">
						<h6 style="color: white">${accounts.accountName}</h6>
						<button type="button" style="color: white" class="close"
							data-dismiss="modal">&times;</button>

					</div>
					<div class="modal-body">
						<table class="table datatableTrialBalance">
							<thead>
								<tr>
									<th>Date</th>
									<th>Description</th>
									<th>Debit</th>
									<th>Credit</th>
									<!-- <th>Balance</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="posting" items="${postings}">
									<c:forEach var="entry" items="${posting.entries}">
										<c:if
											test="${entry.entryAccount.accountName eq accounts.accountName}">
											<tr>
												<td><fmt:formatDate type="date"
														value="${entry.posting.postingDate}" /></td>
												<td>${entry.posting.postingMemo}</td>
												<c:if test="${entry.entryType eq 'Debit' }">
													<td>${entry.entryAmount}</td>
													<c:set var="balance"
														value="${balance - entry.entryAmount }" />
													<td></td>
												</c:if>
												<c:if test="${entry.entryType eq 'Credit' }">
													<td></td>
													<td>${entry.entryAmount}</td>
													<c:set var="balance"
														value="${balance + entry.entryAmount }" />
												</c:if>
												<%-- <td><fmt:formatNumber currencySymbol="" type="currency"
														value="${balance}" /></td> --%>
											</tr>
										</c:if>
									</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- Warning Section Ends -->

	<!-- Required Js -->
	<script src="${contextPath}/assets/js/vendor-all.min.js"></script>
	<script
		src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/assets/js/pcoded.min.js"></script>

	<!-- datatable Js -->
	<script
		src="${contextPath}/assets/plugins/data-tables/js/datatables.min.js"></script>
	<script src="${contextPath}/assets/js/pages/tbl-datatable-custom.js"></script>
	<script
		src="${contextPath}/assets/plugins/sweetalert/js/sweetalert.min.js"></script>

	<script
		src="${contextPath}/assets/plugins/jquery-repeater/jquery.repeater.min.js"></script>
	<script
		src="${contextPath}/assets/plugins/jquery-repeater/form-repeater.min.js"></script>


	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>
	<script>
		function balanceAmount() {
			var debitBalance = 0;
			var creditBalance = 0;
			$('.amountType option:selected').each(
					function(i, obj) {
						var jelm = $(obj);
						if (jelm.text() == 'Debit') {
							debitBalance += +jelm.parent().parent().parent()
									.next().find("input").val();
						} else if (jelm.text() == 'Credit') {
							creditBalance += +jelm.parent().parent().parent()
									.next().find("input").val();
						}
					});
			if (debitBalance == creditBalance) {
				$('#submitPosting').prop('disabled', false);
			} else {
				$('#submitPosting').prop('disabled', true);
				//$('#submitPosting').prop('display', "none");
			}

		}

		function balanceType() {
			$('#submitPosting').prop('disabled', true);
		}

		$(document).ready(function() {

			$('#postingsTable').DataTable({
				"paging":   false,
		        "ordering": false,
		        "info":     false,
		        searching: false,
		        dom : 'Bfrtip',
				buttons : [ {
					text : '<i class="fa fa-file-pdf-o"></i> PDF',
					extend : 'pdfHtml5'
				}, {
					text : '<i class="fa fa-print"></i> Print',
					extend : 'print'
				} ]
			});

			$('.datatableTrialBalance').DataTable({
				"paging":   false,
		        "ordering": false,
		        "info":     false,
		        searching: false,
		        dom : 'Bfrtip',
				buttons : [ {
					text : '<i class="fa fa-file-pdf-o"></i> PDF',
					extend : 'pdfHtml5'
				}, {
					text : '<i class="fa fa-print"></i> Print',
					extend : 'print'
				} ]
			});
					$('#formPosting').submit(
											function(e, params) {
												var localParams = params || {};
												if (!localParams.send) {
													e.preventDefault();

													var myFormObj = $(
															'.mt-repeater.posting')
															.repeaterVal();
													var myFormJson = JSON
															.stringify(myFormObj);
													$('#postings').val(
															myFormJson);
													console.log(myFormJson);

												}
												swal({title : "Are you sure?",
															text : "You will not be able to change this posting!",
															type : "success",
															showCancelButton : true,
															confirmButtonColor : "#3C8DBC",
															confirmButtonText : "Confirm",
															cancelButtonText : "Back",
															closeOnConfirm : false,
															closeOnCancel : false
														}).then((isConfirm) => {
															if (isConfirm) {
																$(e.currentTarget).trigger(e.type,{'send' : true});
															} else {
																swal("Cancelled",
																		"You can change posting",
																		"error");}
														});
											});

						});
	</script>
	
<!-- 	<script>
	/* Formatting function for row details - modify as you need */
	function format ( d ) {
	    // `d` is the original data object for the row
	    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
	        '<tr>'+
	            '<td>Full name:</td>'+
	            '<td>'+d.name+'</td>'+
	        '</tr>'+
	        '<tr>'+
	            '<td>Extension number:</td>'+
	            '<td>'+d.extn+'</td>'+
	        '</tr>'+
	        '<tr>'+
	            '<td>Extra info:</td>'+
	            '<td>And any further details here (images etc)...</td>'+
	        '</tr>'+
	    '</table>';
	}

	$(document).ready(function() {
	    var table = $('#example').DataTable({
	        'ajax': 'https://api.myjson.com/bins/16lp6',
	        'columns': [
	            {
	                'className':      'details-control',
	                'orderable':      false,
	                'data':           null,
	                'defaultContent': ''
	            },
	            { 'data': 'name' },
	            { 'data': 'position' },
	            { 'data': 'office' },
	            { 'data': 'salary' }
	        ],"paging":   false,
	        "ordering": false,
	        "info":     false,
	        "searching": false
	    } );
	    /* ,
        dom : 'Bfrtip',
		buttons : [ {
			text : '<i class="fa fa-file-pdf-o"></i> PDF',
			extend : 'pdfHtml5'
		}, {
			text : '<i class="fa fa-print"></i> Print',
			extend : 'print'
		} ] */

	    // Add event listener for opening and closing details
	    $('#example tbody').on('click', 'td.details-control', function(){
	        var tr = $(this).closest('tr');
	        var row = table.row( tr );

	        if(row.child.isShown()){
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	        } else {
	            // Open this row
	            row.child(format(row.data())).show();
	            tr.addClass('shown');
	        }
	    });

	    // Handle click on "Expand All" button
	    $('#btn-show-all-children').on('click', function(){
	        // Enumerate all rows
	        table.rows().every(function(){
	            // If row has details collapsed
	            if(!this.child.isShown()){
	                // Open this row
	                this.child(format(this.data())).show();
	                $(this.node()).addClass('shown');
	            }
	        });
	    });

	    // Handle click on "Collapse All" button
	    $('#btn-hide-all-children').on('click', function(){
	        // Enumerate all rows
	        table.rows().every(function(){
	            // If row has details expanded
	            if(this.child.isShown()){
	                // Collapse row details
	                this.child.hide();
	                $(this.node()).removeClass('shown');
	            }
	        });
	    });
	});
	</script> -->
</body>

</html>
