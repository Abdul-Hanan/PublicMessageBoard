<%--
  Created by Winning Solutions.
  User: Shoaib ul din PC
  Date: 11/06/2019
  Time: 5:16 PM
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">


<head>
    <title>Areas :: Raseel</title>

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
                                    <h5 class="m-b-10">Raseel Areas</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="#!">Areas</a></li>
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
                                        <h5>Manage Areas</h5>
                                        <div class="card-header-right">
                                            <sec:authorize access="hasAuthority('create-area')">
                                                <button type="button" onclick="location = 'area'" class="btn btn-primary btn-icon" title="" data-toggle="tooltip" data-original-title="Create a New Area">
                                                    <i class="feather icon-plus"></i>

                                                </button>
                                            </sec:authorize>
                                        </div>
                                    </div>
                                    <div class="card-block">

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div style="height:300px;" class="set-map map-canvas rounded-corners">
                                                    <div class="top-left"></div>
                                                    <div class="top-right"></div>
                                                    <div id="map-plot"></div>
                                                    <div class="bottom-left"></div>
                                                    <div class="bottom-right"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <form method="get" action="${contextPath}/areas">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Select Country</label>
                                                                <select name="countryId" class="form-control js-example-basic-single" id="country">
                                                                    <option disabled selected>Select Country</option>
                                                                    <c:forEach var="country" items="${countries}">
                                                                        <option value="${country.id}" ${param.countryId eq country.id ?'selected':''}>${country.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Select City</label>
                                                                <select name="cityId" class="form-control js-example-basic-single" id="city">
                                                                    <option disabled selected>Select City</option>
                                                                    <c:forEach var="city" items="${cities}">
                                                                        <option value="${city.id}" ${param.cityId eq city.id ?'selected':''}>${city.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label >Location Type*</label>
                                                                <select disabled class="form-control js-example-basic-single" id="locationType">
                                                                    <option disabled selected value="">Area</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <button type="submit" class="float-right btn btn-primary btn-sm">Filter</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <br>


                                        <div class="table-responsive">
                                            <table id="key-act-button" class="display table nowrap table-hover" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Area Name</th>
                                                    <th>Arabic Name</th>
                                                    <th>Area Address</th>
                                                    <th>Zone</th>
                                                    <th>City</th>
                                                    <th>Country</th>
                                                    <th>Location Type</th>
                                                    <th>Active</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach varStatus="loop" var="area" items="${areas}">
                                                    <tr>
                                                        <td>${loop.index+1}</td>
                                                        <td>${area.name} </td>
                                                        <td>${area.arabicName} </td>
                                                        <td>${area.address}</td>
                                                        <td>${area.zoneName}</td>
                                                        <td>${area.city.name}</td>
                                                        <td>${area.country.name}</td>
                                                        <td>${area.locationType.name}</td>
                                                        <td>${area.enabled eq true ? 'Yes':'No'}</td>
                                                        <td>
                                                            <sec:authorize access="hasAuthority('edit-area')">
                                                                <a href="${contextPath}/area?id=${area.id}" class="text-left" data-cont="forms"><i class="feather feather icon-edit"></i></a>
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

    $('#country').on('select2:select', function (e) {
        var data = e.params.data;
        console.log(data.id);

        var countryParam ={"id": data.id};
        $.ajax({
            url: '${contextPath}/getCitiesByCountry',
            data: {id : data.id},
            type: 'GET',
            cache: false,
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            success: function (result) {
                var dbSelect = $('#city');
                dbSelect.empty();
                for (var i = 0; i < result.length; i++) {
                    dbSelect.append($('<option/>', {
                        value: result[i].id,
                        text: result[i].name
                    }));
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    });
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_ViFpUp7DSL7VUJCuO181fh5iqL1EXJI&libraries=places&callback=initMap" sync defer></script>

<script>
    var map = null;
    var marker;
    var markers = [];
    var circle;
	var infoWindow;
    function initMap() {
        map = new google.maps.Map(

            document.getElementById('map-plot'),{
                center : {
                    lat : 33.682,
                    lng : 73.052
                },
                zoom : 11
            });
        infoWindow = new google.maps.InfoWindow;

        <c:forEach varStatus="loop" var="zone" items="${zone}">
        marker = new google.maps.Marker({
            position : new google.maps.LatLng(${zone.latitude}, ${zone.longitude}),
            map : map
        });
        </c:forEach>

     // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Estimated Location');
            infoWindow.open(map);
            map.setCenter(pos);

/* 	            mapR.setCenter(pos);
*/	            
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }

    }



    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }


</script>















</body>

</html>
