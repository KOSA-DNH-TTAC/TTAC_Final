<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
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
			<li class="smenu" style="background-color:#4D6794; color:white;"><a href='javascript:void(0);' ><h1>기숙사 통합관리 솔루션</h1></a></li>
			<li class="smenu"><a href="/admin/adminMember">회원관리</a>
				<ul class="sub ">
					<li ><a href="/admin/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
				</ul>	
			</li>	
			<li class="smenu"><a href="/admin/board">커뮤니티관리</a>
			<li class="smenu"><a href="/admin/coupon" >식권관리</a></li>
			<li class="smenu"><a href="/admin/popular" >외박관리</a>
			</li>
			<li class="smenu"><a href="/admin/analyze">시설관리</a>
				<ul class="sub ">
					<li><a href="/admin/analyze">시설관리</a></li>
					<li><a href="/admin/enroll">시설등록</a></li>
				</ul>
			</li>
				<ul class="sub ">
				   <li ><a href="/admin/analyze">시설관리</a></li>
				   <li ><a href="/admin/enroll">시설등록</a></li>
				   <li ><a href="/admin/domitory">기숙사(동) 등록</a></li>
				</ul>   
			 </li>
	
			<li class="smenu"><a href="/admin/calendar" class="msub on">일정관리</a></li>
			<li class="smenu"><a href="/admin/file" >회원파일등록</a></li>
			<li class="smenu"><a href="/admin/sail" >통계관리</a></li>
			<li class="smenu"><a href="/admin/qr">식권QR</a></li>
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
	
	//페이지 로딩시 일정 리스트 로드
	load();
	
});

//신고 접수
function insert(){
	/* 셀렉트 옵션 값 가져오기 */
	var date = $('#date').val();
	var title = $('#title').val();
	var content = $('#content').val();
	var plan = [date, title, content];
	console.log("plan : "+plan);
	var tabledata = "";
	
	$.ajax({
		type : "POST",
		url : "/calendar/insert",
		data : {
			"plan" : plan,
		}, 
		success : function(data) {
			$('#title').val('');
			$('#content').val('');
			$('#date').val('연도-월-일');
			load();
		},
		error : function(data) {
			alert("일정 등록 실패");
		}
	});
}
//일정 삭제(상태값 22로 업데이트)
function confirm(schedule) {
	var tr = $(schedule).closest('tr');
	let index = tr.find('input[type=hidden]').val();
	let datas = { "idx": index };
	console.log(datas);

	//ajax로 업데이트 함 (confirm N->Y)
	$.ajax({
		type: "get",
		url: "/calendar/update",
		dataType: "json",
		data: datas,
		success: function (result) {
			console.log(result);
			//테이블에 append 해줌 (getTodays)
			load();
		},
		error: function (request, status, error) {
			console.log("에러")
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
}

//테이블 생성
function load(){
	var tabledata = "";
	$.ajax({
		type : "POST",
		url : "/calendar/print",
		success : function(data) {
			 $.each(data, function(index,schedule) {
	                tabledata +=
	                	'<tr>'+
							'<td style="text-align:center;">'+data[index].scheduleDate+'</td>'+
							'<td style="text-align:center;">'+data[index].scheduleTitle+'</td>'+
							'<td style="text-align:center;">'+data[index].scheduleContent+'</td>'+
							'<td style="text-align:center;"><button onclick="confirm(this)">삭제</button></td>'+
							'<input type="hidden" value="' + schedule.scheduleIdx + '" >'+
						'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert("일정 등록 실패");
		}
	});
}
</script>

</div>	<div class="con">
		<h3 class="sub_h3">일정관리 <span></span></h3>

<div class="coupon_top bmb">
	<h3 class="bgtab txtin">일정 추가 / 수정</h3>	

</div>

<!--일정정보-->
<div class="coupon">
	
	<div class="bgtab bgtab2">
	<p>일정 목록</p>
	</div>
	<table class="comm_table tac bmb">	
		<tr>
			<!-- <th><input type="checkbox" value=""/></th> -->
			<th>날짜</th>
			<th>일정제목</th>
			<th>일정내용</th>
			<th>처리</th>
		</tr>
		<tbody id="table">
		</tbody>
	</table>
</div>
<!--쿠폰정보 e-->



<!--쿠폰등록-->
<div class="coupon_write bmb">
	<h4 class="tit_nm">쿠폰등록</h4>
	<table class="comm_table mb">
		<colgroup>
			<col width="180px"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>날짜선택 <span class="blTxt">*</span></th>
			<td><input id="date" class="form-select1" type="date" id="start" name="trip-start" value="연도-월-일">
		</tr>
		<tr>
			<th>일정제목 <span class="blTxt">*</span></th>
			<td><input id="title" type="text" class="w60"/></td>			
		</tr>
		<tr>
			<th>일정내용 <span class="blTxt">*</span></th>
			<td>				
				<input id="content" type="text"/> 
			</td>
		</tr>	
		
		
	</table>

</div>
<!--쿠폰등록 e-->






	<div class="ok_btn">
		<ul>
			<li><button onclick="insert()" type="button" class="btn_sumit2">일정등록</button></li>
		</ul>
	</div>
</div> 
<!--쿠폰등록 e-->





		</div><!--con-->
	</div><!--subcon-->





		<div id="footer">
		<p>Copyright(c) 기숙사 통합 관리 시스템. All rights reserved. supported by DOTO.</a></p>
	</div>

	<div id="pageup">
	</div>
</div><!--wrap-->




</body>





</html>