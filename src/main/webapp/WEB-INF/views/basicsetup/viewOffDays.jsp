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
<title>Working Days :: Raseel</title>

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
										<h5 class="m-b-10">Raseel Working Days</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a href="#!">Working Days</a></li>
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
											<h5>Manage Working Days</h5>
											<div class="card-header-right">
												<%--  <sec:authorize access="hasAuthority('create-driverSupervisor')">
                                                <button type="button" onclick="location = 'driverSupervisor'" class="btn btn-primary btn-icon" title="" data-toggle="tooltip" data-original-title="Create a New Driver Supervisor"><i class="feather icon-plus"></i></button>
                                            </sec:authorize> --%>
											</div>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<table id="offDaysTable"
													class="display table nowrap table-hover "
													style="width: 100%">
													<thead>
														<tr>
															<th>#</th>
															<th>Working Day</th>
															<th>Opening Time</th>
															<th>Closing Time</th>
															<th>Is Working Day</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach varStatus="loop" var="offDay"
															items="${offDays}">
															<tr>
																<form action="${contextPath}/offDay" method="post">
																	<input type="hidden" value="${offDay.id}" name="id">
																<td>${loop.index+1}</td>
																<td><input type="text" readonly="readonly"
																	name="name" value="${offDay.name}"></td>
																<td><input type="time" name="startTime"
																	value="${offDay.startTime}"></td>
																<td><input type="time" name="endTime"
																	value="${offDay.endTime}"></td>
																<td><div class="form-check">
																		<input class="form-check-input" value="1"
																			name="isactive" ${offDay.isactive==1 ? 'checked':''}
																			type="checkbox" id="gridCheck1"> <label
																			class="form-check-label" for="gridCheck1">Active</label>
																	</div></td>
																<td><sec:authorize
																		access="hasAuthority('edit-offDay')">
																		<button type="submit" class="btn btn-primary" title=""
																			data-toggle="tooltip" data-original-title="Submit">update</button>
																	</sec:authorize></td>
																</form>
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

	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>

</body>
<script>
$('#offDaysTable').DataTable({
	"paging":   false,
    "ordering": false,
    "info":     false,
    searching: false
});
</script>

</html>
