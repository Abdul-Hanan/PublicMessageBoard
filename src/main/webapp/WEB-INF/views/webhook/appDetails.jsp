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
<title>App Details</title>

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

<link rel="stylesheet"
	href="${contextPath}/assets/plugins/select2/css/select2.min.css">
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
.loader {
	border: 8px solid #f3f3f3;
	border-radius: 50%;
	 border-top: 8px solid #008080;
	  border-right: 8px solid #C0C0C0;
	  border-bottom: 8px solid #008080;
	  border-left: 8px solid #C0C0C0;
	width: 30px;
	height: 30px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}


@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
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
									<div class="page-header-title"></div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a
											href="${contextPath}/welcomeDeveloper">My apps</a></li>

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
											<h4>${app.appName}</h4>
										</div>
											<table id="apptable" class="display table"
												style="width: 100%">
												<thead>
													<tr>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<tr style="background-color: #f5f5f5">
														<td style="color: #1b438c">Status</td>
														<td style="color: blue; text-align: left">${app.status} </td>
													</tr>
													<tr style="background-color: #f5f5f5">
														<td style="color: #1b438c">Permission Type</td>
														<td style="color: black; text-align: left">${app.permissionType}</td>
													</tr>
													<tr style="background-color: #f5f5f5">
														<td style="color: #1b438c">Access Token</td>
														<c:if test="${not empty app.accessToken}">
															<td style="color: black; text-align: left">${app.accessToken}</td>

														</c:if>
														<c:if test="${empty app.accessToken}">
															<td style="color: black; text-align: left"><button
																	id="genBtn" class="btn btn-sm btn-primary"
																	onclick="getToken('${app.id}')">generate</button> <b
																id="token" style="display: none;"></b></td>
														</c:if>
													</tr>
													<tr style="background-color: #f5f5f5;">
														<td style="color: #1b438c">Webhooks</td>
														<td><table id="webhook-list">
																<thead>
																	<tr>
																		<th><strong>Webhook URIs</strong></th>
																		<th>Active</th>
																		<th></th>
																		<th></th>
																		<th></th>
																	</tr>
																</thead>
																<tbody class="hoverable-url webhook-row" id="webhooktable">
																<c:forEach var="webhook" items="${app.destinations}">
																	<tr style="background-color: #ffffff; color:#1b438c">
																		<td>${webhook.url}</td>
																		
																		<c:if test="${webhook.active eq true}">
																			<td style="color: blue">${webhook.active}</td>								
																		</c:if>
																		<c:if test="${webhook.active eq false}">
																			<td style="color: red">${webhook.active}</td>									
																		</c:if>
																		
																		
																		<td>
																		<c:if test="${webhook.active eq true}">
																		<div class="loader" id="${webhook.id}loader" style="display: none;"></div>
																			<button class="btn btn-sm btn-primary" id="${webhook.id}btn" onclick="disable('${app.id}','${webhook.id}','${webhook.url}');">Disable</button>									
																		</c:if>
																		<c:if test="${webhook.active eq false}">																
																		<div class="loader" id="${webhook.id}loader" style="display: none;"></div>
 																			<button class="btn btn-sm btn-primary" id="${webhook.id}btn" onclick="enable('${app.id}','${webhook.id}','${webhook.url}');">Enable</button>									
 																		</c:if>
																		</td>
																		<td><button class="btn btn-sm btn-danger" onclick="deleteHook('${app.id}','${webhook.id}');" >X</button></td>
																		<td>${webhook.responseMsg}</td>
																	</tr>
																</c:forEach>
																	
																	<tr>
																		<td colspan="2"><input type="text" autocomplete="off" placeholder="example https://192.18.1.1/webhook" class="form-control" name="url" id="url"></td>
																		<td><button class="btn btn-sm btn-primary" onclick="addHook('${app.id}');" >Add</button></td>
																	</tr>
																	
																</tbody>
															</table>
															</td>
													</tr>
												</tbody>

											</table>
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
	<script
		src="${contextPath}/assets/plugins/select2/js/select2.full.min.js"></script>
	<!-- form-select-custom Js -->
	<script src="${contextPath}/assets/js/pages/form-select-custom.js"></script>

	<c:if test="${not empty param.msg}">
		<script>
			swal("${param.msg}", "", "${param.status}");
		</script>
	</c:if>

</body>
<script>
	$('#apptable').DataTable({
		"paging" : false,
		"ordering" : false,
		"info" : false,
		searching : false
	});

	function getToken(appId) {
		$.ajax({
			url : '${contextPath}/api/common/getToken',
			data : {
				id : appId
			},
			type : 'POST',
			success : function(result) {
				$("#token").append(result);
				$("#token").css("display", "block");
				$("#genBtn").css("display", "none");

			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(thrownError);
			}
		});
	}
	
	function addHook(appId){
		var urll =  $("#url").val();
		$.ajax({
			url : '${contextPath}/api/common/addWebHook',
			data : {
				id : appId,
				url : urll
			},
			type : 'POST',
			success : function(result) {
				//$("#webhooktable").prepend("");
				if(result=="success"){
					location.href= "${contextPath}/appDetails?id="+appId;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("Unable to add hook");
			}
		});
	}
	
	function enable(appId,webhookId , urll){
		$("#"+webhookId+"btn").css("display","none");
		$("#"+webhookId+"loader").css("display","block");

		$.ajax({
			url : '${contextPath}/api/common/enableWebHook',
			data : {
				id : webhookId,
				url : urll
			},
			type : 'POST',
			success : function(result) {
				if(result=="success"){
					location.href= "${contextPath}/appDetails?id="+appId;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("Unable to enable hook");
			}
		});
	}
	
function disable(appId,webhookId , urll){
	$("#"+webhookId+"btn").css("display","none");
	$("#"+webhookId+"loader").css("display","block");

	$.ajax({
			url : '${contextPath}/api/common/disableWebHook',
			data : {
				id : webhookId,
				url : urll
			},
			type : 'POST',
			success : function(result) {
				if(result=="success"){
					location.href= "${contextPath}/appDetails?id="+appId;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("Unable to disable hook");
			}
		});
	}
	
function deleteHook(appId,webhookId){
	$.ajax({
			url : '${contextPath}/api/common/deleteWebHook',
			data : {
				id : webhookId
				},
			type : 'POST',
			success : function(result) {
				if(result=="success"){
					location.href= "${contextPath}/appDetails?id="+appId;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("Unable to delete hook");
			}
		});
	}
	
</script>

</html>
