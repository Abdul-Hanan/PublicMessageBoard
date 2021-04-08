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
<title>${edit eq true? 'Edit':'Create'}Driver :: Raseel</title>

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

<!-- data tables css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/data-tables/css/datatables.min.css">
    <!-- select2 css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/select2/css/select2.min.css">
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
										<h5 class="m-b-10">Raseel Driver</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a
											href="${contextPath}/drivers">Drivers</a></li>
										<li class="breadcrumb-item"><a href="#!">${edit eq true? 'Edit':'Create'}
										</a></li>
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
											<h5>${edit eq true? 'Edit':'Create'} Driver</h5>
										</div>

										<div class="card-block">
											<form action="${contextPath}/driver" method="post"
												enctype="multipart/form-data">

												<div class="row">
													<div class="col-md-8">
														<input type="hidden" value="${driver.id}" name="id">
														<input type="hidden" value="${driver.user.id}"
															name="user.id">
														<div class="row">
															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactFirstName"> First Name*</label> <input
																		name="contactFirstName"
																		value="${driver.contactFirstName}" type="text"
																		required class="form-control" id="contactFirstName"
																		placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactMiddleName"> Middle Name*</label> <input
																		name="contactMiddleName"
																		value="${driver.contactMiddleName}" type="text"
																		required class="form-control" id="contactMiddleName"
																		placeholder="">
																</div>
															</div>

															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactLastName"> Last Name*</label> <input
																		name="contactLastName"
																		value="${driver.contactLastName}" type="text" required
																		class="form-control" id="contactLastName"
																		placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactEmail">Contact Email*</label> <input
																		name="contactEmail" value="${driver.contactEmail}"
																		type="text" required class="form-control"
																		id="contactEmail" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactPhone">Contact Phone*</label> <input
																		name="contactPhone" value="${driver.contactPhone}"
																		type="text" required class="form-control"
																		id="contactPhone" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="contactPhone2">Contact Phone 2</label> <input
																		name="contactPhone2" value="${driver.contactPhone2}"
																		type="text"  class="form-control"
																		id="contactPhone2" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="username">Login Name*</label> <input
																		name="user.username" value="${driver.user.username}"
																		type="text" required class="form-control"
																		id="username" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="password">Password*</label> <input
																		name="user.password" value="${driver.user.password}"
																		type="text" required class="form-control"
																		id="password" placeholder="">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-10">
																<div class="form-group">
																	<label for="device">Device*</label> <select
																		name="devices"
																		class="form-control js-example-basic-single" required
																		id="devices">
																		<option disabled>Select Device</option>
																		<c:forEach var="device" items="${devices}">
																			<option value="${device.id}"
																				${driver.devices.iterator().next().id eq device.id ?'selected':''}>${device.name}
																				&nbsp; ${device.imei} &nbsp; ${device.manufacturer}
																				&nbsp; ${device.androidVersion}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
															<div class="col-md-2">
																<div class="form-check">
																	<input class="form-check-input" value="true"
																		name="user.enabled"
																		${driver.user.enabled ? 'checked':''} type="checkbox"
																		id="gridCheck1"> <label
																		class="form-check-label" for="gridCheck1">Active</label>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<label for="driverimage">Driver Id Photo</label> <input
																		name="drivingIdPhotoo" type="file"  class="form-control" >
																</div>
															</div>
																<c:if test="${not empty driver.drivingIdPhoto}">
															<div class="col-md-12">
																<h6>Driver Id Photo</h6>
																	<img src="${contextPath}/getDriverIdPhoto?id=${driver.id}"
																		height="100px" width="100px">
															</div>
															
																</c:if>
															<div class="col-md-6">
															
																<div class="form-group">
																	<label for="drivingLicenseNumber">Driving License Number</label> <input
																		name="drivingLicenseNumber" value="${driver.drivingLicenseNumber}"
																		type="text"  class="form-control"
																		id="drivingLicenseNumber" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="drivingLicensePhoto">Driving License Photo</label> <input
																		name="drivingLicensePhotoo" type="file"  class="form-control" >
																</div>
															</div>
																<c:if test="${not empty driver.drivingLicensePhoto}">
															<div class="col-md-12">
																<h6>Driver License Photo</h6>
															
																	<img src="${contextPath}/getDriverDrivingLicensePhoto?id=${driver.id}"
																		height="100px" width="100px">
															</div>
															<br>
																															</c:if>
															
															<div class="col-md-6">
																<div class="form-group">
																	<label for="licenseExpiryDate">License Expiry Date</label> <input
																		name="licenseExpiryDate" value="${driver.licenseExpiryDate}"
																		type="date"  class="form-control"
																		id="licenseExpiryDate" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleType">Vehicle Type</label> <select
																		name="vehicleType"
																		class="form-control js-example-basic-single" 
																		id="vehicleType">
																		<option disabled>Select Vehicle Type</option>
																		<option value="Small Truck">Small Truck</option>
																		<option value="Van">Van</option>
																		<option value="Private Car">Private Car</option>
																		<option value="Motorcycle">Motorcycle</option>
																		<option value="Scooter">Scooter</option>
																		<option value="Bicycle">Bicycle</option>
																		<option value="Walking">Walking</option>
																	</select>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleDescription">Vehicle Description</label> <input
																		name="vehicleDescription" value="${driver.vehicleDescription}"
																		type="text"  class="form-control"
																		id="vehicleDescription" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleLicensePlateNumber">Vehicle License Plate no.</label> <input
																		name="vehicleLicensePlateNumber" value="${driver.vehicleLicensePlateNumber}"
																		type="text"  class="form-control"
																		id="vehicleLicensePlateNumber" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleModel">Vehicle Model</label> <input
																		name="vehicleModel" value="${driver.vehicleModel}"
																		type="text"  class="form-control"
																		id="vehicleModel" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleYear">Vehicle Year</label> <input
																		name="vehicleYear" value="${driver.vehicleYear}"
																		type="text"  class="form-control"
																		id="vehicleYear" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="vehicleColor">Vehicle Color</label> <input
																		name="vehicleColor" value="${driver.vehicleColor}"
																		type="text"  class="form-control"
																		id="vehicleColor" placeholder="">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label for="registrationPhoto">Registration Photo</label> <input
																		name="registrationPhotoo" type="file"  class="form-control" >
																</div>
															</div>
															<c:if test="${not empty driver.registrationPhoto}">
															<div class="col-md-12">
																	<h6>Driver Registration Photo</h6>	
																	<img src="${contextPath}/getDriverRegistrationPhoto?id=${driver.id}"
																		height="100px" width="100px">															
															</div>
															<br>
															</c:if>
															<div class="col-md-12">
                                                          <div class="form-group">
                                                            <label for="drivers">BackUp Driver</label>
                                                            <select name="drivers" class="form-control js-example-basic-single"  id="drivers" multiple="multiple">
                                                                <option disabled>Select driver</option>
                                                                <c:forEach var="driver" items="${drivers}">
                                                                    <option value="${driver.id}" 
                                                                    <c:forEach var="backupDriver" items="${driver.drivers}">
																        ${driver.id == backupDriver.id ? 'selected="selected"' : ''}
																    </c:forEach>
                                                                    >${driver.contactFirstName} ${driver.contactLastName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<label for="residenceAddress">Residence Address</label> <input
																		name="residenceAddress" value="${driver.residenceAddress}"
																		type="text"  class="form-control"
																		id="residenceAddress" placeholder="">
																</div>
															</div>
															<div class="col-md-12">
                                                          <div class="form-group">
                                                            <label for="residenceArea">Residence Area</label>
                                                            <select name="residenceArea" class="form-control js-example-basic-single"  id="residenceArea" >
                                                                <option disabled>Select Residence Area</option>
                                                                <c:forEach var="area" items="${areas}">
                                                                    <option value="${area.id}" >${area.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
															</div>
															
															<div class="col-md-12">
                                                          <div class="form-group">
                                                            <label for="pickupAreas">Pickup Areas</label>
                                                            <select name="pickupAreas" class="form-control js-example-basic-single"  id="pickupAreas" multiple="multiple">
                                                                <option disabled>Select Areas</option>
                                                                <c:forEach var="area" items="${areas}">
                                                                    <option value="${area.id}" 
                                                                    <c:forEach var="selectedArea" items="${driver.pickupAreas}">
																        ${area.id == selectedArea.id ? 'selected="selected"' : ''}
																    </c:forEach>
                                                                    >${area.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
															</div>
															<div class="col-md-12">
                                                          <div class="form-group">
                                                            <label for="deliveryAreas">Delivery Areas</label>
                                                            <select name="deliveryAreas" class="form-control js-example-basic-single"  id="deliveryAreas" multiple="multiple">
                                                                <option disabled>Select Areas</option>
                                                                <c:forEach var="area" items="${areas}">
                                                                    <option value="${area.id}" 
                                                                    <c:forEach var="selectedArea" items="${driver.deliveryAreas}">
																        ${area.id == selectedArea.id ? 'selected="selected"' : ''}
																    </c:forEach>
                                                                    >${area.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
															</div>
															<div class="col-md-12">
																<button type="submit" class="btn btn-primary" title=""
																	data-toggle="tooltip" data-original-title="Submit">Submit</button>
															</div>
														</div>

													</div>
													<div class="col-md-4">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label for="driverimage">Driver Image</label> <input
																		name="file" type="file" class="" >
																</div>
															</div>
															<div class="col-md-12">
																<c:if test="${not empty driver.imgPath}">
																	<img src="${contextPath}/getDriverImage?id=${driver.id}"
																		height="200px" width="200px">
																</c:if>

															</div>
														</div>
													</div>

												</div>
											</form>
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

</body>

</html>
