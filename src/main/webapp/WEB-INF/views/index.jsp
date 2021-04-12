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
	background-size: contain;
}

.loginDiv {
	margin-top: 50px;
}

.newPostList {
	padding: 15px;
	box-shadow: 0px 0px 13px -3px #777;
}

.welcomeDiv {
	background-color: #53a0d6c4;
	opacity: 95%; margin-bottom : 20px;
	padding: 15px;
	box-shadow: 0px 0px 13px -3px #777;
	margin-bottom: 20px;
}

.buttonCustom {
	margin-top: 23px;
	background-color: #FF7361;
	font-size: 14px;
	padding: 5px 10px 5px 10px;
	border: none;
	color: #fff;
}
</style>

</head>
<body class="body">

	<div class="loginDiv" id="loginDiv" class="page" align="center">
		<h4 style="color: white">Please choose a name</h4>
		<input type="text" id="username" name="name"
			placeholder="Enter your name..." /> <br> <br> <input
			type="text" id="avatarUrl" name="avatarUrl"
			placeholder="Enter Avatar Url..." /> <br>
		<button id="login" class="buttonCustom" onclick="createUser();">Done</button>
	</div>

	<div id="postDiv" class="page" style="display: none;">
		<div class="row welcomeDiv">
			<h3 id='welcomeName' style="color: white">Welcome!</h3>
			<input id='posttopic' style="height: 25px; width: 30%"
				placeholder="please type your post topic here..." /> <input
				id='postmessage' style="height: 25px; width: 80%"
				placeholder="please type your post message here..." />
			<button id="postsubmit" class="buttonCustom" onclick="createPost();">Post</button>
		</div>
		<div class="newPostList" id="newPostList">

		</div>
	</div>

	<script src="${contextPath}/resources/hananscripts/jquery-1.8.2.js"></script>

	<script type="text/javascript">
	
		function updatePost(postid){
			
			$.ajax({
				type : 'DELETE',
				url : 'message/create',
				data : {
					userId : sessionStorage.getItem("userID"),
					postId : postid
				},
				success : function(data) {
					$("#postno"+postid).remove();
				},
				error : function(xhr, status, error) {
					var data = JSON.parse(xhr.responseText);
					alert("Status: " + data.returnCode + " : "
							+ data.message);
				}
			});
		}
	
		function deletePost(postid){
			
			$.ajax({
				type : 'DELETE',
				url : 'message/create',
				data : {
					userId : sessionStorage.getItem("userID"),
					postId : postid
				},
				success : function(data) {
					$("#postno"+postid).remove();
				},
				error : function(xhr, status, error) {
					var data = JSON.parse(xhr.responseText);
					alert("Status: " + data.returnCode + " : "
							+ data.message);
				}
			});
		}
		
		function createPost() {

			var posttopic = $("#posttopic").val();
			var postmessage = $("#postmessage").val();

			if (!posttopic || posttopic.length === 0) {
				alert("Post topic can not be empty!");
			} else if (!postmessage || postmessage.length === 0) {
				alert("Post message can not be empty!");
			} else {
				$.ajax({
					type : 'POST',
					url : 'message/create',
					data : {
						userId : sessionStorage.getItem("userID"),
						userName : sessionStorage.getItem("name"),
						topic : posttopic,
						message : postmessage
					},
					success : function(data) {
						
						var post = data.post;
						
						// Now that we have the Post object lets append the post in the div
						$("#newPostList").prepend("<div class='row' id='postno"+post.id+"' style='padding:20px; margin-top: 10px; background-color: #af9f73c4'><div class='col-md-1'><div><a href='#'><img src='https://image.flaticon.com/icons/png/512/147/147144.png' alt='image' style='height: 40px;vertical-align:middle'>"
						+"</a><span>&nbsp; "+post.userName+"</span>"
						+"</div></div><div class='col-md-9'><div><div><h3>"+post.topic+"</h3></div><div><p>"+post.message+"</p></div></div><hr>"
						+"</div><div class='col-md-2'><div><a href='#'><button type='button' class='buttonCustom'><i class='fa fa-comment' aria-hidden='true'>Edit</i>"
						+"</button></a> <a href='#'><button type='button' class='buttonCustom' onclick='deletePost("+post.id+");'><i class='fa fa-user-circle-o' aria-hidden='true'>Delete</i>"
						+"</button></a> <span>"+post.dateTime+"</span></div></div></div>");

					},
					error : function(xhr, status, error) {
						var data = JSON.parse(xhr.responseText);
						alert("Status: " + data.returnCode + " : "
								+ data.message);
					}
				});
			}
		}

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
						alert("Status: " + data.returnCode + " : "
								+ data.message);
						var user = data.user;
						// Now that we have the user object, lets save its Id in the browser cache
						// Then we will hide the login section and show the Message Board Section

						sessionStorage.setItem("userID", user.id);
						sessionStorage.setItem("name", user.username);
						sessionStorage.setItem("avatarUrl", user.avatarUrl);

						$("#loginDiv").css('display', "none");

						$("#welcomeName")
								.html("Welcome " + user.username + "!");
						$("#postDiv").css('display', "block");

						/* localStorage.setItem("time", "123");
						localStorage.setItem("userID", user.id);
						localStorage.setItem("name", user.username);
						 */
					},
					error : function(xhr, status, error) {
						var data = JSON.parse(xhr.responseText);
						alert("Status: " + data.returnCode + " : "
								+ data.message);
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