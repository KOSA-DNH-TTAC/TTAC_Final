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

	

		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
							<li class="smenu"><a href="/admin/popular" class="msub on">외박관리</a>
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
					<h3 class="sub_h3">외박관리 <span>외박현황</span></h3>



					<div class="ofh">
						<div class="halfcon mr">
							<h4 class="bgtab bgtab2">외박 신청</h4>
							<table id="nightoverN" class="comm_table tac bmb">
								
							</table>


						</div>
						<div class="halfcon">
							<h4 class="bgtab bgtab2">승인 완료</h4>
							<table id="nightoverY" class="comm_table tac bmb">
								
							</table>
						</div>
					</div>



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


	<script type="text/javascript">
		function dateFormatter(date) {
			var wantDate = new Date(date);
			// 년도 getFullYear()
			var year = wantDate.getFullYear();
			// 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
			var month = wantDate.getMonth() + 1
			// 일 getDate()
			var date = wantDate.getDate(); // 일
			if (month < 10) {
				month = "0" + month;
			}
			if (date < 10) {
				date = "0" + date;
			}
			var wantDateFormat = year + "-" + month + "-" + date;
			return wantDateFormat;
		}

		$(document).ready(function () {
			
			getTodays();
		})

		function confirm(over) {
			var tr = $(over).closest('tr')
			let index = tr.find('input[type=hidden]').val();
			let datas = { "idx": index };

			//ajax로 업데이트 함 (confirm N->Y)
			$.ajax({
				type: "get",
				url: "/adminPopular/update",
				dataType: "json",
				data: datas,
				success: function (result) {
				
					getTodays();
				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}

		function getTodays() {
			$.ajax({
				type: "GET",
				url: "/adminPopular/getTodays",
				success: function (result) {
					
					$('#nightoverN').empty();
					$('#nightoverY').empty();
					let Ncontents = `<tbody>
									<tr>
										<th>번호</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>이름</th>
										<th>사유</th>
										<th>처리</th>
									</tr>`
					let Ycontents = Ncontents;

					//외박 신청이 없을 경우
					if (result.nlist.length == 0) {
						Ncontents = "<tr><td col-span='6'>들어온 외박 신청이 없습니다.</td></tr>"
					} else {
						//아직 처리되지 않은 외박 신청

						$.each(result.nlist, function (index, over) {
							let startdate = dateFormatter(over.startDate);
							let enddate = dateFormatter(over.endDate);
							Ncontents += "<tr><td>" + (++index) + "</td>"
								+ "<td>" + startdate + "</td>"
								+ "<td>" + enddate + "</td>"
								+ "<td>" + over.username + "</td>"
								+ "<td>" + over.sleepOverReason + "</td>"
								+ "<td><button onclick='confirm(this)'>승인</button></td>"
								+ "<input type='hidden' value='" + over.idx + "' ></tr>"
						})
					}


					$('#nightoverN').append(Ncontents);

					if (result.ylist.length == 0) {
						Ycontents = "<tr><td col-span='6'>승인된 외박신청이 없습니다.</td></tr>"
					} else {
						//처리된 외박 신청
						$.each(result.ylist, function (index, over) {
							let startdate = dateFormatter(over.startDate);
							let enddate = dateFormatter(over.endDate);
							Ycontents += "<tr><td>" + (++index) + "</td>"
								+ "<td>" + startdate + "</td>"
								+ "<td>" + enddate + "</td>"
								+ "<td>" + over.username + "</td>"
								+ "<td>" + over.sleepOverReason + "</td>"
								+ "<td>승인완료</td></tr>"
						})
					}

					$('#nightoverY').append(Ycontents);
					
				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}
	</script>

	</html>