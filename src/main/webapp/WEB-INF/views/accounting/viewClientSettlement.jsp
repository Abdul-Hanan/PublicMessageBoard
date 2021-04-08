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

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
<title>Client Settlement :: Raseel</title>

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
										<h5 class="m-b-10">Client Settlement</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a href="#!">Client Settlement</a></li>
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
											<div class="card-header"
												style="background: #f4f7fa; color: black">
												<form action="${contextPath}/clientSettlement" method="POST">
													<input type="hidden" name="filter" value="1">

													<div class="row">
														<div class="col-md-3">
															<div class="form-group">
																<label>Select Client</label> <select
																	class="form-control js-example-basic-single"
																	name="client">
																	<c:forEach items="${customers}" var="customer">
																		<option value="${customer.id}">${customer.customerName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-md-3">
															<div class="form-group">
																<label>from Date</label> <input class="form-control"
																	type="date" name="fromdate" value="" />
															</div>
														</div>
														<div class="col-md-3">
															<div class="form-group">
																<label>to Date</label> <input class="form-control"
																	type="date" name="todate" value="" />
															</div>
														</div>

													</div>

													<div class="col-md-3">

														<button type="submit" style="margin-top: 25px;"
															class="btn btn-primary " title="" data-toggle="tooltip"
															data-original-title="Filter">Search</button>

													</div>

												</form>
											</div>
										</div>
										<div class="card-block">
											
												<c:if test="${not empty customerEntries}">
																<div style="float: right;">

												<a onclick="processCashReceived();" style="color: black"
													class="btn btn-sm btn-rounded btn-outline-primary md-trigger"
													data-cont="forms">Paid Through Cheque </a>
													</div>
													<div class="table-responsive">
														<table id="driverEntriesTable"
															class="display table nowrap table-hover"
															style="width: 100%">
															<thead>
																<tr>
																	<th><input type="checkbox" id="selectAll"></th>
																	<th>Date</th>						
																	<th>Shipment#</th>
																	<th>Account</th>
																	<th>Description</th>
																	<th>Amount</th>
																</tr>
															</thead>
															<tbody>
															<c:set var="total" value="0" scope="page" />
															
																<c:forEach varStatus="loop" var="driverEntry"
																	items="${customerEntries}">
																	<tr>
																		<td><input type="checkbox"
																			name="selectedEntries[]" class="selectedEntries"
																			value="${driverEntry.entryId}" class="selects"></td>
																		<td>${driverEntry.entryDate}</td>
																		<td>${driverEntry.posting.shipmentId}</td>
																		<td>${driverEntry.entryAccount.accountName}|
																			${driverEntry.entryAccount.accountDescription}</td>
																		<td>${driverEntry.entryDescription}</td>
																		<td>${driverEntry.entryAmount}</td>
																		<c:set var="total" value="${total + driverEntry.entryAmount}" scope="page"/>
																		
																	</tr>
																</c:forEach>
																<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td><b>Total :</b> </td>
																<td>${total}</td>
																</tr>
															</tbody>

														</table>
													</div>

												</c:if>
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
	<div id="cashToBankModel" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="background-color: #748892;">
						<h6 style="color: white">Delivery Closure Process</h6>
						<button type="button" style="color: white" class="close"
							data-dismiss="modal">&times;</button>

					</div>
					<div class="modal-body">
						<form action="${contextPath}/sendPaymentToClient" method="post"
												enctype="multipart/form-data">                  							
										 <div class="row">
										<input type="hidden" name="entryIds" id="entryIdsModel">
<!-- 										<input type="hidden" name="clientId" id="clientIdModel">
 -->										
													<!-- <div class="col-md-4">
														<div class="form-group">
															<label>Client</label> <input readonly="readonly"
																class="form-control"  type="text"
																name="client" id="clientname" value="" />
														</div> 
													</div>-->
														<div class="col-md-4">
														<div class="form-group">
															<label>Description</label> <input
																class="form-control"  type="text"
																name="description" value="" />
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>Cheque no.</label> <input
																class="form-control"  type="text"
																name="cheque" value="" />
														</div>
													</div>
													<div class="col-md-4">
																<div class="form-group">
																	<label for="chequeImage">Cheque Image</label> <input
																		name="chequeImage" type="file"  class="form-control" >
																</div>
													</div>
													
													<div class="col-md-4">
														<div class="form-group">
															<label>Cheque Amount</label> <input
																class="form-control"  type="number"
																name="chequeAmount" value="" />
														</div>
													</div>
													<!-- <div class="col-md-4">
																<div class="form-group">
																	<label for="driverimage">Deposit Slip</label> <input
																		name="depositSlip" type="file"  class="form-control" >
																</div>
													</div> -->
													<div class="col-md-3"  >
														<button type="submit" style="margin-top: 25px;" class="btn btn-primary " title=""
															data-toggle="tooltip" data-original-title="Filter">
															Submit</button>
															
													</div>
											</div>
									</form>
					</div>
				</div>
			</div>
		</div>	<!-- [ Main Content ] end -->

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

	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>

	<script>
		function processCashReceived() {
			var entryIds = "0";
			$('.selectedEntries').each(function() {
				if ($(this).prop("checked") != false) {
					entryIds += "," + $(this).val();
				}
			});
			if (entryIds == "0") {
				alert("Please select atleast one Entry");
			} else {

				/* if (confirm('Are you sure you want to add Reverse entries?')) {
			        window.open('/processCashReceived?entries='+entryIds,"_self");
			       
				} else {

				} */
				$("#entryIdsModel").val(entryIds);
				/* $("#clientname").val(entryIds);
				$("#clientIdModel").val(entryIds);
				 */
				
				$("#cashToBankModel").modal('toggle');
			}
		}

		var selectedd = false;

		$('#selectAll').click(function() {
			if (selectedd) {
				selectedd = false;
				$('.selectedEntries').each(function() {
					$(this).attr('checked', false);
					$(this).prop('checked', false);

				});
			} else {
				selectedd = true;
				$('.selectedEntries').each(function() {
					$(this).attr('checked', true);
					$(this).prop('checked', true);

				});
			}

		});

		$('#driverEntriesTable').DataTable({
			"paging" : false,
			"ordering" : false,
			"info" : false,
			searching : false,
			dom : 'Bfrtip',
			buttons : [ {
				text : '<i class="fa fa-file-pdf-o"></i> PDF',
				extend : 'pdfHtml5',
				orientation : 'landscape',
				pageSize : 'LEGAL'
			}, {
				text : '<i class="fa fa-print"></i> Print',
				extend : 'print'
			} ]
		});
	</script>
</body>

</html>