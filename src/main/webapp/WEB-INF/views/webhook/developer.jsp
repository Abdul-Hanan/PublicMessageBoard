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
<title>${edit eq true? 'Edit':'Create'} Developer:: Raseel</title>

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
										<h5 class="m-b-10">Developer</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a
											href="${contextPath}/developers">Developers</a></li>
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
											<h5>${edit eq true? 'Edit':'Create'} Developer</h5>
										</div>
										<div class="card-block row">
											<div class="col-md-8">
												<form action="${contextPath}/developer" method="post">
													<input type="hidden" value="${developer.id}" name="id">
													<input type="hidden" value="${developer.user.id}"
														name="user.id">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label for="firstName">First Name*</label> <input
																	name="user.firstName"
																	value="${developer.user.firstName}" type="text"
																	required class="form-control" id="firstName"
																	placeholder="">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="lastName"> Last Name*</label> <input
																	name="user.lastName" value="${developer.user.lastName}"
																	type="text" required class="form-control" id="lastName"
																	placeholder="">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="email"> Email*</label> <input
																	name="user.email" value="${developer.user.email}"
																	type="text" required class="form-control" id="email"
																	placeholder="">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="username">Login Name*</label> <input
																	name="user.username" value="${developer.user.username}"
																	type="text" required class="form-control" id="username"
																	placeholder="">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="password">Password*</label> <input
																	name="user.password" value="${developer.user.password}"
																	type="text" required class="form-control" id="password"
																	placeholder="">
															</div>
														</div>
														<div class="col-md-6">

															<div class="form-group">
																<label for="customers">Customers</label> <select
																	name="customers"
																	class="form-control js-example-basic-single"
																	id="customers" multiple="multiple">
																	<option disabled>Select Customers</option>
																	<c:forEach var="customer" items="${customers}">
																		<option value="${customer.id}"
																			<c:forEach var="selectedcustomer" items="${developer.customers}">
																        			${customer.id == selectedcustomer.id ? 'selected="selected"' : ''}
																    		</c:forEach>
																    >${customer.customerName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-check">
																<input class="form-check-input" value="true"
																	name="user.enabled"
																	${developer.user.enabled ? 'checked':''}
																	type="checkbox" id="gridCheck1"> <label
																	class="form-check-label" for="gridCheck1">Active</label>
															</div>
														</div>
														<div class="col-md-6">
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
<script src="${contextPath}/assets/plugins/select2/js/select2.full.min.js"></script>
<!-- form-select-custom Js -->
<script src="${contextPath}/assets/js/pages/form-select-custom.js"></script>

	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>

</body>

</html>