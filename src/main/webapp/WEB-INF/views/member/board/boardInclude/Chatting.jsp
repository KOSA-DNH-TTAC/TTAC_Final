<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<meta content="" name="description">
			<meta content="" name="keywords">
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

			<!-- Favicons -->
			<link href="resources/assets/img/favicon.png" rel="icon">
			<link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

			<!-- Google Fonts -->
			<link
				href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
				rel="stylesheet">

			<!-- Vendor CSS Files -->
			<link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
			<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
			<link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
			<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
			<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
			<link href="/resources/assets/css/yb.css" rel="stylesheet">

			<!-- Jquery -->
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>

			<!-- Template Main CSS File -->
			<link href="/resources/assets/css/style.css" rel="stylesheet">

			<!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
    .msgArea {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 10px;
        min-height: 40vh;
        max-height: 40vh;
        overflow-y: scroll;
    }

    #button-send {
    border:none;
    background-color: #FFC107;
    box-shadow: none;
    /* width:85px; */
    /* border-radius: 50px; */
    padding:5px;
    border: none;
    /* background-color:#E96B56; */
    color:black;
    margin-top:10px;
    margin-bottom: 10px;
}

    #mychat{
        color : Tomato;
    }
</style>
  <div class="sidebar">
    <h3 class="sidebar-title">채팅</h3>
    <div class="chat-window">
        <div class="chat-header">
            <!-- <button class="close-chat-btn">X</button> -->
        </div>
        <div class="msgArea col-12" id="msgArea">
            <!-- Add chat messages here -->
        </div>
        <div class="chat-footer col">
            <input type="text" id="msg" style="width:80%" placeholder="메시지를 입력하세요" />
            <button type="button" id="button-send">전송</button>
        </div>
    </div>
</div>

<script>
				
                function generateRandomNickname() {
                        const adjectives = ["행복한", "바보같은", "졸린", "까다로운", "실없는", "수다스러운", "미친", "똑똑한", "재밌는", "쾌활한", "신난"];
                        const nouns = ["기린", "코끼리", "원숭이", "판다", "코알라", "펭귄", "캥거루", "사자", "호랑이", "얼룩말", "쿼카", "개"];
                        const randomAdj = adjectives[Math.floor(Math.random() * adjectives.length)];
                        const randomNoun = nouns[Math.floor(Math.random() * nouns.length)];

                        let nick = randomAdj + "" + randomNoun + Math.floor(Math.random() * 100)
               
                        return nick;
                }
                

				$(document).ready(function(){
                 
                    const username = generateRandomNickname();
               
                    $("#msg").on("focus", function() {
                        scrollToBottom();
                    });

                  
                    // 메시지를 추가할 때마다 스크롤바를 아래로 내려줍니다.
                    function scrollToBottom() {
                        $("#msgArea").animate({ scrollTop: $("#msgArea").prop("scrollHeight") }, 500);
                    }
               

				// 연결 끊기
				$("#disconn").on("click", (e) => {
					disconnect();
				})

				//전송 버튼
				$("#button-send").on("click", (e) => {
					send();
				});

				//엔터 쳐도 전송 버튼 누르게
				$('#msg').keypress(function(event) {
					if (event.keyCode === 13) {
						event.preventDefault();
						$('#button-send').click();
					}
				});
				
				const websocket = new WebSocket("wss://" + location.host + "/chat/websocket");

				websocket.onmessage = onMessage;
				websocket.onopen = onOpen;
				websocket.onclose = onClose;

				function send(){

					let msg = document.getElementById("msg");

			
					websocket.send(username + ":" + msg.value);
					msg.value = '';
                    scrollToBottom();
				}

				//채팅창에서 나갔을 때
				function onClose(evt) {
					// var str = username + ": 님이 방을 나가셨습니다.";
					// websocket.send(str);
				}

				//채팅창에 들어왔을 때
				function onOpen(evt) {
					// var str = username + ": 님이 입장하셨습니다.";
					// websocket.send(str);
				}

				function onMessage(msg) {
					var data = msg.data;
					var sessionId = null;
					//데이터를 보낸 사람
					var message = null;
					var arr = data.split(":");

					var cur_session = username;

					// sessionId = arr[0];
                    sessionId = arr[1];
					message = arr[2];


					//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
					if(sessionId == cur_session){
						var str = "<div class='col'>";
						str += "<div class='alert alert-secondary'>";
						str += "<p id='mychat'>" + username + " : " + message + "</p>";
						str += "</div></div>";
						$("#msgArea").append(str);
					}
					else{
						var str = "<div class='col'>";
						str += "<div class='alert alert-warning'>";
						str += "<p>" + sessionId + " : " + message + "</p>";
						str += "</div></div>";
						$("#msgArea").append(str);
					}
				}
				})
			</script>