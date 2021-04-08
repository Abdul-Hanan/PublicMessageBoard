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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
<title>${edit eq true? 'Edit':'Create'} Shipment::Raseel</title>

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
<!-- select2 css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/select2/css/select2.min.css">

<!-- data tables css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/data-tables/css/datatables.min.css">
<style>
#map-plot {
	height: 100%;
}

#map-plot1 {
	height: 100%;
}
</style>

<style>
/* The container */
.container {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 15px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>
<style>
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #888;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
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
										<h5 class="m-b-10">
										<c:if test="${not empty customer.customerName }">
											<img class="media-object " height="40px" width="40px"
												src="${contextPath}${customer.imgPath}">
											${customer.customerName}
											</c:if>
										</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a
											href="${contextPath}/shipments">Shipments</a></li>
										<li class="breadcrumb-item active">${edit eq true? 'Edit':'New'}</li>
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
								<form action="${contextPath}/editShipment" method="post">
																<input type="hidden" name="id" value="${shipment.id}">
								
									<div class="col-md-12">
										<div class="card">
											<div class="card-header">
												<h5>${edit eq true? 'Edit':'New'} Shipment</h5>
												<div class="card-header-right">
													<button type="submit" class="btn btn-primary " title=""
														data-toggle="tooltip" data-original-title="Submit">
														Submit</button>
												</div>

											</div>
											<div class="card-block">
												<div class="col-md-12">
													<div class="form-group d-inline">

														<label class="container">Parcel Delivery <input
															type="radio" name="shipmentType" checked="${shipment.shipmentType.id eq 5634 ? 'checked':''}" 
															id="shipmentTypeParcel" value="5634"> <span
															class="checkmark"></span>
														</label> <label class="container">Cash Delivery <input 
															type="radio" name="shipmentType" id="shipmentTypeCash"
															value="5633"> <span class="checkmark"></span>
														</label>
														 <label class="container">Cash Collection/Deposit<input
															type="radio" name="shipmentType" id="shipmentTypeCollection"
															value="5635"> <span class="checkmark"></span>
														</label>

													</div>
													<br>
													<div class="row">
														<div class="col-md-12">
															<h6>Pickup From</h6>
															<hr>
															<input type="hidden" name="customerUserId"  value="${customerUser.id}">
															<div class="row"
																style="padding: 10px; border: solid 1px;">
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Company Name*</label> <input
																			class="form-control" required type="text"
																			name="companyName" disabled="disabled"
																			value="${shipment.customerUser.customer.customerName}" />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Dispatch Full Name*</label> <input
																			class="form-control" required type="text"
																			name="senderName"
																			value="${customerUser.contactFirstName} ${customerUser.contactLastName}"
																			disabled="disabled" />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Dispatch Contact Number</label> <input
																			class="form-control" required type="text"
																			name="senderContactNo"
																			value="${customerUser.contactPhone}"
																			disabled="disabled" />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Dispatch Email</label> <input
																			class="form-control" required type="text"
																			name="senderEmail"
																			value="${customerUser.contactEmail}"
																			disabled="disabled" />
																	</div>
																</div>

																<div class="col-md-3">
																	<div class="form-group d-inline">
																		<div class="radio radio-info radio-fill d-inline">
																			<input type="radio" value="true"
																				name="isOfficeAddressStr" id="radio-i-infill-1"
																				checked="${not empty shipment.customerOffice ? 'checked':''}"> <label for="radio-i-infill-1"
																				class="cr">Pre-defined Address</label>
																		</div>
																	</div>
																	<div class="form-group d-inline">
																		<div class="radio radio-info radio-fill d-inline">
																			<input type="radio" value="false" class="otherAddress" 	"																
																			name="isOfficeAddressStr" id="radio-i-infill-2" >
																			<label for="radio-i-infill-2" class="cr">Other
																				Pick up Address</label>
																		</div>
																	</div>
																</div>
															
																<div class="col-md-6" id="officeAddressDiv">
																	<div class="form-group">
																		<label>Office Address *</label> <select
																			class="form-control" name="customerOffice"
																			id="customerOffice">
																			<option disabled selected>Select Office</option>
																			<c:forEach var="customerOffices"
																				items="${shipment.customerUser.customer.customerOffices}">
																				<option value="${customerOffices.id}"
																					data-foo="${customerOffices.zone.id}" ${shipment.customerOffice.id eq customerOffices.id ?'selected':''}>${customerOffices.geoFence.name}
																					| Area : ${customerOffices.zone.name}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
															
																<div class="customAddress col-md-3"
																	style="display: none;">
																	<div class="form-group">
																		<label>Select City</label> <select
																			class="form-control js-example-basic-single"
																			name="senderCity">
																		<option selected disabled>Select City</option>
																		<c:forEach items="${cities}" var="city">
																			<option value="${city.id}" ${shipment.senderCity.id eq city.id ?'selected':''}>${city.name} | ${city.arabicName}</option>
																		</c:forEach>
																		</select>
																	</div>
																	<div class="form-group">
																		<label>Select Area</label> <select
																			class="form-control js-example-basic-single"
																			id="senderZone" name="senderZone">
																			<option selected disabled>Select Area</option>
																		<c:forEach items="${geoFence}" var="geoFence">
																			<option value="${geoFence.id}" ${shipment.senderZone.id eq geoFence.id ?'selected':''} >${geoFence.name}, Zone: ${geoFence.zoneName} | ${geoFence.arabicName}</option>
																		</c:forEach>
																		</select>
																	</div>
																		
																</div>
																
																<div class="customAddress col-md-6"
																	style="display: none;">
																	<div style="height: 150px;"
																		class="set-map map-canvas rounded-corners">
																		<div id="map-plot1"></div>
																	</div>
																</div>
																<div class="customAddress col-md-12"
																	style="display: none;">
																	<div class="form-group">
																		<label>Full Address</label> <input
																			class="form-control" type="text" name="senderAddress" value="${shipment.senderAddress}"/>
																	</div>
																</div>
																<div class="customAddress col-md-12"
																	style="display: none;">
																	<div class="form-group">
																		<label>Full Arabic Address</label> <input
																			class="form-control" type="text" name="senderArabicAddress" value="${shipment.senderArabicAddress}"/>
																	</div>
																</div>
															</div>
														</div>
<div class="col-md-12">
															<br>
															<h6>Reciever</h6>
															<hr>

															<div class="row" style="padding: 10px; border: solid 1px">
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Full Name*</label> <input class="form-control"
																			required  id="receiverFullName" type="text" name="receiverName" value="${shipment.receiverName}" />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Email*</label> <input class="form-control"
																			required type="text" id="receiverEmail" name="receiverEmail" value="${shipment.receiverEmail}"  />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Contact Number*</label> <input id="receiverContactNo"
																			class="form-control" required type="text"
																			list="receiverslist"
																			name="receiverContactNo" value="${shipment.receiverContactNo}" />
																		<datalist id="receiverslist">
																			<c:forEach items="${receiversList}" var="receiverr">
																			   	 <option value="${receiverr.contactNumber}">
																			</c:forEach>
																		</datalist>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Secondary Contact Number</label> <input
																			class="form-control" type="text"
																			id="receiverSecondNumber"
																			name="receiverContactNo2" value="${shipment.receiverContactNo2}" />
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Select City</label> <select
																			class="form-control js-example-basic-single"
																			id="city" name="receiverCity">
																			<option selected disabled>Select City</option>
																			<c:forEach items="${cities}" var="city">
																				<option value="${city.id}"  ${shipment.receiverCity.id eq city.id ?'selected':''}>${city.name} | ${city.arabicName}</option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="form-group">
																		<label>Select Area</label> <select
																			class="form-control js-example-basic-single"
																			id="recieverzone" name="receiverZone">
																			<option selected disabled>Select Area</option>
																			<c:forEach items="${geoFence}" var="geoFence">
																				<option value="${geoFence.id}"  ${shipment.receiverZone.id eq geoFence.id ?'selected':''}>${geoFence.name}, Zone: ${geoFence.zoneName} | ${geoFence.arabicName}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="col-md-6">
																	<div style="height: 150px;"
																		class="set-map map-canvas rounded-corners">
																		<div id="map-plot"></div>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>Full Address</label> <input value="${shipment.receiverAddress}"
																			class="form-control" required type="text"
																			name="receiverAddress"  id="recieverAddress" />
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label>Full Arabic Address</label> <input
																			class="form-control" required type="text" value="${shipment.receiverArabicAddress}"
																			name="receiverArabicAddress" id="recieverArabicAddress" />
																	</div>
																</div>
															</div>
														<div class="col-md-12">
															<br>
															<h6>Shipment Details</h6>
															<hr>
															<div class="row"
																style="padding: 10px; border: solid 1px;">
<%-- 
																<div class="col-md-3" id="officeAddressDiv">

																	<div class="form-group">
																		<label>Payment Type*</label> <select
																			class="form-control" name="paymentType">
																				<option selected disabled>Select Payment Type</option>
																		<c:forEach items="${paymentTypes}" var="paymentType">
																			<option value="${paymentType.id}" ${shipment.paymentType.id eq paymentType.id ?'selected':''}>${paymentType.name}</option>
																		</c:forEach>
																		</select>
																	</div>
																</div> --%>
																
																 
																<div class="col-md-3" id="officeAddressDiv">
																	<div class="form-group">																	
																		<label> Order/SKU number</label> <input
																			class="form-control"  type="text"
																			name="orderSkuNumber" value="${shipment.orderSkuNumber}"/>
																	</div>
																</div>
															
																<div class="col-md-3">
																	<div class="form-group">
																		<label> Pickup Date*</label>
																		<input
																			class="form-control date" required type="date"
																			name="shipmentDate" id="pickupdate" value="${shipmentDate}" />
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Delivery Date*</label> <input
																			class="form-control date" required type="date"
																			name="deliveryDate" id="deliverydate" value="${deliveryDate}"  />
																	</div>
																</div>
														
																

																<%-- <div class="col-md-3" id="deliveryTypeDiv">
																	<div class="form-group">
																		<label id="deliveryTypeLabel">Service Type*</label> <select
																			class="form-control js-example-basic-single"
																			id="deliveryType" name="serviceType">
																			<option selected disabled>Select Service
																				Type</option>
																			<c:forEach items="${serviceTypes}" var="serviceType">
																				<option value="${serviceType.id}"  ${shipment.serviceType.id eq serviceType.id ?'selected':''}>${serviceType.name}</option>
																			</c:forEach>
																		
																		</select>
																	</div>
																</div>
 --%>

																<div class="col-md-3">
																	<div class="form-group">
																		<label>Piece(s)*</label> <input class="form-control"
																			required type="number" name="pieces"  value="${shipment.pieces}"/>
																	</div>
																</div>
																
																<%-- <div class="col-md-3">
																	<div class="form-group">
																		<label>Weight*</label> <input class="form-control"
																			required type="number" name="weight"  value="${shipment.weight}"/>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Length</label> <input class="form-control"
																			type="number" name="length" value="${shipment.length}"/>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Width</label> <input class="form-control"
																			type="number" name="width"  value="${shipment.width}"/>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Height</label> <input class="form-control"
																			type="number" name="height" value="${shipment.height}"/>
																	</div>
																</div> --%>

																<div class="col-md-6">
																	<div class="form-group">
																		<label>Description</label>
																		<textarea rows="2" class="form-control"
																			name="description" >${shipment.description}</textarea>
																	</div>
																</div>
																<%-- <div class="col-md-6">
																	<div class="form-group">
																		<label>General Note</label>
																		<textarea rows="2" class="form-control"
																			name="generalNote">${shipment.generalNote}</textarea>
																	</div>
																</div> --%>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Driver Note</label>
																		<textarea rows="2" class="form-control"
																			name="driverNote">${shipment.driverNote}</textarea>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Arabic Driver Note</label>
																		<textarea rows="2" class="form-control"
																			name="driverArabicNote">${shipment.driverArabicNote}</textarea>
																	</div>
																</div>
																<div class="col-md-6" id="officeAddressDiv">
																	<div class="form-group">																	
																		<label> Cash Collection Amount*</label> <input
																			class="form-control" required type="number"
																			name="codAmount" value="${shipment.codAmount}"/>
																	</div>
																</div>
																

															</div>
														</div>
														
											<%-- 				<div class="col-md-12">
																<br>
																<h6>Service Charge</h6>
																<hr>

																<div class="row"
																	style="padding: 10px; border: solid 1px; background-color: #F5F5F5;">
																	<div class="col-md-12" id="officeAddressDiv"
																		style="margin-top: 14px;">

																		<div class="form-group">
																			<label>Service Charges Scheme*</label> <select
																				class="form-control" name="chargeScheme" required>
																				<option selected disabled>Select Charges
																					Scheme</option>
																				<option ${shipment.chargeScheme == "Prepaid" ?'selected':''}>Prepaid</option>
																				<option ${shipment.chargeScheme == "Postpaid" ?'selected':''}>Postpaid</option>
																				<option ${shipment.chargeScheme == "Invoice" ?'selected':''}>Invoice</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Service Charges</label> <input class="form-control"
																		required readonly="readonly" type="number" id="serviceChargeAmount" name="serviceChargeAmount" value="${shipment.serviceChargeAmount}"/>
																		</div>
																		
																		<input type="hidden" name="serviceCharge" id="serviceCharge"  value="${shipment.serviceCharge.id}">
																			
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<a href="serviceCharges" target="_blank">View
																				Service Charges list</a>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<a class="btn btn-warning"
																				onclick="calculateServiceCharges();"
																				style="color: white">Calculate</a>
																		</div>
																	</div>
																</div>
															</div> --%>
														</div>
													</div>
												</div>
											</div>
										</div>
								</form>

								<!-- [ sample-page ] end -->
							</div>
							<!-- [ Main Content ] end -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<!-- [ Main Content ] end -->

	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 11]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade
        <br/>to any of the following web browsers to access this website.
    </p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="${contextPath}/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="${contextPath}/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="${contextPath}/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="${contextPath}/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="${contextPath}/assets/images/browser/ie.png" alt="">
                    <div>IE (11 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
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

	$(function(){
		  var now = new Date();

		    var day = ("0" + now.getDate()).slice(-2);
		    var month = ("0" + (now.getMonth() + 1)).slice(-2);

		    var today = now.getFullYear() + "-" + (month) + "-" + (day);

		    $('#pickupdate').val(today);
		    $('#pickupdate').attr('min', today); 
		    
		    $('#deliverydate').val(today);
		    $('#deliverydate').attr('min', today); 
		    	
	});
	
	$('#receiverContactNo').on('change ', function() {
		$.ajax({
			url : '${contextPath}/api/common/getReceiverFromContactNo',
			data : JSON.stringify({
				receiverContact : $('#receiverContactNo').val()+"",
				customerId : "testing"
			}),
			type : 'POST',
			cache : false,
			contentType : 'application/json; charset=utf-8',
			dataType : "json",
			success : function(result) {
				console.log(result);
				if(result.id!=null){
					$("#receiverEmail").val(result.email);
					$("#receiverFullName").val(result.fullName);
					//$("#receiverContactNo").val(result.id);
					$("#receiverSecondNumber").val(result.secondaryContactNumber);
					
					//$("#city").val(result.cityId);
					//$("#recieverzone").val(result.areaId);

						$("#city option[value='" + result.cityId + "']").prop("selected", true);
					    $("#recieverzone option[value='" + result.areaId + "']").prop("selected", true);
					
						$("#city").select2();
						$("#recieverzone").select2();

					$("#recieverAddress").val(result.fullAddress);
					$("#recieverArabicAddress").val(result.fullArabicAddress);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				console.log("error");
			}
		});
	});

		var isOfficeSelected = true;
		
		function getServiceCharges(customerId,senderZone,receiverZone,serviceType){
		/* alert(JSON.stringify({
			customerId : customerId,
			fromZone : senderZone,
			toZone : receiverZone,
			shipmentTypeId : $("input[name=shipmentType]:checked").val(),
			serviceTypeId : serviceType
		})); */
			$.ajax({
				url : '${contextPath}/api/common/getCustomerServiceCharges',
				data : JSON.stringify({
					customerId : customerId,
					fromZone : senderZone,
					toZone : receiverZone,
					shipmentTypeId : $("input[name=shipmentType]:checked").val(),
					serviceTypeId : serviceType
				}),
				type : 'POST',
				cache : false,
				contentType : 'application/json; charset=utf-8',
				dataType : "json",
				success : function(result) {
					var id = result.id;
					console.log(result.serviceAmount);
					$("#serviceCharge").val(result.id);
					$("#serviceChargeAmount").val(result.serviceAmount);
					
				},
				error : function(xhr, ajaxOptions, thrownError) {
					$("#serviceChargeAmount").val("");
					alert("Unable to Get Service Charges");
				}
			});
		}
		
		function calculateServiceCharges(){
			if($("#deliveryType").val()!=null){
				
				 $("#deliveryTypeLabel").css("color","#888");
					
				if(!isOfficeSelected){
					if($("#recieverzone").val()!=null && $("#senderZone").val()!=null){
						getServiceCharges(${shipment.customerUser.customer.id},$("#senderZone").val(),$("#recieverzone").val(),$("#deliveryType").val());
					}else{
						alert("Please select Areas.");
					}
				}else{
					if($("#recieverzone").val()!=null && $("#customerOffice").val()!=null){
						 var selected = $("#customerOffice").find('option:selected').data('foo'); 
						 getServiceCharges(${shipment.customerUser.customer.id},selected,$("#recieverzone").val(),$("#deliveryType").val());
						
					}else{
						alert("Please select Address and receiver Areas.");
					}
					
				}
			}else{
			
				var div = $("#deliveryTypeDiv");
				div.animate({ opacity: '0.5',color: 'red'}, "slow");
			    div.animate({ opacity: '1.0',color: 'black'}, "slow"); 		  
				 $("#deliveryTypeLabel").css("color","red");
					
			}
		}

	

		$('#recieverzone').on('select2:select', function(e) {
			var data = e.params.data;

			$.ajax({
				url : '${contextPath}/api/common/getGeoFence',
				data : JSON.stringify({
					id : data.id
				}),
				type : 'POST',
				cache : false,
				contentType : 'application/json; charset=utf-8',
				dataType : "json",
				success : function(result) {
					debugger;
					var latitude = result.latitude;
					var longitude = result.longitude;
					mapR.panTo(new google.maps.LatLng(latitude, longitude));
					mapR.setZoom(13);
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(thrownError);
				}
			});
			console.log(data.id);
		});
		$('#senderZone').on('select2:select', function(e) {
			var data = e.params.data;

			$.ajax({
				url : '${contextPath}/api/common/getGeoFence',
				data : JSON.stringify({
					id : data.id
				}),
				type : 'POST',
				cache : false,
				contentType : 'application/json; charset=utf-8',
				dataType : "json",
				success : function(result) {
					debugger;
					var latitude = result.latitude;
					var longitude = result.longitude;
					mapS.panTo(new google.maps.LatLng(latitude, longitude));
					mapS.setZoom(14);
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(thrownError);
				}
			});
			console.log(data.id);
		});

		$('input:radio[name="isOfficeAddressStr"]').change(function() {
			if (this.checked && this.value == 'true') {
				$('#officeAddressDiv').show(1000);
				$('.customAddress').hide(1000);
				isOfficeSelected=true;
			} else {
				$('#officeAddressDiv').hide(1000);
				$('.customAddress').show(1000);
				isOfficeSelected=false;
			}
		});
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_ViFpUp7DSL7VUJCuO181fh5iqL1EXJI&libraries=places&callback=initMap"
		sync defer></script>
	<script>
	var markerS, markerR = null;
	var mapR = null;
	var mapS = null;
	var senderMap = document.getElementById('map-plot1');
	var recieverMap = document.getElementById('map-plot');

   	var infoWindow;

		
	function initMap() {
		mapS = new google.maps.Map(senderMap, {
			center : {
				lat : 33.682,
				lng : 73.052
			},
			disableDefaultUI : true,
			zoom : 11
		});

        infoWindow = new google.maps.InfoWindow;
		
		mapR = new google.maps.Map(recieverMap, {
			center : {
				lat : 33.682,
				lng : 73.052
			},
			disableDefaultUI : true,
			zoom : 11
		});

		mapS.addListener('click', function(e) {
			placeSenderMarker(e.latLng, mapS);
		});
		mapR.addListener('click', function(e) {
			placeRecieverMarker(e.latLng, mapR);
		});
		function placeSenderMarker(location, map) {
			// Clear out the old markers.
			if (markerS == null) {
				markerS = new google.maps.Marker({
					position : location,
					map : map
				});
			} else {
				markerS.setMap(null);
				markerS.setPosition(location);
				markerS = new google.maps.Marker({
					position : location,
					map : map
				});
			}

		}
		function placeRecieverMarker(location, map) {
			// Clear out the old markers.
			if (markerR == null) {
				markerR = new google.maps.Marker({
					position : location,
					map : map
				});
			} else {
				markerR.setMap(null);
				markerR.setPosition(location);
				markerR = new google.maps.Marker({
					position : location,
					map : map
				});
			}

		}

		 // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(mapS);
            mapS.setCenter(pos);

/* 	            mapR.setCenter(pos);
*/	            
          }, function() {
            handleLocationError(true, infoWindow, mapS.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, mapS.getCenter());
        }

	}

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(mapS);
      }
	</script>
	
  	<c:if test="${empty shipment.customerOffice}">
		<script>
			$(".otherAddress").prop( "checked", true );
			$('.otherAddress').trigger('change');
		</script>
	</c:if> 

<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
</body>

</html>
