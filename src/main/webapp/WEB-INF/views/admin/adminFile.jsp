<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html lang="ko">

	<head>
	<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4DV6JYFYRH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4DV6JYFYRH');
</script>
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

		<!-- Sweet Alert -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<!-- Jquery for FORM -->
		<!-- <script src="http://malsup.github.com/jquery.form.js" contentType="application/javascript"></script> -->
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
									<button class="btn_sumit ml네일아트"
										onclick="document.location.href='/logout';">로그아웃</button><button
										class="btn_sumit blbtn ml네일아트"
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
									<h1>기숙사관리시스템 : ${domitoryName}</h1>
								</a></li>
							<li class="smenu"><a href="/admin/adminMember">회원관리</a>
								<ul class="sub ">
									<li><a href="/admin/adminMember">회원현황</a></li>
									<li><a href="../sub01/sub01_02.php">벌점관리</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/board">커뮤니티관리</a>
							<li class="smenu"><a href="/admin/coupon">식권관리</a></li>
							<li class="smenu"><a href="/admin/popular">외박관리</a>
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
							<li class="smenu"><a href=/admin/file class="msub on">회원파일등록</a></li>
							<li class="smenu"><a href="/admin/RollCall" >점호관리</a></li>
							<li class="smenu"><a href="/admin/sail">통계관리</a></li>
							<li class="smenu"><a href="/admin/qr">식권QR</a></li>
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
					<h3 class="sub_h3">회원파일등록 <span>엑셀파일등록</span></h3>



					<div class="ofh">
						<div class="halfcon mr">
							<h4 class="bgtab bgtab2">회원 엑셀 파일 업로드<button id="deactive" style="margin-left:20px;" onclick="deactive()">회원 전체 휴면처리</button></h4>
							<form id="excelForm" action="/admin/addExcel" method="POST" enctype="multipart/form-data">
							<table id="nightoverN" class="comm_table tac bmb">
								<tbody>
									<tr>										
										<td><input class="form-control form-control-lg" id="formFileLg" name="file" type="file" accept=".xlsx, .xls"> <input type="submit" value="업로드"></td>
									</tr>
								</tbody>
								
							</table>
							</form>


						</div>
						<div class="halfcon">
							<h4 class="bgtab bgtab2">업로드 데이터</h4>
							<table id="nightoverY" class="comm_table tac bmb">

							</table>
							<span id="hjcount"></span>
						</div>
					</div>
					<div id="div_load_image" style="position:absolute; top:50%; left:50%; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
						<img src="/resources/assets/img/loading.gif" style="width:100px; height:100px;">
					</div>
					<!-- <div id="div_load_image" style="position:absolute; top:50%; left:50%;width:0px;height:0px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
						<img src="/resources/assets/img/loading.gif" style="width:100px; height:100px;">
					</div> -->

				</div><!--con-->
			</div><!--subcon-->





			<div id="footer">
		<p>Copyright(c) 기숙사 통합 관리 시스템. All rights reserved. supported by DOTO.</a></p>

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


	<script>
		$(document).ready(function(){
			$('#div_load_image').hide(); //로딩바 숨김
		})
		let uploadMember;
		
		function myclick(){
			console.log("반영!!!!!!!!!!!!!")
			console.log(uploadMember);
			$('#div_load_image').show()
			$.ajax({
				type:"POST",
				data: JSON.stringify(uploadMember),
				contentType: "application/json; charset=UTF-8",
				url: "/admin/updateExcel",
				success: function(result){
					console.log(result)
					$('#div_load_image').hide(); //로딩바 숨김
					Swal.fire(
						'반영 완료!',
						'신규 기숙사생을 업데이트하였습니다.',
						'success'
						)
				}
			})
		}

		$('#excelForm').submit(function() { //submit이 발생하면
			console.log("서브밋")

			let formFile = $('#formFileLg')[0];
			if(formFile.files.length === 0){
				alert("파일을 선택해주세요");
				return false;
			}
			let form = $('#excelForm')[0];
			const formData = new FormData(form);

			$("#div_load_image").show(); //로딩바 보여줌

			//ajax로 신규 기숙사생을 map에 넣어 리턴 받음
			$.ajax({
				type:"POST",
				processData: false,
				contentType: false,
				data: formData,
				url: "/admin/addExcel",
				success: function(result){
					//ajax성공시 로딩바 다시 숨김
					$("#div_load_image").hide();

					console.log(result);
					uploadMember = result.list;
					$('#nightoverY').empty();
					$('#hjcount').empty();
					
					let membercount =0 ;

					let content = `<tbody>
								<tr><th colspan='7'><button onclick="myclick()">반영하기</button><span> &nbsp;&nbsp;기존 회원은 휴면 해제, 신규 회원은 신규가입됩니다.</span></th></tr>
								<tr>
									<th>학번</th>
									<th>이름</th>
									<th>성별</th>
									<th>학과</th>
									<th>기숙사명</th>
									<th>호실</th>
									<th>신규입사여부</th>
								</tr>
							`
					$.each(result.list, function(index, member){
						membercount++;
						let newjoin;
						if(member.newjoin == 'Y'){
							newjoin = "신규";
						}else if(member.newjoin == 'N'){
							newjoin = ""
						}
						content += `<tr>
										<td>` + member.memberId + `</td>
										<td>` + member.name  + `</td>
										<td>` + member.gender + `</td>
										<td>` + member.major + `</td>
										<td>` + member.domitoryName + `</td>
										<td>` + member.room + `</td>
										<td>` + newjoin + `</td>
									</tr>
									`
					})
					content += `
								</tbody>`

					$('#nightoverY').append(content);
					$('#hjcount').append(membercount + " 명")
				},
				error: function(res){
					console.log("에러가 발생했습니다.")
				}
			})

			//업로드 데이터 테이블에 이 기숙사생 띄우고

			//아래에 리셋 버튼 / 최종 반영 버튼

			return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
	});
		
		function deactive(){
			$.ajax({
				type:"POST",
				url: "/admin/updateDeactivate",
				success: function(result){
					console.log(result)
					Swal.fire(
						result,
						'기숙사생을 일괄 휴면처리하였습니다.',
						'success'
						)
				}
			})
		}
	</script>

	</html>