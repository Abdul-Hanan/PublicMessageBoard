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
    <title>${edit eq true? 'Edit':'Create'} ${customer.customerName} Branch :: Raseel</title>

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
                                <c:if test="${not empty customer}">
                                    <h5 class="m-b-10"><img class="media-object " height="40px" width="40px" src="${contextPath}/getCustomerImage?id=${customer.id}">  ${customer.customerName}</h5>
                                </c:if>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="${contextPath}/customers">${customer.customerName}</a></li>
                                    <li class="breadcrumb-item"><a href="${contextPath}/customerOffices?customerId=${customer.id}">Offices</a></li>
                                    <li class="breadcrumb-item"><a href="#!">${edit eq true? 'Edit':'Create'} Branch</a></li>
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
                                        <h5>${edit eq true? 'Edit':'Create'} Branch</h5>
                                    </div>
                                    <div class="card-block row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="officeName">Search*</label>
                                                <input type="text" required class="form-control" id="searchLocation" placeholder="">
                                            </div>

                                            <div style="height:300px;" class="set-map map-canvas rounded-corners">
                                                <div class="top-left"></div>
                                                <div class="top-right"></div>
                                                <div id="map-plot"></div>
                                                <div class="bottom-left"></div>
                                                <div class="bottom-right"></div>
                                            </div>
                                            <hr>

                                            <form method="post" action="${contextPath}/customerOffice" enctype="multipart/form-data">
                                                <input type="hidden" name="id" value="${customerOffice.id}">
                                                <input type="hidden" name="customer.id" value="${param.customerId}">
                                                <input type="hidden" name="geoFence.id" value="${customerOffice.geoFence.id}">
                                                <div class="row">
                                                  <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="officeName">Branch Name*</label>
                                                            <input type="text" name="geoFence.name" value="${customerOffice.geoFence.name}" required class="form-control" id="officeName" placeholder="">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="officeAddress">Branch Address*</label>
                                                            <input type="text" name="geoFence.address" value="${customerOffice.geoFence.address}" required class="form-control" id="officeAddress" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="description">Description</label>
                                                            <input type="text" name="description" value="${customerOffice.description}"  class="form-control" id="officeAddress" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="shippingLabelAddress">Shipping Label Address</label>
                                                            <input type="text" name="shippingLabelAddress" value="${customerOffice.shippingLabelAddress}"  class="form-control" id="shippingLabelAddress" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <div class="form-group">
																	<label>Select Area</label> <select
																		class="form-control js-example-basic-single"
																		id="zone" name="zone">
																		<option selected disabled>Select Area</option>
																		<c:forEach items="${zones}" var="zone">
																			<option value="${zone.id}" ${customerOffice.zone.id eq zone.id ?'selected':''}>${zone.name}, Zone: ${zone.zoneName}</option>
																		</c:forEach>
																	</select>
																</div>                                             
                                                    </div>
                                                    <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label for="ordersEnteredTillTime">Ordered can be entered Till* </label>
                                                                <input name="ordersEnteredTillTime" value="${not empty customerOffice.ordersEnteredTillTime? customerOffice.ordersEnteredTillTime:'12:00'}" type="time"  class="form-control" id="ordersEnteredTillTime" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="willBePickedUp">Will Be Picked Up*</label>
 															<select name="willBePickedUp" class="form-control js-example-basic-single"  id="willBePickedUp" required>
                                                                <option disabled>Select Type</option>
                                                                <c:forEach var="serviceType" items="${serviceTypes}">
                                                                    <option value="${serviceType.id}" ${serviceType.id == customerOffice.willBePickedUp.id ? 'selected' : ''}>${serviceType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="willBeDelivered">Will Be Delivered*</label>
 															<select name="willBeDelivered" class="form-control js-example-basic-single"  id="willBeDelivered" required>
                                                                <option disabled>Select Type</option>
                                                                <c:forEach var="serviceType" items="${serviceTypes}">
                                                                    <option value="${serviceType.id}" ${serviceType.id == customerOffice.willBeDelivered.id ? 'selected' : ''}>${serviceType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="latitude">Latitude</label>
                                                            <input type="text" name="geoFence.latitude" value="${customerOffice.geoFence.latitude}"  class="form-control" id="latitude" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="longitude">Longitude</label>
                                                            <input type="text" name="geoFence.longitude" value="${customerOffice.geoFence.longitude}"  class="form-control" id="longitude" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="longitude">Branch Image</label>
                                                            <div class="input-group cust-file-button">
                                                                <div class="custom-file">
                                                                    <input name="file" type="file" class="custom-file-input" id="inputGroupFile04">
                                                                    <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="longitude">Location Type*</label>
                                                            <select name="geoFence.locationType" class="form-control js-example-basic-single" required id="locationType" >
                                                                <option disabled>Select Location Type</option>
                                                                <c:forEach var="locationType" items="${locationTypes}">
                                                                    <option value="${locationType.id}" ${customerOffice.geoFence.locationType.id eq locationType.id ?'selected':''}>${locationType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="longitude">Country*</label>
                                                            <select name="geoFence.country" class="form-control js-example-basic-single" required id="country">
                                                                <option disabled>Select Country</option>
                                                                <c:forEach var="country" items="${countries}">
                                                                    <option value="${country.id}" ${customerOffice.geoFence.country.id eq country.id ?'selected':''}>${country.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="longitude">City*</label>
                                                            <select name="geoFence.city" class="form-control js-example-basic-single" required id="city">
                                                                <option disabled>Select City</option>
                                                                <c:forEach var="city" items="${cities}">
                                                                    <option value="${city.id}" ${customerOffice.geoFence.city eq city ?'selected':''}>${city.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-check">
                                                            <input class="form-check-input" value="true" name="geoFence.enabled" ${customerOffice.geoFence.enabled  ?'checked':''} type="checkbox" id="enabledCheck">
                                                            <label class="form-check-label" for="enabledCheck">Active</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
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
    var map;
    var marker;
    var markers = [];
    var circle;

    var circleObj = {
        raduis:"",
        latitude:"",
        longitude:""
    };

    function initMap() {
        map = new google.maps.Map(

        document.getElementById('map-plot'),{
            center : {
                lat : 33.682,
                lng : 73.052
            },
            zoom : 8
        });

        <c:if test="${not empty customerOffice.geoFence.latitude}">
            var latlng = new google.maps.LatLng(${customerOffice.geoFence.latitude}, ${customerOffice.geoFence.longitude});
            placeMarker(latlng, map);
        </c:if>

        map.addListener('click', function(e) {
            placeMarker( e.latLng, map);
        });

        var input = document.getElementById('searchLocation');
        var searchBox = new google.maps.places.SearchBox(input);
        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }
//            debugger;
//             console.log("Address: "+ places[0].address_components[0].long_name)
//             console.log("Address: "+ places[0].address_components[1].long_name)
//             console.log("Address: "+ places[0].address_components[2].long_name)
//             console.log("Address: "+ places[0].address_components[3].long_name)
//             console.log("Address: "+ places[0].address_components[4].long_name)
//             console.log("Address: "+ places[0].address_components[5].long_name)

            // Clear out the old markers.
            markers.forEach(function(marker) {
                marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });


        function placeMarker(location, map) {
            // Clear out the old markers.
            if (marker == null){
                marker = new google.maps.Marker({
                    position : location,
                    map : map
                });
                circleObj.raduis = 50;
            }else{
                marker.setMap(null);
                marker.setPosition(location);
                marker = null;
                circle.setMap(null);
                marker = new google.maps.Marker({
                    position : location,
                    map : map
                });

            }
            circleObj.latitude = marker.position.lat();
            circleObj.longitude = marker.position.lng();

            map.panTo(location);
            marker .addListener('click',function() {
                infowindow.open(map,marker);
            });

            var infowindow = new google.maps.InfoWindow(
                {
                    content : "<b>My Geofence Location</b>",
                    maxWidth : 200,
                    maxHeight : 200
                });
            // Add circle overlay and bind to marker
            circle = new google.maps.Circle(
                {
                    map : map,
                    radius : circleObj.raduis, //
                    fillColor : '#5589f7',
                    editable: false,
                    draggable: true
                });

            google.maps.event.addListener(circle, 'dragend', function(){
                // Polygon was dragged
                circleObj.latitude = marker.position.lat();
                circleObj.longitude = marker.position.lng();
                document
                    .getElementById('latitude').value = circleObj.latitude;
                document
                    .getElementById('longitude').value = circleObj.longitude;


                console.log("Gradd")
            });
            google.maps.event.addListener(circle, 'radius_changed', function () {
                console.log(circle.getRadius());
                circleObj.raduis = circle.getRadius();
            });


            circle.bindTo('center', marker,
                'position');
            document
                .getElementById('latitude').value = circleObj.latitude;
            document
                .getElementById('longitude').value = circleObj.longitude;

        }




    }
</script>


</body>

</html>
