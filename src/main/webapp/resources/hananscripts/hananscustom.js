var websocketconnection=null;
	/* 	function setUpUserConnection(){
			
			var user = sessionStorage.getItem('userID');
			websocketconnection = new WebSocket("wss://" + document.location.host+ "/signalingserver/" + user);
			
			//WebSocket Communication with Signalling Server
			//Handle all messages through this callback
			websocketconnection.onmessage = function(message) {
				console.log("Got message", message.data);
				var data = JSON.parse(message.data);
				switch (data.type) {
				case "login":
					console.log("Success full socket communication.");
					break;
				case "refresh":
					pullPosts();
					break;
				default:
					break;
				}
			};

			websocketconnection.onopen = function() {
				console.log("Connected");
				if (name.length > 0) {
					websocketconnection.send(JSON.stringify({
						type : "login",
						name : sessionStorage.getItem("name")
					}));
				}
			};

			websocketconnection.onerror = function(err) {
				console.log("Got error", err);
			};
		} */
