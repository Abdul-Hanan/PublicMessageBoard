<%--
  Created by Winning Solutions.
  Office: Shoaib ul din PC
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
    <title>${edit eq true? 'Edit':'Create'} Device :: Raseel</title>

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

    <style>
        #map-plot {
            height: 100%;
        }
    </style>

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
                                    <h5 class="m-b-10">Raseel Device</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="${contextPath}/devices">Devices</a></li>
                                    <li class="breadcrumb-item"><a href="#!">${edit eq true? 'Edit':'Create'} </a></li>
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
                                        <h5>${edit eq true? 'Edit':'Create'} Devices</h5>
                                    </div>
                                    <div class="card-block row">
                                        <div class="col-md-8">
                                            <form action="${contextPath}/device" method="post" id="submitForm">
                                                <input type="hidden" name="id" value="${device.id}">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="devicename">Device Name*</label>
                                                            <input type="text" name="name" value="${device.name}" required class="form-control" id="devicename" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="imei">Device Imei <b style="color:red; display:none;"
															id="exists"> (IMEI Exists!)</b></label>
                                                            <input type="text" name="imei" value="${device.imei}" class="form-control" id="imei" placeholder="">
                                                        </div>
                                                    </div>                                                                                               
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="deviceType">Device Type*</label>
                                                            <select name="deviceType" class="form-control js-example-basic-single" required id="deviceType">
                                                                <option disabled>Select Device Type</option>   
                                                                    <option value="Android" ${device.deviceType eq deviceType ?'selected':''}>Android</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="devicename">Manufacturer*</label>
                                                            <input type="text" name="manufacturer" value="${device.manufacturer}" required class="form-control" id="manufacturer" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="androidVersion">Android Version*</label>
                                                            <input type="number" name="androidVersion" value="${device.androidVersion}" required class="form-control" id="androidVersion" placeholder="">
                                                        </div>
                                                    </div>
                                                     <div class="col-md-2">
                                                        <div class="form-check">
                                                            <input class="form-check-input" value="true" name="isactive" ${device.isactive  ?'checked':''} type="checkbox" id="isactive">
                                                            <label class="form-check-label" for="isactive">Active</label>
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="col-md-4">
<!--                                                         <a class="btn btn-primary" title="" data-toggle="tooltip" data-original-title="Submit" onclick="validateMyForm();">Submit</a>
 -->                                                                                                           
 														<button type="submit" class="btn btn-primary" title="" data-toggle="tooltip" data-original-title="Submit">Submit</button>
 
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
var responseGlobal ;


$('#imei').on('input',function() {
					// do something
					var x = document.getElementById("imei").value;
					
					
					$.ajax({
						type : "POST",
						url : "checkIfImeiExists",
						data : {
							"deviceimei" : x,
							"editOrCreate" : ${edit eq true? 'Edit':'Create'}
						},
						success : function(response) {
							if (response == "Valid") {
								responseGlobal = "Valid";
								document.getElementById('imei').style.borderColor = "Green";
								document.getElementById('exists').style.display = "none";
									
									} else {
										responseGlobal = "invalid"
										document.getElementById('deviceimeino').style.borderColor = "Red";
										document.getElementById('exists').style.display = "inline";
										
									}
								}
							});
				});


function validateMyForm() {

	if (responseGlobal == "Valid") {
		$("#submitForm").submit();
	} else {
		alert("Form not valid!");
	}

}
</script>


</body>

</html>
