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
							<li class="smenu"><a href="/admin/adminMember" class="msub ">회원관리</a>
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
							<li class="smenu"><a href="/admin/file" >회원파일등록</a></li>
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
					<h3 class="sub_h3">외박관리 <span>외박 내역</span></h3>


					<div class="bmb">
						<div class="bgtab">
							<div class="w50 fl">
								<h3 class="txtin">기간별 외박 조회</h3>
							</div>
							<div class="w50 fl tar">
								<a class="btn_sumit2">엑셀다운로드</a>
							</div>
						</div>
						<table class="srch_table mb20">
							<colgroup>
								<col width="%" />
								<col width="20%" />
								<col width="%" />
								<col width="60%" />
							</colgroup>
							<tr>
								<th>조회</th>
								<td colspan="3">
									<li><a href="#" id="todayHistory" onclick="getTodaysHistory()" class="btn_sumit">현
											시각 외박현황 보기</a></li>
								</td>
							</tr>
							<tr>
								<th>기간별검색</th>
								<td colspan="3">
									<input class="form-select1" type="date" id="start" name="trip-start">
									- <input class="form-select1" type="date" id="end" name="trip-end">&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<th>회원 검색</th>
								<td colspan="3">
									<div class="form-group">
										<label for="memberid">학번</label>
										<input class="form-select1" type="text" id="memberid" name="memberid">
									</div>
								</td>
							</tr>
						</table>
						<div class="ok_btn">
							<ul>
								<li><button type="button" class="btn_sumit2" onclick="getIntervalHistory()">검색</button>
								</li>
							</ul>
						</div>
					</div>

					<div class="ofh">
						<div class="halfcon mr">
							<h4 class="bgtab bgtab2">외박이력</h4>
							<table id="nightoverN" class="comm_table tac bmb">
								<tbody>
									<tr>
										<th>순번</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>이름</th>
										<th>사유</th>
									</tr>
								</tbody>
							</table>


						</div>
						<div class="halfcon">
							<h4 class="bgtab bgtab2">무단 외박</h4>
							<table id="nightoverY" class="comm_table tac bmb">
								<tbody>
									<tr>
										<th>순번</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>이름</th>
										<th>사유</th>
									</tr>
								</tbody>
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
	
	<link rel="stylesheet" media="all" href="/resources/assets/css/litebox.css" />
	

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
			getAllHistory();
		})


		function getAllHistory() {
			$.ajax({
				type: "GET",
				url: "/adminPopular/getHistory",
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
									</tr>`
					let Ycontents = Ncontents;

					//아직 처리되지 않은 외박 신청
					$.each(result.list, function (index, over) {

						let startdate = dateFormatter(over.startDate);
						let enddate = dateFormatter(over.endDate);
						Ncontents += "<tr><td>" + (++index) + "</td>"
							+ "<td>" + startdate + "</td>"
							+ "<td>" + enddate + "</td>"
							+ "<td>" + over.username + "</td>"
							+ "<td>" + over.sleepOverReason + "</td>"
							+ "<input type='hidden' value='" + over.sleepOverIdx + "' ></tr>"
					})

					$('#nightoverN').append(Ncontents);

				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}

		function getTodaysHistory() {
			$.ajax({
				type: "GET",
				url: "/adminPopular/getTodayHistory",
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
									</tr>`
					let Ycontents = Ncontents;

					//아직 처리되지 않은 외박 신청
					$.each(result.list, function (index, over) {
						
						let startdate = dateFormatter(over.startDate);
						let enddate = dateFormatter(over.endDate);
						Ncontents += "<tr><td>" + (++index) + "</td>"
							+ "<td>" + startdate + "</td>"
							+ "<td>" + enddate + "</td>"
							+ "<td>" + over.username + "</td>"
							+ "<td>" + over.sleepOverReason + "</td>"
							+ "<input type='hidden' value='" + over.sleepOverIdx + "' ></tr>"
					})

					$('#nightoverN').append(Ncontents);

				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}

		function getIntervalHistory() {
			
			let startString = $('#start').val();
			let endString = $('#end').val();
			let memberid = $('#memberid').val();

			$.ajax({
				type: "GET",
				url: "/adminPopular/getIntervalHistory",
				data: {
					"startdate": startString,
					"enddate": endString,
					"memberid": memberid,
				},
				contentType: "application/json; charset=UTF-8",
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
									</tr>`
					let Ycontents = Ncontents;

					//아직 처리되지 않은 외박 신청
					$.each(result.list, function (index, over) {
						
						let startdate = dateFormatter(over.startDate);
						let enddate = dateFormatter(over.endDate);
						Ncontents += "<tr><td>" + (++index) + "</td>"
							+ "<td>" + startdate + "</td>"
							+ "<td>" + enddate + "</td>"
							+ "<td>" + over.username + "</td>"
							+ "<td>" + over.sleepOverReason + "</td>"
							+ "<input type='hidden' value='" + over.sleepOverIdx + "' ></tr>"
					})

					$('#nightoverN').append(Ncontents);
				}
			}
			)
		}
	</script>

	</html>