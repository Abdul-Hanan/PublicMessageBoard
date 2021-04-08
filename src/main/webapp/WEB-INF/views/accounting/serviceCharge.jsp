<%--
  Created by Winning Solutions.
  Office: Shoaib ul din PC
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
<title>${edit eq true? 'Edit':'Create'} Service Charges :: Raseel</title>

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

<!-- select2 css -->
<link rel="stylesheet"
	href="${contextPath}/assets/plugins/select2/css/select2.min.css">

<style>
#map-plot {
	height: 100%;
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
										<h5 class="m-b-10">Raseel Service Charges</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a
											href="${contextPath}/serviceCharges">Service Charges</a></li>
										<li class="breadcrumb-item"><a href="#!">${edit eq true? 'Edit':'Create'}
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- [ breadcrumb ] end -->
					<!-- [ breadcrumb ] end -->
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ sample-page ] start -->
								<div class="col-sm-12">
									<div class="card">
										<div class="card-header">
											<h5>${edit eq true? 'Edit':'Create'} Service Charges</h5>
										</div>
										<div class="card-block row">
											<div class="col-md-12">
												<form action="${contextPath}/serviceCharge" method="post"
													id="submitForm">
													<input type="hidden" name="id" value="${serviceCharge.id}">
													<div class="row">
														<div class="col-md-4">
															<div class="form-group">
																<label for="accountType">Client*</label> <select
																	class="form-control js-example-basic-single"
																	id="customer" name="customer" required="required">
																	<option selected disabled>Select Client</option>
																	<c:forEach items="${customers}" var="customer">
																		<option value="${customer.id}"
																			${serviceCharge.customer eq customer ?'selected':''}>${customer.customerName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label>Select From Area</label> <select
																	class="form-control js-example-basic-single"
																	id="fromZone" name="fromArea">
																	<option selected disabled>Select Area</option>
																		<c:forEach items="${allAreas}" var="allarea">
																		<option value="${allarea.id}"
																			${serviceCharge.fromArea eq allarea ?'selected':''}>${allarea.name}</option>
																		</c:forEach>
																	<c:forEach items="${geoFence}" var="geoFence">
																		<option value="${geoFence.id}"
																			${serviceCharge.fromArea eq geoFence ?'selected':''}>${geoFence.name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label>Select To Area</label> <select
																	class="form-control js-example-basic-single"
																	id="toZone" name="toArea">
																	<option selected disabled>Select Area</option>
																		<c:forEach items="${allAreas}" var="allarea">
																		<option value="${allarea.id}"
																			${serviceCharge.toArea eq allarea ?'selected':''}>${allarea.name}</option>
																		</c:forEach>
																	<c:forEach items="${geoFence}" var="geoFence">
																		<option value="${geoFence.id}"
																			${serviceCharge.toArea eq geoFence ?'selected':''}>${geoFence.name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label>Shipment Type*</label> <select
																	class="form-control js-example-basic-single"
																	id="shipmentType" name="shipmentType">
																		<option selected disabled>Select Shipment Type</option>
																	<c:forEach items="${shipmentTypes}" var="shipmentType">
																		<option value="${shipmentType.id}"
																			${serviceCharge.shipmentType eq shipmentType ?'selected':''}>${shipmentType.name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label>Delivery Type*</label> <select
																	class="form-control js-example-basic-single"
																	id="serviceType" name="serviceType">
																		<option selected disabled>Select Delivery Type</option>
																	<c:forEach items="${serviceTypes}" var="serviceType">
																		<option value="${serviceType.id}"
																			${serviceCharge.serviceType eq serviceType ?'selected':''}>${serviceType.name}</option>
																	</c:forEach>
																
																	
																</select>
															</div>
														</div>
														
														

														<div class="col-md-4">
															<div class="form-group">
																<label for="serviceAmount">Service Charges*</label> <input
																	type="number" name="serviceAmount"
																	value="${serviceCharge.serviceAmount}" required
																	class="form-control" id="serviceAmount" placeholder="">
															</div>
														</div>

														<div class="col-md-2">
															<div class="form-check">
																<input class="form-check-input" value="true"
																	name="enabled" ${serviceCharge.enabled  ?'checked':''}
																	type="checkbox" id="enabled"> <label
																	class="form-check-label" for="enabled">Active</label>
															</div>
														</div>

														<div class="col-md-12">
														<br>
															<button type="submit" class="btn btn-primary" title=""
																data-toggle="tooltip" data-original-title="Submit">Submit</button>

														</div>

													</div>
												</form>



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
	<!-- [ Main Content ] end -->

	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
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



</body>

</html>
