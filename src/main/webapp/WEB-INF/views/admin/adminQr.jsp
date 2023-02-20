<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html lang="ko">

	<head>
		<title>관리자페이지</title>
		<meta charset="utf-8">
		<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
		<meta name="viewport" content="width=1400px, user-scalable=yes"> <!--표준형-->
		<meta name="format-detection" content="telephone=no, address=no, email=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Expires" content="-1" />

		<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon" />
		<link href="/resources/assets/css/font.css" rel="stylesheet">
		<link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
		<!-- <link rel="stylesheet" href="https://kit.fontawesome.com/7da3227c91.css" crossorigin="anonymous"> -->
		<link href="/resources/assets/css/style2.css" rel="stylesheet">
		<link href="/resources/assets/css/program.css" rel="stylesheet">
		<link href="/resources/assets/css/layout.css" rel="stylesheet">
		<link href="/resources/assets/css/menu.css" rel="stylesheet">
		<link href="/resources/assets/css/category.css" rel="stylesheet">
		<link href="/resources/assets/css/graph.css" rel="stylesheet">

		<!-- <script type="text/javascript" src="resources/assets/js/pg_script.js"></script> -->
		<!-- <script type="text/javascript" src="resources/assets/js/jquery-2.1.4.js"></script> -->

		<!-- <script type="text/javascript" src="resources/assets/js/jquery-ui-1.7.2.custom.min.js"></script> -->
		<!--<script type="text/javascript" src="../js/jquery.menu-aim.js"></script>-->
		<!-- <script type="text/javascript" src="resources/assets/js/jquery.tablednd.js"></script> -->

		<!-- <script type="text/javascript" src="resources/assets/js/tytabs.jquery.min.js"></script> -->
		<!-- <script type="text/javascript" src="resources/assets/js/tableDnDblog.js"></script> -->

		<!--<script type="text/javascript" src="resources/assets/js/menu.js"></script>  Resource jQuery -->
		<!-- <script type="text/javascript" src="resources/assets/js/modernizr.js"></script> Modernizr -->
		<!--<script type="text/javascript" src="resources/assets/js/jquery.flot.min.js"></script> gap-->
		
		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- qrCode -->
		<script type="text/javascript" src="/resources/assets/js/qrcode.js"></script>
		
		
		
	</head>
	<body class="">
		<div class="wrap">

			<div id="header">
				<div class="headerwrap">
					<div id="headerin">
						<h1><a href="../" class="logo"><img src="/resources/assets/img/logoBLUE.png" alt="로고"
									style="height:60px;" /></a></h1>
						<nav class="gnb">
							<ul>

								<li class="menu last">
									<button class="btn_sumit ml"
										onclick="document.location.href='/logout';">로그아웃</button><button
										class="btn_sumit blbtn ml"
										onclick="document.location.href='/';">홈페이지</button>
								</li> <!--.menu.g1-->

							</ul>
						</nav>
					</div>

				</div>
			</div>


			<div class="subcon">
				<div class="leftcon">
					<nav id="sidemenu">
						<ul class="submenu">
							<li class="smenu" style="background-color:#4D6794; color:white;"><a href='javascript:void(0);'>
									<h1>기숙사 통합관리 솔루션</h1>
								</a></li>
							<li class="smenu"><a href="/admin/adminMember">회원관리</a>
								<ul class="sub ">
									<li><a href="/admin/adminMember">회원현황</a></li>
									<li><a href="../sub01/sub01_02.php">벌점관리</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/board">커뮤니티관리</a>
							<li class="smenu"><a href="/admin/coupon">식권관리</a></li>
							<li class="smenu"><a href="/admin/popular" >외박관리</a>
								<ul class="sub ">
									<li><a href="/admin/popular">외박신청</a></li>
									<li><a href="/admin/sleepOverHistory">외박이력</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/analyze">시설관리</a>
								<ul class="sub ">
									<li><a href="/admin/analyze">시설관리</a></li>
									<li><a href="/admin/enroll">시설등록</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/calendar">일정관리</a></li>
							<li class="smenu"><a href=/admin/file >회원파일등록</a></li>
							<li class="smenu"><a href="/admin/sail">통계관리</a></li>
							<li class="smenu"><a href="/admin/qr" class="msub on">식권QR</a></li>
						</ul>

					</nav>
					<script>
						//서브 left_menu
						$(document).ready(function () {
							$(".msub").click(function () {
								var tg = $(this).siblings(".sub");
								var dis = tg.css("display");
								if (dis == "block") {
									$(this).removeClass("on");
									tg.slideUp(300);
								}
								if (dis == "none") {
									$(".msub").removeClass("on");
									$(this).addClass("on");
									$(".sub").slideUp(300);
									tg.slideDown(300);
								}
								return false;
							});
						});
					</script>

				</div>
				<div class="con">
					<h3 class="sub_h3">식권가격 <span>QR 생성</span></h3>



				<div class="bgtab bgtab2">
				   <div class="w50 fl">
				       	<span>가격설정: </span><input id="text" type="number" name="text" value="0" min="0" max="1000000" step="100">&nbsp;&nbsp;
				            <ul class="dpi_li dpi">
				               <li><button class="btn_sumit"onclick="makeCode()">생성</button></li>
				            </ul>
				   </div>
				   <div class="w50 fl tar">
				      <ul class="dpi_li tar">         
				         <li><button class="btn_sumit2"  id="button"  onclick="printPage()">프린트하기 </button></li>
				      </ul>
				   </div>
				</div>
<!--------------------------------------------------- 큐알 나오는곳 ------------------------------------------------------->
 
				<div class="nmbox mb">
					<div id="print" class="container">
						<div id="qrcode" style="width:500px; height:500px; margin:auto; margin-top:40px;"></div>
					</div>
				<div class="nmbox mb">
<!--------------------------------------------------- 큐알 끝나는곳 ------------------------------------------------------->
				</div><!--con-->
			</div><!--subcon-->

			<div id="footer">
				<p>Copyright(c)뷰티몰 쇼핑몰관리시스템. All rights reserved. supported by <a href="http://www.cmaru.com"
						target="_blank">크리에이티브마루.</a></p>
			</div>

			<div id="pageup">
			</div>
		</div><!--wrap-->
	</body>
	<!-- litebox -->
	<!-- <script type="text/javascript" src="resources/assets/js/hs_draggable.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/jquery-ui.min.js"></script> -->
	<link rel="stylesheet" media="all" href="/resources/assets/css/litebox.css" />
	<!-- <script type="text/javascript" src="resources/assets/js/litebox.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/backbone.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/images-loaded.min.js"></script> -->
	<!-- litebox -->


	<script type="text/javascript">
	//qr코드 생성 
	var qrcode = new QRCode(document.getElementById("qrcode"), { 
	//가로, 세로 높이 조절 
	width : 400, 
	height : 400 }); 

	//input:text에 들어있는 value를 qr코드로 바꿔주는 function 
	function makeCode () { 
		var elText = document.getElementById("text"); 
	    qrcode.makeCode("https://bamjong.shop/payment/"+elText.value); 
	} 

	//위에 만든 function 실행 
	makeCode(); 

	//텍스트 이벤트 감지 
	$("#text")
		.on("blur", function () { 
		makeCode(); })
	    .on("keydown", function (e) { 
	    	if (e.keyCode == 13) { 
	        makeCode();} 
	    });
	
	//window.print() 영역설정하기
	
	function printPage(){
	 var initBody;
	 window.onbeforeprint = function(){
	  initBody = document.body.innerHTML;
	  document.body.innerHTML =  document.getElementById('print').innerHTML;
	 };
	 window.onafterprint = function(){
	  document.body.innerHTML = initBody;
	 };
	 window.print();
	 return false;
	}
	</script>

	</html>