<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>JavaScript Drawing</title>
</head>
<body>
	<canvas id="myCanvas" width="1280" height="700" style="border:1px solid black"></canvas>
	<br>
	<p>색 바꾸기
	<input type="color" id="colorPicker">
	<button id="clearButton">Clear</button></p>
	<a href="/">뒤로가기</a>
	<script>
		// 캔버스 요소 가져오기
		var canvas = document.getElementById("myCanvas");
		// 2D 그래픽 컨텍스트 가져오기
		var ctx = canvas.getContext("2d");

		// 그리기 플래그 초기화
		var isDrawing = false;

		// 시작 좌표 초기화
		var startX = 0;
		var startY = 0;

		// 그리기 색상 초기화
		var drawColor = "#000000";

		// 마우스 이벤트 핸들러 등록
		canvas.addEventListener("mousedown", function(event) {
			isDrawing = true;
			startX = event.clientX - canvas.offsetLeft;
			startY = event.clientY - canvas.offsetTop;
		});

		canvas.addEventListener("mousemove", function(event) {
			if (isDrawing) {
				// 마우스 이동 좌표 가져오기
				var x = event.clientX - canvas.offsetLeft;
				var y = event.clientY - canvas.offsetTop;

				// 선 그리기
				ctx.beginPath();
				ctx.moveTo(startX, startY);
				ctx.lineTo(x, y);
				ctx.strokeStyle = drawColor;
				ctx.lineWidth = 5;
				ctx.stroke();

				// 시작 좌표 업데이트
				startX = x;
				startY = y;
			}
		});

		canvas.addEventListener("mouseup", function(event) {
			isDrawing = false;
		});

		// 색상 선택기 이벤트 핸들러 등록
		var colorPicker = document.getElementById("colorPicker");
		colorPicker.addEventListener("change", function() {
			drawColor = colorPicker.value;
		});

		// 지우기 버튼 이벤트 핸들러 등록
		var clearButton = document.getElementById("clearButton");
		clearButton.addEventListener("click", function() {
			ctx.clearRect(0, 0, canvas.width, canvas.height);
		});
	</script>
</body>
</html>