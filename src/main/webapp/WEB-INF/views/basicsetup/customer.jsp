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
    <title>${edit eq true? 'Edit':'Create'} Customer :: Raseel</title>

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
                                    <h5 class="m-b-10">Raseel Customer</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="${contextPath}/customers">Raseel Customers</a></li>
                                    <li class="breadcrumb-item active">${edit eq true? 'Edit':'Create'} </li>
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
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5>${edit eq true? 'Edit':'Create'} Customer</h5>
                                    </div>
                                    <div class="card-block">
                                        <form action="${contextPath}/customer" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <input type="hidden" value="${customer.id}" name="id">
                                                    <input type="hidden" value="${customer.user.id}" name="user.id">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="customerName">Customer Name*</label>
                                                                <input name="customerName" value="${customer.customerName}" type="text" required class="form-control" id="customerName" placeholder="">
                                                            </div>
                                                        </div>
                                                         <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="customerName">Customer Arabic Name</label>
                                                                <input name="customerArabicName" value="${customer.customerArabicName}" type="text"  class="form-control" id="customerArabicName" placeholder="">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="customerAddress">Customer Address*</label>
                                                                <input name="customerAddress" value="${customer.customerAddress}" type="text" required class="form-control" id="customerAddress" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="customerArea">Customer Area*</label>
 															<select name="customerArea" class="form-control js-example-basic-single"  id="areas" required>
                                                                <option disabled>Select Areas</option>
                                                                <c:forEach var="area" items="${areas}">
                                                                    <option value="${area.id}" ${area.id == customer.customerArea.id ? 'selected' : ''}>${area.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                         <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="shippingLabelAddress">Shipping Label Address</label>
                                                                <input name="shippingLabelAddress" value="${customer.shippingLabelAddress}" type="text"  class="form-control" id="shippingLabelAddress" placeholder="">
                                                            </div>
                                                        </div>
                                                        
                                                          
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="companyWebsite">Company Website</label>
                                                                <input name="companyWebsite" value="${customer.companyWebsite}" type="text"  class="form-control" id="companyWebsite" placeholder="">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="invoiceType">Invoice Type*</label>
 															<select name="invoiceType" class="form-control js-example-basic-single"  id="invoiceType" required>
                                                                <option disabled>Select Invoice Type</option>
                                                                <c:forEach var="invoiceType" items="${invoiceTypes}">
                                                                    <option value="${invoiceType.id}" ${invoiceType.id == customer.invoiceType.id ? 'selected' : ''}>${invoiceType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                        
                                                         <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="ordersEnteredTillTime">Ordered can be entered Till* </label>
                                                                <input name="ordersEnteredTillTime" value="${not empty customer.ordersEnteredTillTime? customer.ordersEnteredTillTime:'12:00'}" type="time"  class="form-control" id="ordersEnteredTillTime" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="willBePickedUp">Will Be Picked Up*</label>
 															<select name="willBePickedUp" class="form-control js-example-basic-single"  id="willBePickedUp" required>
                                                                <option disabled>Select Type</option>
                                                                <c:forEach var="serviceType" items="${serviceTypes}">
                                                                    <option value="${serviceType.id}" ${serviceType.id == customer.willBePickedUp.id ? 'selected' : ''}>${serviceType.name}</option>
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
                                                                    <option value="${serviceType.id}" ${serviceType.id == customer.willBeDelivered.id ? 'selected' : ''}>${serviceType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                         <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="paymentType">Payment Type</label>
 															<select name="paymentType" class="form-control js-example-basic-single"  id="paymentType" required>
                                                                <option disabled>Select Payment Type</option>
                                                                <c:forEach var="paymentType" items="${paymentTypes}">
                                                                    <option value="${paymentType.id}" ${paymentType.id == customer.paymentType.id ? 'selected' : ''}>${paymentType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="contactFirstName">Contact First Name*</label>
                                                                <input name="contactFirstName" value="${customer.contactFirstName}" type="text" required class="form-control" id="contactFirstName" placeholder="">
                                                            </div>
                                                        </div>
                                                         <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="contactMiddleName">Contact Middle Name</label>
                                                                <input name="contactMiddleName" value="${customer.contactMiddleName}" type="text"  class="form-control" id="contactMiddleName" placeholder="">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="contactLastName">Contact Last Name*</label>
                                                                <input name="contactLastName" value="${customer.contactLastName}" type="text" required class="form-control" id="contactLastName" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="contactEmail">Contact Email*</label>
                                                                <input name="contactEmail" value="${customer.contactEmail}" type="text" required class="form-control" id="contactEmail" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="contactPhone">Contact Phone*</label>
                                                                <input name="contactPhone" value="${customer.contactPhone}" type="text" required class="form-control" id="contactPhone" placeholder="">
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="username">Login Name*</label>
                                                                <input name="user.username" value="${customer.user.username}" type="text" required class="form-control" id="username" placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="password">Password*</label>
                                                                <input name="user.password" value="${customer.user.password}" type="text" required class="form-control" id="password" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-check">
                                                                <input class="form-check-input" value="true" name="user.enabled" ${customer.user.enabled ? 'checked':''} type="checkbox" id="gridCheck1">
                                                                <label class="form-check-label" for="gridCheck1">Active</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary" title="" data-toggle="tooltip" data-original-title="Submit">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="customerName">Company Image*</label>
                                                                <input name="file" type="file" class="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">

                                                                <img src="${contextPath}/getCustomerImage?id=${customer.id}" onerror="this.style.display = 'none';" height="200px" width="200px">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </form>
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

<script src="../assets/plugins/select2/js/select2.full.min.js"></script>

<c:if test="${not empty param.msg}">
    <script>
        swal("${param.msg}","","${param.status}");
    </script>
</c:if>

</body>

</html>
