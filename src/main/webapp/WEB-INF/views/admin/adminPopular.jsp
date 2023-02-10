<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html lang="ko">

	<head>
		<title>관리자페이지</title>
		<meta charset="utf-8">
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
										onclick="document.location.href='/bbs/logout.php';">로그아웃</button><button
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
							<li class="smenu" style="background-color:#4D6794; color:white;"><a href="/admin/coupon">
									<h1>기숙사 통합관리 솔루션</h1>
								</a></li>
							<li class="smenu"><a href="/admin/adminMember">회원관리</a>
								<ul class="sub ">
									<li><a href="/admin/adminMember">회원현황</a></li>
									<li><a href="../sub01/sub01_02.php">벌점관리</a></li>
								</ul>
							</li>
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
							<li class="smenu"><a href="/admin/sail">통계관리</a></li>
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
								<tbody>
									<tr>
										<th>순번</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>이름</th>
										<th>사유</th>
									</tr>
									<tr>
										<td>1</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>2</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>3</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>4</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>5</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>6</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>7</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>8</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>9</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>10</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
								</tbody>
							</table>


						</div>
						<div class="halfcon">
							<h4 class="bgtab bgtab2">승인 완료</h4>
							<table id="nightoverY" class="comm_table tac bmb">
								<tbody>
									<tr>
										<th>순번</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>이름</th>
										<th>사유</th>
									</tr>
									<tr>
										<td>1</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>2</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>3</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>4</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>5</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>6</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>7</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>8</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>9</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
									<tr>
										<td>10</td>
										<td>2023.01.24</td>
										<td>2023.01.30</td>
										<td>도현정</td>
										<td>네일아트</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>



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
		$(document).ready(function () {
			console.log("테스트")
			
			getTodays();
		})

		function confirm(over) {
			var tr = $(over).closest('tr')
			// var datas = { idx: tr.children().html() };
			let index = tr.find('input[type=hidden]').val();
			let datas = {"idx" : index};
			console.log(datas);

			//ajax로 업데이트 함 (confirm N->Y)
			$.ajax({
				type:"get",
				url:"/adminPopular/update",
				dataType: "json",
				data: datas	,
				success: function(result){
					console.log(result);
					//테이블에 append 해줌 (getTodays)
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
					console.log("성공");
					console.log(result);

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

					//아직 처리되지 않은 외박 신청
					let ncount = 1;
					let ycount = 1;
					$.each(result.nlist, function (index, over) {
						Ncontents += "<tr><td>" + (++index) + "</td>"
							+ "<td>" + over.startDate.slice(0, 11) + "</td>"
							+ "<td>" + over.endDate.slice(0, 11) + "</td>"
							+ "<td>" + over.username + "</td>"
							+ "<td>" + over.sleepOverReason + "</td>"
							+ "<td><button onclick='confirm(this)'>승인</button></td>"
							+ "<input type='hidden' value='" + over.idx + "' ></tr>"
					})

					$('#nightoverN').append(Ncontents);

					//처리된 외박 신청
					$.each(result.ylist, function (index, over) {
						Ycontents += "<tr><td>" + (++index) + "</td>"
							+ "<td>" + over.startDate.slice(0, 11) + "</td>"
							+ "<td>" + over.endDate.slice(0, 11) + "</td>"
							+ "<td>" + over.username + "</td>"
							+ "<td>" + over.sleepOverReason + "</td>"
							+ "<td>승인완료</td></tr>"
					})

					$('#nightoverY').append(Ycontents);
					// $('#content').append(contents)

				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}
	</script>

	</html>