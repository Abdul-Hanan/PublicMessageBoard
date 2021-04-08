<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
<title>Raseel</title>

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

<body class="fix-menu">
<!-- [ Main Content ] start -->
	<div class="pcoded-main-container" style="margin-right: 264px">
		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
			
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ sample-page ] start -->
								<div class="col-sm-12">
									<div class="card">
			
										<div class="card-header" style="background: #f4f7fa; color: black">
				
										</div>
										<div class="card-block">
							<sec:authorize
									access="hasAuthority('customeruser')">
									<p>Something went wrong while performing this action, Sorry for the inconvenience please contact your administrator.</p>
									<p>
										Click <a href="${contextPath}/shipments">here</a> to proceed
										to the dashboard.
									</p>
								</sec:authorize> <sec:authorize access="hasAuthority('admin')">
								<p>Something went wrong while performing this action, Sorry for the inconvenience please contact your administrator.</p>
									<p>
										Click <a href="${contextPath}/adminShipments">here</a> to proceed to
										the dashboard.
									</p>
								</sec:authorize>
														<sec:authorize access="isAnonymous()">
								<p>You are not authorized to perform this action, please contact your administrator.</p>
								<h5>${pageContext.request.userPrincipal.name}</h5> 
											<p>
										Click <a href="${contextPath}/login">here</a> to Login.
									</p>			
								</sec:authorize>
								
								<sec:authorize access="isAuthenticated()">
								<p>You are not authorized to perform this action, please contact your administrator.</p>
								<h5>${pageContext.request.userPrincipal.name}</h5> 
											<p>
										Click <a href="${contextPath}/login">here</a> to Login.
									</p>			
								</sec:authorize>

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
						

						<!-- end of form -->
						<!-- Logout Form -->
						<form id="logoutForm" method="post" action="${contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<!-- Logout Form End -->
		
	
</body>
<!-- Required Js -->
<script src="${contextPath}/assets/js/vendor-all.min.js"></script>
<script src="${contextPath}/assets/js/pcoded.min.js"></script>
<script src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- datatable Js -->
<script src="${contextPath}/assets/plugins/data-tables/js/datatables.min.js"></script>
<script src="${contextPath}/assets/js/pages/tbl-datatable-custom.js"></script>
<script src="${contextPath}/assets/plugins/sweetalert/js/sweetalert.min.js"></script>

<!-- select2 Js -->
<script src="../assets/plugins/select2/js/select2.full.min.js"></script>
<!-- form-select-custom Js -->
<script src="../assets/js/pages/form-select-custom.js"></script>


</html>
