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
<!-- Client -- Is Office Address -- List Branch Addresses of Client -->

<head>
<title>Create Shipment :: Raseel</title>

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
										<h5 class="m-b-10">Create Shipment</h5>
									</div>
									<ul class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"><i
												class="feather icon-home"></i></a></li>
										<li class="breadcrumb-item"><a href="#!">Create
												Shipment</a></li>
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
											<h5>Create Excel format</h5>
											<br> <br>
											<div class="card-header"
												style="background: #f4f7fa; color: black">
												<form action="${contextPath}/createExcelFormat"
													method="POST">
													<input type="hidden" name="filter" value="1">

													<div class="row">
														<div class="col-md-3">
															<div class="form-group">
																<label>Select Client</label> <select
																	class="form-control js-example-basic-single"
																	name="client" required id="client">
																	<option disabled selected>Select Client</option>
																	<c:forEach items="${customers}" var="customer">
																		<option value="${customer.id}">${customer.customerName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>

														<div class="col-md-3" id="branchAddressSection" style="display: none;">
															<div class="form-group">
																<label>Branch Address</label> <select
																	class="form-control js-example-basic-single"
																	name="branch" required id="branchAddress">
																	<option disabled selected>Select Branch</option>

																</select>
															</div>
														</div>


													</div>
													<div class="row">
														<div class="col-md-3">
															<!-- <a href="" style="color: black" class="btn btn-primary">Download Excel Format</a> -->
															<button type="submit" style="margin-top: 25px;"
																class="btn btn-primary " title="" data-toggle="tooltip"
																data-original-title="Download format">Download Format</button>
															
														</div>
														<div class="col-md-6">
														<a style="margin-top: 25px;color: white;" 
																onclick="openShipmentForm();"
																class="btn btn-primary " title="" data-toggle="tooltip"
																data-original-title="Shipment Form">Manually Fill Shipment Form</a>
														</div>
													</div>

												</form>
											</div>
											<br> <br>
											<h5>Upload Excel</h5>
											<br> <br>
											<div class="card-header"
												style="background: #f4f7fa; color: black">
												<form action="${contextPath}/uploadExcelShipments" method="POST" enctype="multipart/form-data">

													<div class="row">
														<div class="col-md-3">
															<div class="form-group">
																<label>Excel File</label> <input type="file" name="file"
																	class="form-control" required>
<!-- 																	 accept="application/vnd.ms-excel"
 -->															</div>
														</div>


													</div>

													<div class="col-md-3">
														<button type="submit" style="margin-top: 25px;"
															class="btn btn-primary " title="" data-toggle="tooltip"
															data-original-title="Upload excel">Upload Excel
															</button>
													</div>
												</form>
											</div>
										</div>
										
								
										<div class="card-block">
											<c:if test="${not empty excelFormatReady}">
												<a
													href="${contextPath}/downloadExcelFormat?file=${excelFormatReady}"
													id="downloadExcelFormat" style="display: none;">Download
													Excel Format</a>

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

	<c:if test="${not empty excelFormatReady}">
		<script>
			$(document).ready(function() {
				$('#downloadExcelFormat')[0].click();
			});
		</script>
	</c:if>
	<script>
	function openShipmentForm(){
		if($("#client").val()!="" && $("#client").val()!=null ){
			window.location.href = "${contextPath}/openAdminShipmentForm?id="+$("#client").val()+"&branchId="+$("#branchAddress").val();
		}else{
			alert("Please select a client");
		}
	}
	
	$('#client').on('change', function() {
		  var param = this.value;
		 
				$.ajax({
					url : '${contextPath}/getBranchByClient',
					data : {
						id : param
					},
					type : 'GET',
					cache : false,
					contentType : 'application/json; charset=utf-8',
					dataType : "json",
					success : function(result) {
						var dbSelect = $('#branchAddress');
						dbSelect.empty();
						for (var i = 0; i < result.length; i++) {
							dbSelect.append($('<option/>', {
								value : result[i].id,
								text : result[i].geoFence.name
										+ " | Address : "
										+ result[i].geoFence.address
							}));
						}
						$('#branchAddressSection').css("display","block");
						
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert(thrownError);
					}
				});
		});
	
		$('#client').on(
				'select2:select',
				function(e) {
					var data = e.params.data;
					console.log(data.id);

					var countryParam = {
						"id" : data.id
					};
					$.ajax({
						url : '${contextPath}/getBranchByClient',
						data : {
							id : data.id
						},
						type : 'GET',
						cache : false,
						contentType : 'application/json; charset=utf-8',
						dataType : "json",
						success : function(result) {
							var dbSelect = $('#branchAddress');
							dbSelect.empty();
							for (var i = 0; i < result.length; i++) {
								dbSelect.append($('<option/>', {
									value : result[i].id,
									text : result[i].geoFence.name
											+ " | Address : "
											+ result[i].geoFence.address
								}));
							}
							$('#branchAddressSection').css("display","block");
							
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(thrownError);
						}
					});
				});
	</script>
</body>

</html>
