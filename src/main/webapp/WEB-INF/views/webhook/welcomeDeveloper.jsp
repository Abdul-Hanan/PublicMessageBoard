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
<title>Welcome Dev :: Raseel</title>

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
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
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
									<div class="page-header-title row">
										<div class="col-md-8">
											<h4 style="color: #3f4d67">My apps</h4>

										</div>
										<div class="col-md-4">
											<a href="createApp" class="btn btn-sm btn-primary rounded"
												style="background-color: #0070E0">Create app</a>
										</div>

									</div>
									<br>
								</div>
							</div>
						</div>
					</div>
					<!-- [ breadcrumb ] end -->
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ daily sales section ] start -->
								<c:forEach items="${dev.apps}" var="app">
									<div class="card col-md-4">
										<div class="card-block" align="center">
											<img src="${contextPath}/assets/images/dev_icon.png"
												style="height: 100px;"> <br> <br>
											<h5 class="mb-4">
												<a href="appDetails?id=${app.id}" style="color: #0070E0">${app.appName}</a>
											</h5>
											<h6 class="mb-4">Permission type: ${app.permissionType}</h6>

										</div>
									</div>
								</c:forEach>
								<!-- [ daily sales section ] end -->

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

	<!-- amchart js -->
	<script src="${contextPath}/assets/plugins/amchart/js/amcharts.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/gauge.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/serial.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/light.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/pie.min.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/ammap.min.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/usaLow.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/radar.js"></script>
	<script src="${contextPath}/assets/plugins/amchart/js/worldLow.js"></script>
	<!-- notification Js -->

	<!-- dashboard-custom js -->
	<script src="${contextPath}/assets/js/pages/dashboard-custom.js"></script>


</body>

</html>
