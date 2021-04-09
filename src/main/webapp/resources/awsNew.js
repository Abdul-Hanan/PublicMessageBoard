///////// Signaling Server Variables ////////////
var name = document.querySelector('#username').value;
var heartbeat_interval = null, missed_heartbeats = 0;
var websocketconnection = new WebSocket("wss://" + document.location.host
		+ "/signalingserver/" + name);

///////// Video Elements and Streams and Peer Connections ///////////
var myVideo = document.querySelector('#yours');
var theirVideo = document.querySelector('#theirs');
var myconnection;
var datachannel;
var connectedUser;
var remotestream;

var hangupbuttonclick = 0;
////////// Rating Variables ///////////
var countofSilver=0;
var countofGold=0;
var countofPlatinum=0;

/////////// Other Variables ///////////
var theirUsernameInput = document.querySelector('#theirusername');

var loginPage = document.querySelector('#login-page');
var usernameInput = document.querySelector('#username');
var loginButton = document.querySelector('#login');
var callPage = document.querySelector('#call-page');
var callButton = document.querySelector('#call');
var hangUpButton = document.querySelector('#hang-up');
var sendButton = document.querySelector('#sendd');
var sendLike = document.querySelector('#senddLike');
var turnMicroPhoneOn = document.querySelector('#turnMicroPhoneOn');
var microphonetext = document.querySelector('#microphonetext');
var cutoffval = document.querySelector('#cutoffval');
var meter = document.querySelector('#meter');
var formulatednumber=document.querySelector('#formulatednumber');
var sendGold = document.querySelector('#senddgold');
var sendPlatinum = document.querySelector('#senddplatinum');
var bluetoothOn = document.querySelector('#bluetoothOn');
var bluetoothOff = document.querySelector('#bluetoothOff');
var waitingmusic = document.querySelector('#waitingmusic');

///////////	WebSocket Communication with Signalling Server ///////////////
//Handle all messages through this callback
websocketconnection.onmessage = function(message) {
	console.log("Got message", message.data);
	var data = JSON.parse(message.data);
	switch (data.type) {
	case "login":
		onLogin(data.success);
		break;
	case "offer":
		//onOffer(data.offer, data.name);
		break;
	case "answer":
		logMessage("Answer received from Mobile Device");
		onAnswer(data.answer);
		break;
	case "candidate":
		logMessage("Candidate received from Mobile Device");
		onCandidate(data.candidate);
		break;
	case "leave":
		onLeave();
		break;
	default:
		break;
	}
};

websocketconnection.onopen = function() {
	console.log("Connected");
	if (name.length > 0) {
		send({
			type : "login",
			name : name
		});
	}
};

websocketconnection.onerror = function(err) {
	console.log("Got error", err);
};

callButton.addEventListener("click", function() {
	var theirUsername = theirUsernameInput.value;
	if (theirUsername.length > 0) {
		startPeerConnection(theirUsername);
	}

});

//Login when the user clicks the button
loginButton.addEventListener("click", function(event) {
	name = usernameInput.value;
	if (name.length > 0) {
		send({
			type : "login",
			name : name
		});
	}
});

callPage.style.display = "none";

setTimeout(function() {
	callButton.click();
}, 3000);

//Alias for sending messages in JSON format
function send(message) {
	if (connectedUser) {
		message.name = connectedUser;
	}
	websocketconnection.send(JSON.stringify(message));
};

function onLogin(success) {
	if (success === false) {
		alert("Login unsuccessful, please try a different name.");
	} else {
		// Get the plumbing ready for a call
		startConnection();
	}
};

hangUpButton.addEventListener("click", function() {
	
	
	logMessage("Hang Up Button clicked");
	hangupbuttonclick=1;

	send({
		type : "leave"
	});
	
	onLeave();
});

function onLeave() {
	if (typeof logid !== 'undefined') {
	    // the variable is defined
	
	if(logid!=null){
		if(logid!="0"){
			$.ajax({
				type : "GET",
				url : "addWebRTCCallLogend",
			    cache: false,
				data :{
					logid : logid,
					hangup : "true"
					
				},
				success : function(response) {
					console.log("Call end Log Entered : "+response);
				}
			});	
		}
	}
	}
	connectedUser = null;
	theirVideo.src = null;
	myconnection.close();
	myconnection.onicecandidate = null;
	myconnection.onaddstream = null;
	setTimeout(CloseBrowser, 1500);
}
////////////////////////////////////////////////////////////
///////////	WEBRTC core///////////////
function startPeerConnection(user) {
	connectedUser = user;
	logMessage("Sending Offer to Mobile Device");
	// Begin the offer
	myconnection.createOffer(function(offer) {
		send({
			type : "offer",
			offer : offer
		});
		myconnection.setLocalDescription(offer);
	}, function(error) {
		logMessage("Error while sending Offer to Mobile Device");
		alert("An error has occurred.");
	});
};

function startConnection() {
	
	navigator.mediaDevices.getUserMedia({ audio: true, video: false })
	.then(function(mylocalstream) {
		myVideo.srcObject = mylocalstream;
		remotestream = new MediaStream();
		theirVideo.srcObject = remotestream;
		if (hasRTCPeerConnection()) {
			setupPeerConnection(mylocalstream);
		} else {
			console.log("Sorry, your browser does not support WebRTC...");
		}
		myVideo.onloadedmetadata = function(e) {
			myVideo.play();
		};
	})
	.catch(function(err) {
	  console.log(err.name + ": " + err.message);
	});
}

function hasRTCPeerConnection() {
	window.RTCPeerConnection = window.RTCPeerConnection
			|| window.webkitRTCPeerConnection || window.mozRTCPeerConnection;
	window.RTCSessionDescription = window.RTCSessionDescription
			|| window.webkitRTCSessionDescription
			|| window.mozRTCSessionDescription;
	window.RTCIceCandidate = window.RTCIceCandidate
			|| window.webkitRTCIceCandidate || window.mozRTCIceCandidate;
	return !!window.RTCPeerConnection;
}

function setupPeerConnection(mylocalstream) {
	
//	var configuration = {
//			"iceServers" : [ {
//				"urls" : "stun:stun1.l.google.com:19302"
//			}, {
//				"urls" : "stun:stun2.l.google.com:19302"
//			}, {
//				"urls" : 'stun:numb.viagenie.ca',
//			}, {
//				"urls" : 'turn:numb.viagenie.ca',
//				"username" : 'kool_virgo14@hotmail.com',
//				"credential" : 'letssleep'
//			}, {
//				"urls" : 'turn:numb.viagenie.ca',
//				"username" : 'hananashraf76@gmail.com',
//				"credential" : 'letmepass'
//			} ]
//		};
	
	myconnection = new RTCPeerConnection({
		iceServers: [{urls: [ "stun:e2.xirsys.com" ]},
			{username: "1f50e142-dd04-11e8-87d3-5bb9a55d8a5a",
			credential: "1f50e228-dd04-11e8-a5d4-c71e6db8ad37",
			urls: ["turn:e2.xirsys.com:80?transport=udp",
				"turn:e2.xirsys.com:3478?transport=udp",
				"turn:e2.xirsys.com:80?transport=tcp",
				"turn:e2.xirsys.com:3478?transport=tcp",
				"turns:e2.xirsys.com:443?transport=tcp",
				"turns:e2.xirsys.com:5349?transport=tcp"]}]
		});
	
	//myconnection = new RTCPeerConnection(configuration);
	// Add Your Stream to Your Connection
	mylocalstream.getTracks().forEach(track => {
		myconnection.addTrack(track, mylocalstream);
	});
	
	myconnection.ontrack = function(event) {
		console.log(event);
		console.log('got track', event.track, event.streams);
		try {
			theirVideo.srcObject = event.streams[0];
			////////////Send Stream to Hark/////////////
			var options = {};
			//Error in On Track: 
			//TypeError: Failed to execute 'addTrack' on 'MediaStream':
			// parameter 1 is not of type 'MediaStreamTrack'
			const mediaStream = new MediaStream();
			mediaStream.addTrack(event.track);
			
			var speechEvents = hark(mediaStream, options);
			
			speechEvents.on('speaking', function() {
				document.querySelector('#speakingSpan').innerHTML="Speaking";
			  console.log('speaking');
			});

			speechEvents.on('stopped_speaking', function() {
				document.querySelector('#speakingSpan').innerHTML="Not Speaking";

			  console.log('stopped_speaking');
			});
			
			speechEvents.on('volume_change', function(volume) {
				 // Speed
			      var point,
			          newVal,
			          inc;

			      if (chartSpeed) {
			          point = chartSpeed.series[0].points[0];
			          inc = Math.round(volume);
			          inc = inc + 107;
			          if(inc<0){
			        	  inc=0;
			          }
			          point.update(inc);
			      }
			});
			
			if (typeof logid !== 'undefined') {
			    // the variable is defined
				if(logid!=null){
					if(logid!="0"){
						$.ajax({
							type : "GET",
							url : "addWebRTCCallLogestablished",
						    cache: false,
							data :{
								logid : logid
							},
							success : function(response) {
								console.log("Establish Log Entered : "+response);
							}
						});	
					}
				}
			}
			
			
		} catch (error) {
			console.log("Error in On Track: "+error);
			//theirVideo.srcObject = event.streams;
		}
	};


	// Setup ice handling
	myconnection.onicecandidate = function(event) {
		if (event.candidate) {
			send({
				type : "candidate",
				candidate : event.candidate
			});
		}
	};
	
	myconnection.oniceconnectionstatechange = function() {
		if (myconnection.iceConnectionState === "disconnected") {
			
			console.log("Connection State :" + myconnection.iceConnectionState);			
			logMessage("Connection State :" + myconnection.iceConnectionState);

		}else if(myconnection.iceConnectionState === "failed" ){
			
			logMessage("Connection State :" + myconnection.iceConnectionState);

			if (typeof logid !== 'undefined') {
			    // the variable is defined
			if(logid!=null){
				if(logid!="0"){
					$.ajax({
						type : "GET",
						url : "addWebRTCCallLogfailed",
					    cache: false,
						data :{
							logid : logid
						},
						success : function(response) {
							console.log("Call fail Log Entered : "+response);
						}
					});	
				}
			}
			}
			
			console.log("Connection State :" + myconnection.iceConnectionState );
				alert("Call Disconnected: The user either loged out or lost connection.");
		}
	}
	myconnection.ondatachannel = function(event) {
		var receiveChannel = event.channel;
		receiveChannel.onmessage = function(event) {
			console.log("ondatachannel message:", event.data);
			if(event.data == "Bluetooth connected"){
				bluetoothOff.style.display = "none";
				bluetoothOn.style.display = "block";

			}else if(event.data == "Bluetooth Not connected"){
				bluetoothOn.style.display = "none";
				bluetoothOff.style.display = "block";
			}
		};
	};
	openDataChannel();
}

function onAnswer(answer) {
	myconnection.setRemoteDescription(new RTCSessionDescription(answer));
}
function onCandidate(candidate) {
	myconnection.addIceCandidate(new RTCIceCandidate(candidate));
}

function CloseBrowser() {
	location.reload();
}

function openDataChannel() {
	console.log("Start Opening Data Channel");

	var dataChannelOptions = {
		reliable : true
	};
	
	dataChannel = myconnection.createDataChannel("myLabel",
			dataChannelOptions);
	
	dataChannel.onerror = function(error) {	
		console.log("Data Channel Error:", error);

		if(hangupbuttonclick==0){
			
			var myString ="";
			$.each(error, function(key, value) {
			    console.log(key, value);
			    myString += ", "+key+" : " + value;
			});

			logMessage("Data Channel Error:"+ myString);
		}
	};

	dataChannel.onopen = function() {
		
		console.log("Data Channel Open");
		
		document.getElementById("removeloading").remove();
		waitingmusic.pause();
		waitingmusic.currentTime = 0;
		
		dataChannel.send("pullbluetooth");
		
		logMessage("Data Channel Opened");

	};
	
	dataChannel.onclose = function() {
		console.log("Data Channel Closed");
		
		logMessage("Data Channel Closed");
	};
}

sendButton.addEventListener("click", function(event) {
	var val = "Good job!";
	// alert(val);
	var texttosend = document.querySelector('#texttosend').value;
	
	dataChannel.send("" + texttosend);
	document.querySelector('#texttosend').value="";
});
// Treating as Silver
sendLike.addEventListener("click", function(event) {
	var texttosend = "good+";
	dataChannel.send("" + texttosend);
	
	countofSilver++;
	document.querySelector('#countofSilver').innerHTML=countofSilver+"";
	document.querySelector('#texttosend').value="";
});
sendGold.addEventListener("click", function(event) {
	var texttosend = "gold+";
	dataChannel.send("" + texttosend);

	countofGold++;

	document.querySelector('#countofGold').innerHTML=countofGold+"";
	document.querySelector('#texttosend').value="";
});
sendPlatinum.addEventListener("click", function(event) {
	var texttosend = "platinum+";
	dataChannel.send("" + texttosend);

	countofPlatinum++;
	document.querySelector('#countofPlatinum').innerHTML=countofPlatinum+"";
	document.querySelector('#texttosend').value="";
});
var isMicrophoneOn=false;
turnMicroPhoneOn.addEventListener("click", function(event) {
	var texttosend="";
	if(isMicrophoneOn){
		isMicrophoneOn=false;
		texttosend = "stoptalk+";
		document.getElementById("microphonetext").innerHTML="Turn Microphone On";
	}else{
		isMicrophoneOn=true;
		texttosend = "talk+";
		document.getElementById("microphonetext").innerHTML="Turn Microphone Off";
	}
	dataChannel.send("" + texttosend);
	document.querySelector('#texttosend').value="";
});


///////////////////LOGGING WORK AJAX////////////////////////////
function logMessage(message) {

	if (typeof logid !== 'undefined') {
	    // the variable is defined
		if(logid!=null){
			if(logid!="0"){
				$.ajax({
					type : "GET",
					url : "addWebRTCCallLogmsgs",
				    cache: false,
					data :{
						logid : logid,
						msg : message
					},
					success : function(response) {
						console.log("Call end Log Entered : "+response);
					}
				});	
			}
		}
	}
}

//////////////////Chart Work///////////////////////
var gaugeOptions = {

    chart: {
        type: 'solidgauge',
        animation: {
            duration: 50
        }
    },

    title: null,

    pane: {
        center: ['50%', '85%'],
        size: '140%',
        startAngle: -90,
        endAngle: 90,
        background: {
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
            innerRadius: '60%',
            outerRadius: '100%',
            shape: 'arc'
        }
    },

    tooltip: {
        enabled: false
    },

    // the value axis
    yAxis: {
        stops: [
            [0.1, '#DF5353'], // red
            [0.5, '#DDDF0D'], // yellow
            [0.9, '#55BF3B'] // green
        ],
        lineWidth: 0,
        minorTickInterval: null,
        title: {
            y: -70
        },
        labels: {
            y: 16
        }
    },

    plotOptions: {
        solidgauge: {
            dataLabels: {
                y: 5,
                borderWidth: 0,
                useHTML: true
            }
        }
    }
};

// The speed gauge
var chartSpeed = Highcharts.chart('container-speed', Highcharts.merge(gaugeOptions, {
    yAxis: {
    	min: 0,
        max: 100,
        title: {
            text: 'Voice'
        }
    },

    credits: {
        enabled: false
    },

    series: [{
        name: 'Voice',
        data: [0]
    }]

}));

///////////////////////////////////////////////////////



