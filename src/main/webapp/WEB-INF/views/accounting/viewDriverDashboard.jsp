<%--
  Created by Winning Solutions.
  Date: 11/06/2019
  Time: 5:16 PM
--%>
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
<title>Driver Dashboard :: Raseel</title>

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

					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ sample-page ] start -->
								<div class="col-sm-12">
									<div class="card">
										<div class="card-header">
											<div class="card-header"
												style="background: #f4f7fa; color: black">
												<form action="${contextPath}/driverDashboard" method="POST">
													<input type="hidden" name="filter" value="1">

													<div class="row">
														<div class="col-md-3">
															<div class="form-group">
																<label>Select Driver</label> <select
																	class="form-control js-example-basic-single"
																	name="drivers">
																	<c:forEach items="${drivers}" var="driver">
																		<option value="${driver.id}">${driver.contactFirstName}
																			${driver.contactLastName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<!-- <div class="col-md-3">
															<div class="form-group">
																<label>from Date</label> <input class="form-control"
																	type="date" name="fromdate" value="" />
															</div>
														</div>
														<div class="col-md-3">
															<div class="form-group">
																<label>to Date</label> <input class="form-control"
																	type="date" name="todate" value="" />
															</div>
														</div> -->
														<div class="col-md-3">

															<button type="submit" style="margin-top: 25px;"
																class="btn btn-primary " title="" data-toggle="tooltip"
																data-original-title="Filter">Search</button>

														</div>

													</div>


												</form>
											</div>
										</div>
										<div class="card-block">

											<c:if test="${not empty dashboard}">
<div class="col-md-8 col-xl-4">
                                <div class="card card-social">
                                    <div class="card-block border-bottom">
                                        <div class="row align-items-center justify-content-center">
                                            <div class="col-auto">
                                                <img alt="noImage" style="height: 80px;" src="${contextPath}/assets/images/wallet.png">
                                            </div>
                                            <div class="col text-right">
                                                <h3>${driverCashInTransit}</h3>
                                                 <h5 class="text-c-green mb-0"><span class="text-muted">Driver Wallet</span></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-block">
                                        <div class="row align-items-center justify-content-center card-active">
                                            <div class="col-6">
                                                <h6 class="text-center m-b-10"><span class="text-muted m-r-5">Fuel Expense:</span>${driverPetrolExpense}</h6>
                                                <div class="progress">
                                                    <div class="progress-bar progress-c-theme2" role="progressbar" style="width:100%;height:6px;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <h6 class="text-center  m-b-10"><span class="text-muted m-r-5">Phone Expense:</span>${driverPhoneExpense}</h6>
                                                <div class="progress">
                                                    <div class="progress-bar progress-c-theme2" role="progressbar" style="width:100%;height:6px;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-12 col-md-12">
                                <div class="card Recent-Users">
                                    <div class="card-header">
                                        <h5>Shipments in Possession</h5>
                                        <div class="card-header-right">
                                          
                                        </div>
                                    </div>
                                    <div class="card-block px-0 py-3">
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <tbody>
                                                <c:forEach items="${shipments}" var="shipment">
                                                 	<c:if test="${shipment.status.name == 'READY TO DELIVER'}">
		                                             <tr class="unread">
		                                                    <td><img class="rounded-circle" style="width:40px;" src="../assets/images/cargobox.png" alt="activity-user"></td>
		                                                    <td>
		                                                        <h6 class="mb-1">${shipment.customerUser.customer.customerName}</h6>
		                                                        <p class="m-0">Receiver Address : ${shipment.receiverAddress}</p>
		                                                    </td>
		                                                    <td>
		                                                        <h6 class="text-muted"><i class="fas fa-circle text-c-green f-10 m-r-15"></i>Amount : ${shipment.codAmount}  &nbsp; &nbsp; Service Charges : ${shipment.serviceChargeAmount}</h6>
		                                                    </td>
		                                                    <td>
		                                                        <h6 class="text-muted"><i class="fas fa-circle text-c-green f-10 m-r-15"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${shipment.deliveryDate}" /></h6>
		                                                    </td>
<!-- 		                                                    <td><a href="#!" class="label theme-bg2 text-white f-12">Reject</a><a href="#!" class="label theme-bg text-white f-12">Approve</a></td>
 -->		                                               </tr>
                                                     </c:if>
                                                 </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
	</div>



	<!-- [ Main Content ] end -->

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

</html>
