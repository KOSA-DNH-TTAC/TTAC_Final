<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
   
<!DOCTYPE html>
<html>
<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4DV6JYFYRH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4DV6JYFYRH');
</script>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- Favicons -->
  <link href="/resources/assets/img/3projectpavicon.ico" rel="icon">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Chatting</title>
</head>
<body>
<div class="container">
	<div class="col-6">
		<label><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
            $(document).ready(function(){

            const username = "${userid}";

            //이건 연결 끊기....
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
 		//const websocket = new WebSocket("ws://192.168.0.31:8090/chat");
		//const websocket = new WebSocket("ws://3.35.70.249:8090/chat"); 톰캣 ??
		const websocket = new WebSocket("ws://" + location.host + "/chat/websocket");

            websocket.onmessage = onMessage;
            websocket.onopen = onOpen;
            websocket.onclose = onClose;

            function send(){

                let msg = document.getElementById("msg");

                websocket.send(username + ":" + msg.value);
                msg.value = '';
            }
            
            //채팅창에서 나갔을 때
            function onClose(evt) {
                var str = username + ": 님이 방을 나가셨습니다.";
                websocket.send(str);
            }
            
            //채팅창에 들어왔을 때
            function onOpen(evt) {
                var str = username + ": 님이 입장하셨습니다.";
                websocket.send(str);
            }

            function onMessage(msg) {
                var data = msg.data;
                var sessionId = null;
                //데이터를 보낸 사람
                var message = null;
                var arr = data.split(":");

                var cur_session = username;

                //현재 세션에 로그인 한 사람
                sessionId = arr[0];
                message = arr[2];

                //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
                if(sessionId == cur_session){
                    var str = "<div class='col-6'>";
                    str += "<div class='alert alert-secondary'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
                else{
                    var str = "<div class='col-6'>";
                    str += "<div class='alert alert-warning'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
            }
            })
</script>
</html>