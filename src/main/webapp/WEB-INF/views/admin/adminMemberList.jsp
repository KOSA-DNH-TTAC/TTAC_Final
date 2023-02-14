<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=1400px, user-scalable=yes"> <!--표준형-->
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
<link href="/resources/assets/css/yb.css" rel="stylesheet">

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
<style>
	.memberrow:hover{
		background-color:#f5f5f5;
		color: #e96b56;
		transition: 0.3s;
	}
</style>
<body class="">
<div class="wrap">
			
	<div id="header">				
		<div class="headerwrap">
			<div id="headerin">
				<h1><a href="../" class="logo"><img src="/resources/assets/img/logoBLUE.png" alt="로고" style="height:60px;"/></a></h1>		
				<nav class="gnb">
					<ul>
					
						<li class="menu last">
							<button class="btn_sumit ml네일아트" onclick="document.location.href='/bbs/logout.php';">로그아웃</button><button class="btn_sumit blbtn ml네일아트" onclick="document.location.href='/';">홈페이지</button>
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
							<li class="smenu"><a href="/admin/adminMember" class="msub on">회원관리</a>
								<ul class="sub ">
									<li><a href="/admin/adminMember">회원현황</a></li>
									<li><a href="../sub01/sub01_02.php">벌점관리</a></li>
								</ul>
							</li>
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
							<li class="smenu"><a href="/admin/sail">통계관리</a></li>
						</ul>

					</nav>
<script>
//서브 left_menu
$(document).ready(function(){		
	$(".msub").click(function(){		
		var tg = $(this).siblings(".sub");		
		var dis = tg.css("display");		
		if(dis == "block"){
			$(this).removeClass("on");
			tg.slideUp(300);
		}		
		if(dis == "none"){
			$(".msub").removeClass("on");
			$(this).addClass("on");
			$(".sub").slideUp(300);
			tg.slideDown(300);
		}
		return false;
	});
});
</script>

</div>	<div class="con">
		<h3 class="sub_h3">회원관리 <span>회원현황</span></h3>
<div class="bmb">
	<div class="bgtab">
	<h3 class="txtin" id="excelCenter">회원 조회 <button class="btn_sumit2" id="excelbutton">엑셀 다운로드</button></h3>
	</div>
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="60%"/>
		</colgroup>
		<tr>
			<th>검색어</th>
			<td colspan="3">
				<div class="txtin" style="text-align:left;">
					<label class="mr10"><input type="radio" name="search" checked="checked">전체</label>  
					<label class="mr10"><input type="radio" name="search">학번</label>  
					<label class="mr10"><input type="radio" name="search">이름</label>
					<label class="mr10"><input type="radio" name="search">건물</label>
					<label class="mr10"><input type="radio" name="search">호수</label>
					<input type="text" style="width:60%"></input>
					<button type="button" class="btn_submit3" style="float:right; width:100px;">검색</button>
				</div>
			</td>
		</tr>
	</table>	
</div>

<div class="ofh">
	<div class="halfcon mr">		
		<h4 class="bgtab bgtab2">회원 목록</h4>
		<table style='height:100px' class="comm_table tac bmb" id="membertable">	
			
		</table>


	</div>
	<div class="halfcon">
		<h4 class="bgtab bgtab2">회원 정보 상세</h4>
		<table class="comm_table tac bmb" id="memberinfotable">
			<tbody>
				<tr>
					<th width="17%">학번</th>
					<th width="11%">이름</th>
					<th width="19%">학과</th>
					<th width="19%">휴대폰</th>
					<th width="19%">보호자 연락처</th>
					<th width="15%">기숙사</th>
				</tr>
				<tr class="plusMemberInfo">
								
				</tr>
			</tbody>
		</table>
		<div class="inputDemerit"></div>
	</div>
</div>



		</div><!--con-->
	</div><!--subcon-->





		<div id="footer">
		<p>Copyright(c) 기숙사 통합 관리 시스템. All rights reserved. supported by ttac.</a></p>
	</div>

	<div id="pageup">
	</div>
</div><!--wrap-->




</body>

<script>

	$(document).ready(function() {
		// 회원 목록 부르기
		getMemberList();
	})
	
	function getMemberList(){
		$.ajax({
				type: "get",
				url: "/admin/allmember",
				success: function (result) {
					console.log(result);
					//테이블에 append 해줌 (getTodays)
					$('#membertable').empty();
					let contents = `<tbody style='overflow: auto;'>` +
				`<tr>		
					<th>순번</th>
					<th>학번</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>벌점</th>
				</tr>`

				$.each(result.list, function(index, member){

					contents += `<tr class="memberrow">
						<td><b>` + (++index) +`</b></td>
						<td class="tal"><div id="memberId">` 
						+ member.memberId + `</div></td>
						<td>` + member.name + `</td>	
						<td>` + member.phone + `</td>
						<td>` + member.demerit + `</td>
					</tr></button>`

				})
				contents += `</tbody></table>`;
				$('#membertable').append(contents);
				
				},
				error: function (request, status, error) {
					console.log("에러")
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			})
		}
	
	function search(){
		
		var selectedRadioText = $('input[name="search"]:checked').parent().text();
	    var inputBoxValue = $('.txtin input[type="text"]').val();
	    
	    console.log(selectedRadioText);
	    console.log(inputBoxValue);
	    
	    var searchMemberData = "";
	    
	    if (selectedRadioText == '전체') {
	    	getMemberList();
	    } else if (selectedRadioText == '학번') {
	    	radio = "memberId";
	    } else if (selectedRadioText == '이름') {
	    	radio = "name";
	    } else if (selectedRadioText == '건물') {
	    	radio = 'domitoryName';
	    } else if (selectedRadioText == '호수') {
	    	radio = 'room';
	    }
	    
	    $.ajax({
	    	type: "get",
	    	url: "/admin/memberInfo/search/" + radio + "/" + inputBoxValue,
				success: function (data) {
					
					console.log("클릭")
					
					$('#membertable').empty();
					let contents = `<tbody>` +
				`<tr>		
					<th>순번</th>
					<th>학번</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>벌점</th>
				</tr>`

				$.each(data, function(index, member){

					contents += `<tr class="memberrow">
						<td><b>` + (++index) +`</b></td>
						<td class="tal"><div id="memberId">` 
						+ member.memberId + `</div></td>
						<td>` + member.name + `</td>	
						<td>` + member.phone + `</td>
						<td>` + member.demerit + `</td>
					</tr></button>`

				})
				contents += `</tbody></table>`;
				$('#membertable').append(contents);
				$('.plusMemberInfo').empty();
				$('.inputDemerit').empty();
				}
	    })
		
	}
	
	 $(".btn_submit3").click(function() {
		 search(); 
			})
	


	$(document).on(					
			"click",
			".memberrow", function memberrow() {
				var memberId = $(this).find("#memberId").text();			
				var memberInfo = "";
				var inputDemerit = "";
			
			$.ajax({
				type: "get",
				url: "/admin/memberInfo/" + memberId,
				success: function (data) {
					
					memberInfo += "<td>"
					+ data[0].memberId 
					+ "</td><td>"
					+ data[0].name
					+ "</td><td>"
					+ data[0].major
					+ "</td><td>"
					+ data[0].phone
					+ "</td><td>"
					+ data[0].parentsPhone
					+ "</td><td>"
					+ data[0].domitoryName + "&nbsp;" + data[0].room
					+ "</td><br>"		
					
					inputDemerit += 
						"<h4 class='bgtab bgtab2'>벌점 이력</h4><table class='comm_table tac bmb' id='memberinfotable' style='margin-bottom:10px !important'><tbody><tr>"		
					+ "<th width='25%'>날짜</th><th width='10%'>벌점</th>"
					+ "<th width='65%'>사유</th></tr>"
					+ "<tr><td></td><td style='text-align:right; margin-right:5px;'>점</input></td>"
					+ "<td></td></tr></tbody></table>"
					+ "<button type='button' id='demeritBtn'>벌점 주기</button>"
					
					$('.plusMemberInfo').empty();
					$('.plusMemberInfo').append(memberInfo);
					
					$('.inputDemerit').empty();
					$('.inputDemerit').append(inputDemerit);
					
				}
			}) // 회원 정보 출력 ajax end
			
			// 벌점 부과
			$.ajax({
				type: post,
				url: "/admin/member/demerit" + memberId,
				success: function () {
				
					console.log();
					getMemberList();
				}
				})
							
			
			}) // document.on end

		
		
		
		
		
</script>
</html>