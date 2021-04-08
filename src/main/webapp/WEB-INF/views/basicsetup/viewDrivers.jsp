<%--
  Created by Winning Solutions.
  User: Shoaib ul din PC
  Date: 11/06/2019
  Time: 5:16 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
    <title>Drivers :: Raseel</title>

    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
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
</head>

<body> <!-- [ Pre-loader ] start -->
<div class="loader-bg">
<%--    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>--%>
    <img src="${contextPath}/assets/images/pre-loader.gif" style="display: block;margin-left: auto;margin-right: auto;width: 40%;" align="middle">
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
                                    <h5 class="m-b-10">Raseel Drivers</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="#!">Drivers</a></li>
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
                                        <h5>Manage Drivers</h5>
                                        <div class="card-header-right">
                                            <sec:authorize access="hasAuthority('create-driver')">
                                                <button type="button" onclick="location = 'driver'" class="btn btn-primary btn-icon" title="" data-toggle="tooltip" data-original-title="Create a New Driver">
                                                    <i class="feather icon-plus"></i></button>
                                            </sec:authorize>
                                        </div>
                                    </div>
                                    <div class="card-block">
                                    <div style="float: right;">
										
										  <a onclick="disableDrivers();" style="color: black"	class="btn btn-sm btn-rounded btn-outline-primary md-trigger"
																	data-cont="forms">Disable</a>
										</div>
                                     <div class="table-responsive">
												<table id="driverTable"
													class="display table nowrap table-hover"
													style="width: 100%">
                                                <thead>
                                                    <tr>
														<th><input type="checkbox" id="selectAll"></th>
                                                        <th>Contact Name</th>
                                                        <th>Contact Email</th>
                                                        <th>Contact Phone</th>
                                                        <th>Contact Phone 2</th>
                                                        <th>Vehicle Type</th>
                                                        <th>Residence Area</th>
                                                        <th>Pickup Areas</th>
                                                        <th>Delivery Areas</th>
                                                        <th>Login Name</th>
                                                        <th>Active</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach varStatus="loop" var="driver" items="${drivers}">
                                                    <tr> 
                                                        <td><input type="checkbox" name="selectedDrivers[]" class="selectedDrivers" value="${driver.id}" class="selects"></td>
                                                        <td>${driver.contactFirstName}  ${driver.contactMiddleName} ${driver.contactLastName}</td>
                                                        <td>${driver.contactEmail}</td>
                                                        <td>${driver.contactPhone}</td>
                                                        <td>${driver.contactPhone2}</td>
                                                        <td>${driver.vehicleType}</td>
                                                        <td>${driver.residenceArea.name}</td>
                                                        <td>
                                                        <c:forEach items="${driver.pickupAreas}" var="pickuparea">
                                                        	${pickuparea.name} |
                                                        </c:forEach>
                                                        </td>
                                                        <td>
                                                        <c:forEach items="${driver.deliveryAreas}" var="deliveryArea">
                                                        	${deliveryArea.name} |
                                                        </c:forEach>
                                                        </td>
                                                        
                                                        <td>${driver.user.username}</td>
                                                        <td>${driver.user.enabled eq true ? 'Yes':'No'}</td>
                                                        <td>
                                                            <sec:authorize access="hasAuthority('edit-driver')">                                                      
                                                                <a href="${contextPath}/driver?id=${driver.id}" class="btn btn-primary" style="color: white" data-cont="forms">Edit</a>
<%--                                                                 <a href="${contextPath}/driverJourneyPlan?id=${driver.id}" class="btn btn-warning" style="color: white" data-cont="forms">Driver Areas</a>
 --%>                                                           
                                                            </sec:authorize>
                                                             <sec:authorize access="hasAuthority('edit-journeyPlan')">                                                      
                                                            </sec:authorize>
                                                        </td>
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
        swal("${param.msg}","","${param.status}");
    </script>
</c:if>

<script>

function disableDrivers(){
	var driverNos="0";
    $('.selectedDrivers').each(function() {
        if($(this).prop("checked") != false){
        	driverNos += ","+$(this).val();
         }
    });
    if(driverNos=="0"){
        alert("Please select atleast one Driver");
    }else{
        // Run ajax to diable here
    	 $.ajax({
             url: '${contextPath}/disableDrivers',
             data: {drivernos : driverNos},
             type: 'GET',
             cache: false,
             success: function (result) {
                 alert(result);
             },
             error: function (xhr, ajaxOptions, thrownError) {
                 console.log(thrownError)
             }
         });
    }
}

$('#selectAll').click(function() {
    $('.selectedDrivers').each(function() {
        $(this).attr('checked',!$(this).attr('checked'));
    });
});


$('#driverTable').DataTable({
	"paging":   false,
    "ordering": false,
    "info":     false,
    dom : 'Bfrtip',
	buttons : [ {
		text : '<i class="fa fa-file-pdf-o"></i> PDF',
		extend : 'pdfHtml5',
		orientation: 'landscape',
        pageSize: 'LEGAL'
	}, {
		text : '<i class="fa fa-print"></i> Print',
		extend : 'print'
	} ]
});

</script>
</body>

</html>
