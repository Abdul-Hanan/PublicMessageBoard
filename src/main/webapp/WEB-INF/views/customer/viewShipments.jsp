<%--
  Created by Winning Solutions.
  User: Shoaib ul din PC
  Date: 11/06/2019
  Time: 5:16 PM
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
<title>Shipments :: Raseel</title>

<!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicon icon -->
    <link rel="icon" href="${contextPath}/assets/images/logo-half.png" type="image/x-icon">
    <!-- fontawesome icon -->
    <link rel="stylesheet" href="${contextPath}/assets/fonts/fontawesome/css/fontawesome-all.min.css">
    <!-- animation css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/animation/css/animate.min.css">
    <!-- vendor css -->
    <link rel="stylesheet" href="${contextPath}/assets/css/style.css">
    <!-- select2 css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- data tables css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/data-tables/css/datatables.min.css">
   
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
										<h5 class="m-b-10">
											<img class="media-object " height="40px" width="40px"
												src="${contextPath}/getCustomerImage?id=${customer.id}">
											${customer.customerName}
										</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a href="#!">Shipments</a></li>
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
											<h5>Manage Shipments</h5>
											<div class="card-header-right">
												<sec:authorize access="hasAuthority('create-shipment')">
													<button type="button" onclick="location = 'createShipment'"
														class="btn btn-primary btn-icon" title=""
														data-toggle="tooltip"
														data-original-title="Create a New Shipment">
														<i class="feather icon-plus"></i>
													</button>
												</sec:authorize>

											</div>
											
										</div>
										<div class="card-header" style="background: #f4f7fa; color: black">
					<form action="${contextPath}/shipments" method="GET">
										
										 <div class="row">
                                  					<input type="hidden" name="filter" value="1">
                                          

													<div class="col-md-4">
														<div class="form-group">
															<label>Select City</label> 
															<select
																		class="form-control js-example-basic-single"
																		name="city">
																		<option selected value="">Select City</option>
																		<c:forEach items="${cities}" var="city">
																			<option value="${city.id}">${city.name}</option>
																		</c:forEach>
																	</select>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>Select Shipment Status</label> 
															<select class="form-control js-example-basic-single"
																		name="status" multiple="multiple" >
																<c:forEach items="${statusList}" var="statuss">
																	<option value="${statuss.id}" >${statuss.name}</option>
																</c:forEach>
																	</select>
														</div>
														
														
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>From Date</label> <input
																class="form-control"  type="date"
																name="fromdate" value="" />
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>To Date</label> <input
																class="form-control"  type="date"
																name="todate" value="" />
														</div>
													</div>
													<div class="col-md-4"  >
													
														<button type="submit" style="margin-top: 25px;" class="btn btn-primary " title=""
															data-toggle="tooltip" data-original-title="Filter">
															Filter</button>
															
													</div>
											
                                            </div>
                                      
                                        </form>
										</div>
										<div class="card-block">
										<div style="float: right;">
										
										  <a onclick="printQR();" style="color: black"	class="btn btn-sm btn-rounded btn-outline-primary md-trigger"
																	data-cont="forms">Print QR </a>
										</div>
                                      
											<div class="table-responsive">
												<table id="shipmentTable"
													class="display table nowrap table-hover"
													style="width: 100%">
													<thead>
													
														<tr>
															<th><input type="checkbox" id="selectAll"></th>
															<!-- <th>#</th> -->
															<th>Tracking #</th>
															<!-- <th>QR Code</th> -->
															<th>Service</th>
															<th>Created</th>
															<th>By</th>
															<th>Pickup</th>
															<th>Delivery</th>
															<th>Postponed till</th>
															<th>From</th>
															<th>From Address</th>
															<th>From Area</th>
															<th>To</th>
															<th>To Address</th>
															<th>To Area</th>
															<th>Notes</th>
															<th>Amount (COD)</th>
															<th>Order Status</th>
															<th></th>
														
														</tr>
													</thead>
													<tbody>
														<c:forEach varStatus="loop" var="shipments"
															items="${shipments}">
															<tr>
													<td><input type="checkbox" name="selectedShipments[]" class="selectedShipemnts" value="${shipments.id}" class="selects"></td>																							
																<%-- <td>${loop.index + 1}</td> --%>
																 <td>#${shipments.id}</td> 
																<td>${shipments.shipmentType.name}</td>
																<td>${shipments.creationDate}</td>
																<td>${shipments.customerUser.customer.customerName}</td>
																<td>
																${shipments.shipmentDate}											 			
																</td>
																<td>
																${shipments.shipmentDate}												 			
																</td>
																<td></td>
															<td>${shipments.senderName}</td>
															<td>${shipments.senderAddress}</td>
															<td>${shipments.senderZone.name}</td>														
															<td>${shipments.receiverName}</td>
															<td>${shipments.receiverAddress}</td>
															<td>${shipments.receiverZone.name}</td>
															<td><a class="btn btn-sm btn-rounded btn-outline-primary md-trigger" data-toggle="modal" data-target="#notesModel"
														data-original-title="view Notes" onclick="showNotes('${shipments.id}','${shipments.generalNote}','${shipments.description}','${shipments.driverNote}');">View Notes</a></td>
															
															<td><a class="btn btn-sm btn-rounded btn-outline-primary md-trigger" data-toggle="modal" data-target="#showAmountModel"
														data-original-title="view Amounts" onclick="showAmountModel('${shipments.id}','${shipments.codAmount}','${shipments.collectedAmount}');">${shipments.codAmount}</a></td>
															<td><b style="color: blue">${shipments.status.name}</b></td>
															
															<td><sec:authorize
																		access="hasAuthority('edit-shipment')">
																		<a
																			href="${contextPath}/editShipment?id=${shipments.id}"
																			class="text-left" data-cont="forms"><i
																			class="feather feather icon-edit"></i></a>
																	</sec:authorize></td>																
															</tr>
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
	
	<div id="notesModel" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #748892;">
					<h6 style="color: white">Notes</h6>
					<button type="button" style="color: white" class="close"
						data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
				<div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>Description</label>
																		<textarea rows="2" class="form-control"
																			name="description" id="descriptionModel" disabled="disabled"></textarea>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>General Note</label>
																		<textarea rows="2" class="form-control"
																			name="generalNote" id="generalNoteModel" disabled="disabled"></textarea>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>Driver Note</label>
																		<textarea rows="2" class="form-control"
																			name="driverNote" id="driverNoteModel"  disabled="disabled"></textarea>
																	</div>
																</div>

															</div>
				</div>
			</div>
		</div>
	</div>


	
	<div id="showAmountModel" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #748892;">
					<h6 style="color: white">Amounts</h6>
					<button type="button" style="color: white" class="close"
						data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
				<div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>COD Amount</label>
																		<input type="text" class="form-control"
																			name="codAmountModel" id="codAmountModel" readonly="readonly">
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>Collected Amount</label>
																			<input type="text" class="form-control"
																			name="collectedAmountModel" id="collectedAmountModel" readonly="readonly">
																	</div>
																</div>

															</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Warning Section Ends -->

<!-- Required Js -->
<script src="${contextPath}/assets/js/vendor-all.min.js"></script>
<script src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/assets/js/pcoded.min.js"></script>

<!-- datatable Js -->
<script src="${contextPath}/assets/plugins/data-tables/js/datatables.min.js"></script>
<script src="${contextPath}/assets/js/pages/tbl-datatable-custom.js"></script>
<script src="${contextPath}/assets/plugins/sweetalert/js/sweetalert.min.js"></script>
<!-- select2 Js -->
<script src="../assets/plugins/select2/js/select2.full.min.js"></script>
<!-- form-select-custom Js -->
<script src="../assets/js/pages/form-select-custom.js"></script>

	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>
<script>

function showAmountModel( shipmentId, codAmount, collectedAmount){
	$("#codAmountModel").val(codAmount);
	$("#collectedAmountModel").val(collectedAmount);
}

function showNotes( shipmentId, generalNote, description, driverNote){
$("#descriptionModel").text(description);
$("#generalNoteModel").text(generalNote);
$("#driverNoteModel").text(driverNote);
}

function printQR(){
	var shipmentNos="0";
    $('.selectedShipemnts').each(function() {
        if($(this).prop("checked") != false){
        	shipmentNos += ","+$(this).val();
         }
    });
    if(shipmentNos=="0"){
        alert("Please select atleast one shipment");
    }else{
        //alert(shipmentNos);
        window.open('/printShipmentQRs?shipments='+shipmentNos, 'printQR');
    }
}


var selectedd= false;

$('#selectAll').click(function() {
	if(selectedd){
		selectedd=false;
		 $('.selectedShipemnts').each(function() {
		        $(this).attr('checked',false);
		        $(this).prop('checked', false);
		        
		    });
		}else{
			selectedd = true;
			 $('.selectedShipemnts').each(function() {
			        $(this).attr('checked',true);
			        $(this).prop('checked', true);
			        
			    });
		}
   
}); 




$('#shipmentTable').DataTable({
	"paging":   false,
    "ordering": false,
    "info":     false,
    searching: false,
    dom : 'Bfrtip',
	buttons : [ {
		text : '<i class="fa fa-file-pdf-o"></i> PDF',
		extend : 'pdfHtml5',
		orientation: 'landscape',
        pageSize: 'LEGAL',
        exportOptions: {
        	columns:[1,2,3,4,5,6,7,8,9,10,11,12]
    	}
	}, {
		text : '<i class="fa fa-print"></i> Print',
		extend : 'print'
	} ]
});




</script>
</body>

</html>
