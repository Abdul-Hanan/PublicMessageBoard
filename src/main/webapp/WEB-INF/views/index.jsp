<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<META HTTP-EQUIV="max-age" CONTENT="86400">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="Public">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="hanan">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<style>
.body {
	background: url('${contextPath}/resources/icons/background.jpeg'); "
	background-repeat: no-repeat;
	background-size: cover;
}

.loginDiv {
	margin-top: 50px;
}
</style>

</head>
<body class="body">

	<div class="loginDiv" id="login-page" class="page" align="center">
		<h4 style="color: white">Please choose a name</h4>
		<input type="text" id="username" name="name"
			placeholder="Enter your name..." /> <br> <input type="text"
			id="avatarUrl" name="avatarUrl" placeholder="Enter Avatar Url..." />
		<button id="login" onclick="createUser();">Done</button>
	</div>

	<div id="call-page" class="page" style="display: none;">

		<audio id="yours" autoplay muted></audio>
		<audio id="theirs" autoplay></audio>
		<input type="text" id="theirusername" />
		<button id="call">Call</button>
		<button id="hang-up">Hang Up</button>
	</div>

	<script src="${contextPath}/resources/hananscripts/jquery-1.8.2.js"></script>

	<script type="text/javascript">
		function createUser() {
			var username = $("#username").val();
			//var avatarUrl = $("#avatarUrl").val();

			if (!username || username.length === 0) {
				alert("Username can not be empty!");
			} else {
				$.ajax({
					type : 'POST',
					url : 'rest/user/create',
					data : {
						name : username,
						avatarUrl : 'nothing'
					},
					success : function(data) {
						alert("status:" + data.returnCode + ": " + data.message);
					},
					error : function(xhr, status, error) {
						  var err = eval("(" + xhr.responseText + ")");
						  alert(err.Message);
					}
				});
			}
		}
	</script>

	<%-- 	<script src="${contextPath}/resources/webrtclibs/sswsNew.js"></script>
 --%>
	<!--  
 // Ok so Now On Login press i will hide the Login name section
 //	Redis will store this username and a id will be send back in the session and that id will be sent on every request
 
 // The below section will Appear with Title, Message and Submit button
 //	When the Title is entered with Message and submit is pressed will check that they are not empty
 // Then the message will be send via AJAX and saved in the Redis
 // The Message should also have small icons of edit and delete. 
 
 
 // Web sockets
 // The login to the websocket will be with this username
 // Then the Websocket code will send this message to all logged in users as a update to append.
 
 -->

</body>
</html>