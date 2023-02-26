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
								<button class="btn_sumit ml" onclick="document.location.href='/logout';">로그아웃</button><button class="btn_sumit blbtn ml" onclick="document.location.href='/';">홈페이지</button>
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
							<li class="smenu"><a href="/admin/analyze" class="msub on">시설관리</a>
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
$(document).ready(function(){
	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/itemPrint",
		success : function(data) {
			$('#item').val('');
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
	                	'<td class="tal" style="text-align:center;">'+data[index].facilityIdx+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].facilityName+'</td>'+
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

function mySpaceReport(){
	var item = $('#item').val();
	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/insertItem",
		data : {
			"item" : item,
		}, 
		success : function(data) {
			alert("시설물 등록성공");
			$('#item').val('');
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
	                	'<td class="tal" style="text-align:center;">'+data[index].facilityIdx+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].facilityName+'</td>'+
						'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert(data+": 등록실패");
		}
	});
 }	   

</script>

</div>	<div class="con">
		<h3 class="sub_h3">시설관리 <span>시설등록</span></h3>	

<div class="bmb">
	<div class="bgtab">
		<h3 class="txtin"> 건물 정보 / 시설물 등록</h3>	
	</div>
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="20%"/>
		</colgroup>
		<tr>

			<th>시설물</th>
			<td><input type="text" id="item" class="w40"/>
				<span><button type="button" class="btn_sumit2" onclick="mySpaceReport();">등록</button></span>	
			</td>
		</tr>
	</table> 
</div>


<div><!--날짜지정검색시-->
	<div class="bgtab bgtab2 ofh">
		<div class="w50 fl">			
			<p class="txtin wtTxt fsbb">등록 시설물 정보</p>
		</div>
	</div>
</div><!--날짜지정검색시 e-->


<table class="comm_table mb">
	<thead>
		<tr>
			<th>순번</th>	
			<th>등록 시설물</th>				
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


	<script type="text/javascript">
		$("#pageup").pageup();
	</script>
	


</html>