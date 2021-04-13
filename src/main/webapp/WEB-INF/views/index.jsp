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

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/hananscripts/bootstrap.css">

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
	margin-top: 5px;
	background-color: #FF7361;
	font-size: 14px;
	padding: 5px 10px 5px 10px;
	border: none;
	color: #fff;
}
</style>

</head>
<body class="body">
  <!-- Modal -->
  <div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit post</h4>
        </div>
        <div class="modal-body">
        <input type="hidden" id="postIdModal">
        <input id='postTopicModal' style="height: 25px; width: 30%"
				placeholder="please type your post topic here..." /> <input
				id='postMessageModal' style="height: 25px; width: 80%"
				placeholder="please type your post message here..." />
				<br>
			<button id="postsubmitModal" class="buttonCustom" onclick="updatePost();">Update</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

	<div class="loginDiv" id="loginDiv" class="page" align="center">
		<h4 style="color: white">Please choose a name</h4>
		<input type="text" id="username" name="name"
			placeholder="Enter your name..." /> <br> <input
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
			<button id="refresh" class="buttonCustom" onclick="pullPosts();">Refresh</button>
		</div>
		<div class="newPostList" id="newPostList">

		</div>
	</div>

	<script src="${contextPath}/resources/hananscripts/jquery-1.8.2.js"></script>
	<script src="${contextPath}/resources/hananscripts/bootstrap.min.js"></script>

 <script type="text/javascript">
	$(document).ready(function () {
		  if(sessionStorage.getItem('userID') != null){
			  var user = sessionStorage.getItem('userID');
					$.ajax({
						type : 'POST',
						url : 'user/check',
						data : {
							userId : user
						},
						success : function(data) {
							
							var user = data.user;
							
							sessionStorage.setItem("userID", user.id);
							sessionStorage.setItem("name", user.username);
							sessionStorage.setItem("avatarUrl", user.avatarUrl);

							$("#loginDiv").css('display', "none");

							$("#welcomeName")
									.html("Welcome " + user.username + "!");
							$("#postDiv").css('display', "block");
							
							pullPosts();
							//setUpUserConnection();
						}
					});
				}
		  });
	
		function showUpdatePostModal(postid, posttopic ,postmessage){
			
			 $('#postIdModal').val(postid);
			 $('#postTopicModal').val(posttopic);
			 $('#postMessageModal').val(postmessage);
			 
			 $('#editModal').modal('show');
			
		}
		
		function updatePost(){
			
			var postid = $('#postIdModal').val();
			var postTopic = $('#postTopicModal').val();
			var postMessage = $('#postMessageModal').val();
			
			if (!postid || postid.length === 0) {
				
			} else if (!postTopic || postTopic.length === 0) {
				alert("Post topic can not be empty!");
			} else if (!postMessage || postMessage.length === 0) {
				var postmessage = $("#postmessage").val();
			} else {
				
				$.ajax({
					type : 'PUT',
					url : 'message/update',
					data : {
						userId : sessionStorage.getItem("userID"),
						postId : postid,
						topic : postTopic,
						message : postMessage	
					},
					success : function(data) {
						var post = data.post;
						$("#postno"+postid).html("<div class='col-md-1'><div><a href='#'><img src='https://image.flaticon.com/icons/png/512/147/147144.png' alt='image' style='height: 40px;vertical-align:middle'>"
								+"</a><span>&nbsp; "+post.userName+"</span>"
								+"</div></div><div class='col-md-9'><div><div><h3>"+post.topic+"</h3></div><div><p>"+post.message+"</p></div></div><hr>"
								+"</div><div class='col-md-2'><div><a href='#'><button type='button' class='buttonCustom' onclick=\"showUpdatePostModal("+post.id+",'"+post.topic+"','"+post.message+"');\"><i class='fa fa-comment' aria-hidden='true'>Edit</i>"
								+"</button></a> <a href='#'><button type='button' class='buttonCustom' onclick='deletePost("+post.id+");'><i class='fa fa-user-circle-o' aria-hidden='true'>Delete</i>"
								+"</button></a> <span>"+post.dateTime+"</span></div></div>");
					},
					error : function(xhr, status, error) {
						var data = JSON.parse(xhr.responseText);
						alert("Status: " + data.returnCode + " : "
								+ data.message);
					}
				});
				
				$('#editModal').modal('hide');
			}
		}
	
		function deletePost(postid){
			
			$.ajax({
				type : 'DELETE',
				url : 'message/delete',
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
						prependToPostList(post);
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
					url : 'user/create',
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
						
						pullPosts();
						//setUpUserConnection();

					},
					error : function(xhr, status, error) {
						var data = JSON.parse(xhr.responseText);
						alert("Status: " + data.returnCode + " : "
								+ data.message);
					}
				});
			}
		}
		
		function pullPosts(){
			$.ajax({
				type : 'GET',
				url : 'message/view',
				success : function(data) {
					$("#newPostList").html("");
					var posts = data;
					for (i = 0; i < posts.length; i++) {						
						prependToPostList(posts[i]);
					}
				}
			});
			
			setTimeout(pullPosts, 3000);
		}
		
		function prependToPostList(post){
			
			var user = sessionStorage.getItem('userID');

			if(user == post.userId){
				$("#newPostList").prepend("<div class='row' id='postno"+post.id+"' style='padding:20px; margin-top: 10px; background-color: #af9f73c4'><div class='col-md-1'><div><a href='#'><img src='https://image.flaticon.com/icons/png/512/147/147144.png' alt='image' style='height: 40px;vertical-align:middle'>"
						+"</a><span>&nbsp; "+post.userName+"</span>"
						+"</div></div><div class='col-md-9'><div><div><h3>"+post.topic+"</h3></div><div><p>"+post.message+"</p></div></div><hr>"
						+"</div><div class='col-md-2'><div><a href='#'><button type='button' class='buttonCustom' onclick=\"showUpdatePostModal("+post.id+",'"+post.topic+"','"+post.message+"');\"><i class='fa fa-comment' aria-hidden='true'>Edit</i>"
						+"</button></a> <a href='#'><button type='button' class='buttonCustom' onclick='deletePost("+post.id+");'><i class='fa fa-user-circle-o' aria-hidden='true'>Delete</i>"
						+"</button></a> <span>"+post.dateTime+"</span></div></div></div>");
			}else{
				$("#newPostList").prepend("<div class='row' id='postno"+post.id+"' style='padding:20px; margin-top: 10px; background-color: #af9f73c4'><div class='col-md-1'><div><a href='#'><img src='https://image.flaticon.com/icons/png/512/147/147144.png' alt='image' style='height: 40px;vertical-align:middle'>"
						+"</a><span>&nbsp; "+post.userName+"</span>"
						+"</div></div><div class='col-md-9'><div><div><h3>"+post.topic+"</h3></div><div><p>"+post.message+"</p></div></div><hr>"
						+"</div><div class='col-md-2'><div><span>"+post.dateTime+"</span></div></div></div>");
			}
		}
		
 </script>
</body>
</html>