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

<body> <!-- [ Pre-loader ] start -->
<div class="loader-bg">
<%--    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>--%>
    <img src="${contextPath}/assets/images/pre-loader.gif" style="display: block;margin-left: auto;margin-right: auto;width: 40%;" align="middle">
</div>
<!-- [ Pre-loader ] End -->
<!-- [ Pre-loader ] start -->
<%--<div class="loader-bg">
    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>
</div>--%>
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
                                    <h5 class="m-b-10">Check Permissions</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                    <%--<li class="breadcrumb-item"><a href="#!">Layout</a></li>--%>
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
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5>Check Permission</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <form action="/checkPermissionss" method="get">
                                                    <div class="input-group">
                                                        <select name="roleId" class="custom-select" id="inputGroupSelect04">
                                                            <option selected disabled>Choose...</option>
                                                            <c:forEach varStatus="loop" var="role" items="${roles}">
                                                                <option value="${role.id}" ${param.roleId eq role.id ? 'selected':''}>${role.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-primary" type="submit">Get Permissions</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <c:if test="${not empty param.roleId }">
                                                <div class="col-md-12">
                                                    <form action="/checkPermissionss" method="post">
                                                        <input type="hidden" name="roleId" value="${param.roleId}">
                                                        <hr>
                                                        <button type="submit" class="btn btn-primary right">Save Changes</button>
                                                        <div class="card-block table-border-style">
                                                            <div class="table-responsive">
                                                                <table class="table table-hover">
                                                                    <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Permission</th>
                                                                        <th>Permission Description</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach varStatus="loop" items="${Permissionss}" var="permissions">
                                                                        <c:set var="checked" value="false"/>
                                                                        <c:forEach items="${role.permissions}" var="permission">
                                                                            <c:if test="${permission eq permissions}">
                                                                                <c:set var="checked" value="true"/>
                                                                            </c:if>
                                                                        </c:forEach>

                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <input value="${permissions.id}" ${checked eq true ? 'checked':''} name="permissions" class="form-check-input" type="checkbox" id="gridCheck">
                                                                                    <label class="form-check-label" for="gridCheck"></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>${permissions.name}</td>
                                                                            <td>${permissions.description}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
<script src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/assets/js/pcoded.min.js"></script>
<script src="${contextPath}/assets/plugins/sweetalert/js/sweetalert.min.js"></script>

<c:if test="${param.msg eq 'success'}">
    <script>
        swal("Permission has been assigned to role");
    </script>
</c:if>

</body>

<head>
    <title>Role & Permission</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicon icon -->
    <link rel="icon" href="${contextPath}/assets/images/favicon.ico" type="image/x-icon">
    <!-- fontawesome icon -->
    <link rel="stylesheet" href="${contextPath}/assets/fonts/fontawesome/css/fontawesome-all.min.css">
    <!-- animation css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/animation/css/animate.min.css">
    <!-- prism css -->
    <link rel="stylesheet" href="${contextPath}/assets/plugins/prism/css/prism.min.css">
    <!-- vendor css -->
    <link rel="stylesheet" href="${contextPath}/assets/css/style.css">

</head>
</html>
