<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Expires" content="-1" /> 

<link href="/resources/assets/css/font.css" rel="stylesheet">
<link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
<link href="/resources/assets/css/style2.css" rel="stylesheet">
<link href="/resources/assets/css/program.css" rel="stylesheet">
<link href="/resources/assets/css/layout.css" rel="stylesheet">
<link href="/resources/assets/css/menu.css" rel="stylesheet">
<link href="/resources/assets/css/category.css" rel="stylesheet">
<link href="/resources/assets/css/graph.css" rel="stylesheet">


<!-- 
<script type="text/javascript" src="resources/assets/js/pg_script.js"></script>
<script type="text/javascript" src="resources/assets/js/jquery-2.1.4.js"></script>

<script type="text/javascript" src="resources/assets/js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.menu-aim.js"></script>
<script type="text/javascript" src="resources/assets/js/jquery.tablednd.js"></script>

<script type="text/javascript" src="resources/assets/js/tytabs.jquery.min.js"></script>
<script type="text/javascript" src="resources/assets/js/tableDnDblog.js"></script>

<script type="text/javascript" src="resources/assets/js/menu.js"></script> Resource jQuery
<script type="text/javascript" src="resources/assets/js/modernizr.js"></script> Modernizr 
<script type="text/javascript" src="resources/assets/js/jquery.flot.min.js"></script> gap-->

		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body class="">
<div class="wrap">
			
	<div id="header">				
		<div class="headerwrap">
			<div id="headerin">
				<h1><a href="../" class="logo"><img src="/resources/assets/img/logoBLUE.png" alt="로고" style="height:60px;"/></a></h1>		
					<nav class="gnb">
						<ul>
						
							<li class="menu last">
								<button class="btn_sumit ml네일아트" onclick="document.location.href='/logout';">로그아웃</button><button class="btn_sumit blbtn ml네일아트" onclick="document.location.href='/';">홈페이지</button>
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
			<li class="smenu" style="background-color:#4D6794; color:white;"><a href='javascript:void(0);' ><h1>기숙사관리시스템 : ${domitoryName}</h1></a></li>
			<li class="smenu"><a href="/admin/adminMember">회원관리</a>
				<ul class="sub ">
					<li ><a href="/admin/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
				</ul>	
			</li>	
			<li class="smenu"><a href="/admin/board">커뮤니티관리</a></li>
			<li class="smenu"><a href="/admin/coupon" >식권관리</a></li>
			<li class="smenu"><a href="/admin/popular" >외박관리</a></li>
			<li class="smenu"><a href="#" >시설관리</a>
				<ul class="sub ">
				   <li ><a href="/admin/analyze">시설물 신고내역</a></li>
				   <li ><a href="/admin/enroll">시설등록</a></li>
				   <li ><a href="/admin/domitory">기숙사(동) 등록</a></li>
				</ul>   
			 </li>
	
			<li class="smenu"><a href="/admin/calendar" >일정관리</a></li>
			<li class="smenu"><a href="/admin/sail" >회원파일등록</a></li>
			<li class="smenu"><a href="/admin/RollCall" class="msub on" >점호관리</a></li>
			<li class="smenu"><a href="/admin/sail" >통계관리</a></li>
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


//화면 로딩시 점호 리스트 출력
$(document).ready(function(){
	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/admin/onallRollCallMember",
		success : function(data) {
			console.log("ondata : "+data);
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
			    			'<td class="tac bgc">'+data[index].rollCallDate+'</td>'+
			    			'<td style="text-align: center;">'+data[index].memberId+'</td>'+
			    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
			    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert(data+": 로드 실패");
		}
	});
	notcall();
});

//날짜별로 검색
function search(){
	/* 선택한 날짜 값 가져오기 */
	var start = $('#start').val();
	console.log(start);
	$.ajax({
		type : "GET",
		url : "/admin/allRollCallMember?date=" + start,
		success : function(result) {
			console.log("성공");
			// console.log(result);

			$('#whichdate').empty();
			$('#whichdate').append("검색 날짜 [" + start + "]");

			$('#table').empty();
			let contents = ``
			//table에 추가
			$.each(result, function(index, rollcall){
				console.log(rollcall);
				contents += `<tr>
								<td  style="text-align: center">` + rollcall.rollCallDate  + `</td>
								<td style="text-align: center">` + rollcall.memberId + `</td>
								<td style="text-align: center">` + rollcall.domitoryName + `</td>
							</tr>`
			})
			
			$('#table').append(contents);
		},
		error : function(data) {
			console.log("실패")
		}
	});
}

let notCallMembers;

//점호 안한 놈
function notcall(){
	var start = $('#start').val();
	$.ajax({
		type : "GET",
		url : "/admin/notRollCall?date=" + start,
		success : function(result) {
			console.log("성공");
			// console.log(result);
			notCallMembers = result;
			$('#nottable').empty();
			let contents = '';

			$.each(result, function(index, m){
				// console.log(m);
				contents += `<tr>
								<td  style="text-align: center">` + m.memberId  + `</td>
								<td style="text-align: center">` + m.name + `</td>
								<td style="text-align: center">` + m.domitoryName + " " + m.room + "호" + `</td>
							</tr>`
			})
			$('#nottable').append(contents);
		},
		error : function(data) {
			console.log("실패")
		}
	});
}

function todaysearch(){

	let today = new Date();
	let todayf = dateFormatter(today);
	console.log(todayf)
	$('#start').val(todayf)

	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/admin/onallRollCallMember",
		success : function(data) {
			console.log("ondata : "+data);
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
			    			'<td class="tac bgc">'+data[index].rollCallDate+'</td>'+
			    			'<td style="text-align: center;">'+data[index].memberId+'</td>'+
			    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
			    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
			$('#whichdate').empty();
			$('#whichdate').append("검색 날짜 [" + data[0].rollCallDate + "]");
			// $('#start').empty();
			// $('#start').attr('value', 'data[0].rollCallDate')
			notcall();
		},
		error : function(data) {
			alert(data+": 로드 실패");
		}
	});
	// notcall();
}

function execution(){
	//벌점 부여 ajax
	console.log(notCallMembers);
	let data = []
	$.each(notCallMembers, function(index, m){
		data.push(m.memberId);
	})
	console.log(data);
	$.ajax({
		type: "POST",
            url: "/admin/execution",
            data: {data:data},
			success:function(result){
				console.log(result)
				$('#execution').remove();
				$('#hjmsg').append("벌점 부여 완료")


			},
			error:function(e){
				console.log("에러")
			}

	})
}


</script>


</div>	<div class="con">
		<h3 class="sub_h3">점호관리 <span>점호 회원</span></h3>	

<div class="bmb">
	<div class="bgtab">
		<h3 class="txtin">점호 회원 조회</h3>	
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
				<select name="search_type" class="fSelect">
					<option value="name">회원 명</option>
				</select>
				<input type="text" id="likesearch" class="w60" style="width:233px;"/>
				<ul class="dpi_li dpi">
					<li><button type="button" class="btn_sumit2" onclick="likesearch()">검색</button></li>
				</ul>
			</td>				
		</tr>	
		<%
		// 현재 날짜/시간
		Date now = new Date();
		// 포맷팅 정의
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 포맷팅 적용
		String date = formatter.format(now);
		%>	
		<tr>
			<th>기간</th>
			<td colspan="3">
				<input class="form-select1" type="date" id="start" name="trip-start" value="<%=date%>">
				<ul class="dpi_li dpi">
					<li><button id="today" onclick="todaysearch();notcall();" class="btn_sumit">오늘 날짜</button></li>
					<li><button type="button" class="btn_sumit2" onclick="search(); notcall()">검색</button></li>
				</ul>
			</td>				
		</tr>
	</table>
	<div class="ok_btn">
<!-- 		<ul>
			<li><button type="button" class="btn_sumit2" onclick="search()">검색</button></li>
		</ul> -->
	</div>	
</div>	
<div class="ofh">
	<div class="halfcon mr">
		<h4 class="bgtab bgtab2">점호완료	<p id="whichdate" class="txtin wtTxt fsbb">오늘 <%=date%> </p></h4>
			<table class="comm_table mb">
				<thead>
					<tr>
						<th>점호 일자</th>
						<th>회원 ID</th>
						<th>기숙사</th>					
					</tr>
				</thead>
				<tbody id="table">
				</tbody>
			</table>
	</div>
	<div class="halfcon">
		<h4 class="bgtab bgtab2">무단 외박 <button id="execution" onclick="execution()">일괄벌점부여</button><small id="hjmsg" sytle="color:blue;"></small></h4>
		<table id="nightoverY" class="comm_table tac bmb">
			<thead>
				<tr>
					<th>회원 ID</th>
					<th>이름</th>
					<th>기숙사</th>
				</tr>
			</thead>
			<tbody id="nottable">

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
	<!-- litebox -->
	<!-- <script type="text/javascript" src="resources/assets/js/hs_draggable.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/jquery-ui.min.js"></script> -->
	<link rel="stylesheet" media="all" href="/resources/assets/css/litebox.css" />
	<!-- <script type="text/javascript" src="resources/assets/js/litebox.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/backbone.js"></script> -->
	<!-- <script type="text/javascript" src="resources/assets/js/images-loaded.min.js"></script> -->
	<!-- litebox -->
	


</html>