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

<!-- Jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
<!-- Sweet Alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
							<li class="smenu" style="background-color:#4D6794; color:white;"><a href="/admin/coupon">
									<h1>기숙사 통합관리 솔루션</h1>
								</a></li>
							<li class="smenu"><a href="/admin/adminMember" class="msub ">회원관리</a>
								<ul class="sub ">
									<li><a href="/admin/adminMember">회원현황</a></li>
									<li><a href="../sub01/sub01_02.php">벌점관리</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/board">커뮤니티관리</a>
							<li class="smenu"><a href="/admin/coupon" class="msub on">식권관리</a></li>
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
	//페이지 로딩시 일정 리스트 로드
	load();
});

//메뉴 등록
function insert(){
	/* 셀렉트 옵션 값 가져오기 */
	var menuname = $('#menuname').val();
	var charge = $('#charge').val();
	var menu = [menuname, charge];
	console.log("menu : "+menu);
	var tabledata = "";
	
	$.ajax({
		type : "POST",
		url : "/coupon/insert",
		data : {
			"menu" : menu,
		}, 
		success : function(data) {
			$('#menuname').val('');
			$('#charge').val('');
			load();
		},
		error : function(data) {
			alert("일정 등록 실패");
		}
	});
}
//메뉴 삭제(상태값 22로 업데이트)
function confirm(menu) {
	var tr = $(menu).closest('tr');
	let index = tr.find('input[type=hidden]').val();
	let datas = { "idx": index };
	console.log(datas);

	//ajax로 업데이트 함 (confirm N->Y)
	$.ajax({
		type: "get",
		url: "/coupon/delete",
		dataType: "json",
		data: datas,
		success: function (result) {
			console.log(result);
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
		url : "/coupon/print",
		success : function(data) {
			console.log(data);
			 $.each(data, function(index,menu) {
	                tabledata +=
	                	'<tr>'+
							'<td style="text-align:center;">'+data[index].menuidx+'</td>'+
							'<td style="text-align:center;">'+data[index].menu+'</td>'+
							'<td style="text-align:center;">'+data[index].menuPrice+'</td>'+
							'<td style="text-align:center;"><button onclick="confirm(this)">삭제</button></td>'+
							'<input type="hidden" value="' + menu.menuidx + '" >'+
						'</tr>'
	                    })
			$('#table').empty();
			$('#table').append(tabledata);
		},
		error : function(data) {
			alert("메뉴 불러오기 실패");
		}
	});
}
</script>

</div>	<div class="con">
		<h3 class="sub_h3">식권관리 <span></span></h3>

<!-- 식권 검색 -->
<div class="coupon_top bmb">
	<h3 class="bgtab txtin">메뉴 현황 보기</h3>	
</div>
<!-- 식권 검색 e-->

<!-- 식권 목록 -->
<div class="ofh">
<div class="halfcon mr">
<div class="coupon">
	<div class="bgtab bgtab2">
		<div class="ofh mb10">	
		<select name="" class="dpi">
			<option value="">10개씩보기</option>
			<option value="">20개씩보기</option>
			<option value="">30개씩 보기</option>
			<option value="">50개씩 보기</option>
		</select>
	</div>
	</div>
	<table class="comm_table tac bmb">	
		<tr>
			<th>식권번호</th>
			<th>메뉴이름</th>
			<th>가격</th>
			<th>처리</th>
		</tr>
		<tbody id="table">
		</tbody>
	</table>
</div>
</div>
<!-- 식권 목록 e-->



<!-- 식권 등록 -->
<div class="halfcon">
<div class="coupon_write bmb" style="margin-bottom:20px !important">
	<div class="bgtab bgtab2">
		<div class="w70 fl">
			<h4>식권 등록</h4>
		</div>
	</div>
	<table class="comm_table mb" style="margin-bottom: 0 !important">
		<colgroup>
			<col width="150px"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>메뉴이름 <span class="blTxt">*</span></th>
			<td><input type="text" id="menuname" class="w60"/></td>			
		</tr>
		<tr>
			<th>금액 <span class="blTxt">*</span></th>
			<td>				
				<input id="charge" type="text"/> 원
			</td>
		</tr>	
		
		
	</table>

</div>






	<div class="ok_btn">
		<ul>
			<li><button onclick="insert()" type="button" class="btn_sumit2">식권생성</button></li>
		</ul>
	</div>
</div> 
</div>
</div>
<!-- 식권 등록 end-->





		</div><!--con-->
	</div><!--subcon-->





		<div id="footer">
		<p>Copyright(c) 기숙사 통합 관리 시스템. All rights reserved. supported by ttac.</a></p>
	</div>

	<div id="pageup">
	</div>
</div><!--wrap-->




</body>

	


</html>