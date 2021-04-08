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
<title>Raseel Webhook</title>

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

	<!-- [ Header ] start -->
	<%-- 	<jsp:include page="../../templates/header.jsp"></jsp:include>
 --%>
	<!-- [ Header ] end -->


	<!-- [ Main Content ] start -->
	<!-- 	<div class="pcoded-main-container">
 -->
	<div class="pcoded-main">

		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<!-- [ breadcrumb ] start -->
					<!-- 	<div class="page-header">
						<div class="page-block">
							<div class="row align-items-center">
								<div class="col-md-12">
									<div class="page-header-title">
										<h5 class="m-b-10">Raseel Webhook</h5>
									</div>
								</div>
							</div>
						</div>
					</div> -->
					<!-- [ breadcrumb ] end -->
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">
								<!-- [ sample-page ] start -->
								<div class="col-sm-12">
									<div class="card">
										<div class="card-header">
											<h4>Using Raseel Webhooks</h4>



										</div>
										<div class="card-block">

											<p>Webhooks are a way for client web apps to get
												real-time messages when there are Status changes in Raseel.</p>
											<p>Once you register a URI to receive webhooks, Raseel
												will send an HTTP request to that URI every time there's a
												change for the registered clients.</p>
											<p>In this tutorial, we'll walk through a very simple
												example of how to setup your own webhook and start receiving
												messages.</p>
											<h5 class="toc-el" id="verification"
												title="Verification request">The verification request</h5>
											<p>
												To set up a new webhook, find your app in the <a
													href="/underConstruction">App Console</a>, and add the full
												URI for your webhook in the "Webhooks" section. Note that
												the URI needs to be one publicly accessible over the
												internet. For example,
												<code>127.0.0.1</code>
												and
												<code>localhost</code>
												URIs will not work, since Raseel's servers will not be able
												to contact your local computer.
											</p>
											<p>
												Once you enter your webhook URI, an initial verification
												request will be made to that URI. This verification is an
												HTTP
												<code>GET</code>
												request with a query parameter called
												<code>verify</code>
												. Your app needs to respond by echoing back that
												<code>verify</code>
												parameter. In order to avoid introducing a reflected XSS
												vulnerability, set the following headers in your response to
												the verification request:
											</p>
											<pre
												class="dbprettyprint literal-block prettyprint lang-None">response.setHeader("Content-Type", "text/plain");
response.setHeader("X-Content-Type-Options", "nosniff");
</pre>
											<p>The purpose of this verification request is to
												demonstrate that your app really does want to receive
												messages at that URI. If you accidentally entered the wrong
												URI (or if someone maliciously entered your server as their
												webhook), your app would fail to respond correctly to the
												challenge request, and Raseel would not send any messages to
												that URI.</p>
											<p>The following is Java code (Using the Spring Boot)
												that responds correctly to a verification request:</p>
											<pre
												class="dbprettyprint literal-block prettyprint lang-None">@GetMapping(value="webhook")
public ResponseEntity<String> webHookTest(HttpServletRequest request, HttpServletResponse response) {
		
	String verify  =  request.getParameter("verify")!=null? request.getParameter("verify") : "";
		
	response.setHeader("Content-Type", "text/plain");
	response.setHeader("X-Content-Type-Options", "nosniff");
	response.setHeader("verify", verify);
	
	return new ResponseEntity<String>(verify, HttpStatus.OK);
}

											</pre>
											<p>If your app responds correctly to the 'verify'
												request, Raseel will start sending messages to your webhook
												URI every time one of your shipment status changes. If your
												app fails to respond correctly, you'll see an error message
												in the App Console.</p>
											<h5 class="toc-el" id="notifications" title="Notifications">Receiving
												Messages</h5>
											<p>
												Once your webhook URI is added, your app will start
												receiving
												<code>Messages</code>
												every time a user's shipment status changes. A message
												request is an HTTP
												<code>POST</code>
												request with a x-www-form-urlencoded body. The form will
												contain the key 'message' with a JSON value which has the
												following format:
											</p>
											<pre
												class="dbprettyprint literal-block prettyprint lang-None">{
  "event": "status",
  "version": 1.1,
  "timestamp": "2014-06-25T00:00:00.000Z",
  "shipment": {
    "id": 12345,
    "customer": "John Doe",
    "action": "Delivered"
  }
}
</pre>

											<p>Below is Java code (again using Spring Boot) that
												validates a message request.</p>
											<pre
												class="dbprettyprint literal-block prettyprint lang-None">@PostMapping(value = "webhook")
public ResponseEntity<String> getFileData(HttpServletRequest request, HttpServletResponse response) {

	MessageBody messageBody = gson.fromJson(request.getParameter("message"), MessageBody.class);
	/*
	 * To make sure you can always respond within ten seconds to Raseel, you should
	 * always do your work on a separate thread (as in the simple example above) or
	 * asynchronously using a queue.
	 */		
	 return new ResponseEntity<String>("Received", HttpStatus.OK);
}

											</pre>


											<h6>Always respond to webhooks quickly</h6>
											<p>Your app only has ten seconds to respond to webhook
												requests. For the verification request, this is never really
												an issue, since your app doesn't need to do any real work to
												respond. For message requests, however, your app will
												usually do something that takes time in response to the
												request.</p>
											<p>To make sure you can always respond within ten
												seconds, you should always do your work on a separate thread
												(as in the simple example above) or asynchronously using a
												queue.</p>

										</div>
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

</body>

</html>
