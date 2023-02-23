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

<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon" />
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
			<li class="smenu"><a href="#" class="msub on">시설관리</a>
				<ul class="sub ">
				   <li ><a href="/admin/analyze" class="msub on">시설물 신고내역</a></li>
				   <li ><a href="/admin/enroll">시설등록</a></li>
				   <li ><a href="/admin/domitory">기숙사(동) 등록</a></li>
				</ul>   
			 </li>
	
			<li class="smenu"><a href="/admin/calendar" >일정관리</a></li>
			<li class="smenu"><a href="/admin/sail" >회원파일등록</a></li>
			<li class="smenu"><a href="/admin/RollCall" >점호관리</a></li>
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


//화면 로딩시 신고 리스트 출력
$(document).ready(function(){
	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/facility/print",
		contentType: "application/json; charset=UTF-8",
		success : function(data) {
			console.log("data : "+data);
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
			    			'<td class="tac bgc">'+data[index].facilityDate+'</td>'+
			    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
			    			'<td style="text-align: center;">'+data[index].domitoryFloor+'</td>'+
			    			'<td style="text-align: center;">'+data[index].facilityName+'</td>'+
			    			'<td style="text-align: center;">'+data[index].name+'</td>'+
			    			'<td style="text-align: center;">'+data[index].facilityReport+' </td>'+
			    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert(data+": 로드 실패");
		}
	});
});

//날짜별로 정렬하기
function search(){
	/* 선택한 날짜 값 가져오기 */
	var start = $('#start').val();
	var end = $('#end').val();
	var data = [start,end];
	var tabledata = "";
	console.log(start+"/"+end);
	$.ajax({
		type : "POST",
		url : "/adminAnalyze/searchDate",
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			"data" : data,
		}, 
		success : function(data) {
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
		    			'<td class="tac bgc">'+data[index].facilityDate+'</td>'+
		    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].domitoryFloor+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].name+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityReport+' </td>'+
		    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert("시설물 신고 데이터 불러오기 실패");
		}
	});
}

//오늘날짜 목록 가져오기
function todaysearch(){
	/* 선택한 날짜 값 가져오기 */
	var data = ["today","today"];
	var tabledata = "";
	console.log(today);
	$.ajax({
		type : "POST",
		url : "/adminAnalyze/searchDate",
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			"data" : data,
		}, 
		success : function(data) {
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
		    			'<td style="text-align: center;">'+data[index].facilityDate+'</td>'+ 
		    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].domitoryFloor+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].name+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityReport+'</td>'+
		    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert("시설물 신고 데이터 불러오기 실패");
		}
	});
}
//이름으로 정렬하기
function likesearch(){
	/* 선택한 날짜 값 가져오기 */
	var data = $('#likesearch').val();
	var tabledata = "";
	console.log(today);
	$.ajax({
		type : "POST",
		url : "/adminAnalyze/likesearch",
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			"data" : data,
		}, 
		success : function(data) {
			 $.each(data, function(index) {	 
	                tabledata +=
	                	'<tr class="tar">'+
		    			'<td style="text-align: center;">'+data[index].facilityDate+'</td>'+ 
		    			'<td style="text-align: center;">'+data[index].domitoryName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].domitoryFloor+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityName+'</td>'+
		    			'<td style="text-align: center;">'+data[index].name+'</td>'+
		    			'<td style="text-align: center;">'+data[index].facilityReport+'</td>'+
		    		'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert("시설물 신고 데이터 불러오기 실패");
		}
	});
}
</script>


</div>	<div class="con">
		<h3 class="sub_h3">시설관리 <span>시설물 신고내역</span></h3>	

<div class="bmb">
	<div class="bgtab">
		<h3 class="txtin">시설물 신고 내역 조회</h3>	
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
					<option value="name">시설물 명</option>
					<!-- <option value="phone">브랜드코드</option>
					<option value="mobile">제품코드</option> -->
				</select>
				<input type="text" id="likesearch" class="w60" style="width:233px;"/>
				<ul class="dpi_li dpi">
					<li><button type="button" class="btn_sumit2" onclick="likesearch()">검색</button></li>
				</ul>
			</td>				
		</tr>	
		<tr>
			<th>기간</th>
			<td colspan="3">
				<input class="form-select1" type="date" id="start" name="trip-start" value="연도-월-일">
				 - <input class="form-select1" type="date" id="end" name="trip-start" value="연도-월-일">&nbsp;&nbsp;
				<ul class="dpi_li dpi">
					<li><button id="today" onclick="todaysearch()" class="btn_sumit">오늘 날짜</button></li>
					<li><button type="button" class="btn_sumit2" onclick="search()">검색</button></li>
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


<div><!--날짜지정검색시-->
	<div class="bgtab bgtab2 ofh">
		<div class="w50 fl">
		<%
		// 현재 날짜/시간
		Date now = new Date();
		// 포맷팅 정의
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 포맷팅 적용
		String date = formatter.format(now);
		%>			
			<p id="whichdate" class="txtin wtTxt fsbb">오늘 날짜 [<%=date%>]</p>
		</div>
		
	</div>
</div><!--날짜지정검색시 e-->


<table class="comm_table mb">
<!-- 	<colgroup>
		<col width="16.66%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="33.32%">

	</colgroup> -->
	<thead>
		<tr>
			<th rowspan="2">일자</th>
			<th colspan="4">상세내역</th>
			<th rowspan="3">상세 사유</th>					
		</tr>
		<tr>
			<th>기숙사 동</th>
			<th>기숙사 층</th>
			<th>시설물</th>
			<th>신고자 (학번)</th>
			
			
		</tr>
	</thead>
	<tbody id="table">
	</tbody>
</table>





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