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
							<li class="smenu"><a href="/admin/adminMember" class="msub ">회원관리</a>
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
});

</script>

</div>	<div class="con">
		<h3 class="sub_h3">식권관리 <span></span></h3>

<!-- 식권 검색 -->
<div class="coupon_top bmb">
	<h3 class="bgtab txtin" style="text-align:left">식권 조회</h3>	
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
					<label class="mr10"><input type="radio" name="search">이름</label>  
					<input type="text" style="width:75%"></input>
					<button type="button" class="btn_submit3" style="float:right; width:100px;">검색</button>
				</div>
			</td>
		</tr>
	</table>
</div>
<!-- 식권 검색 e-->

<!-- 식권 목록 -->
<div class="ofh">
<div class="halfcon mr">
<div class="coupon">
	
	<div class="bgtab bgtab2">
		<div class="w70 fl">
			<h4>식권 목록</h4>
		</div>
	</div>
	<table class="comm_table tac bmb" id="allMenuList">			
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
			<th>메뉴 이름 <span class="blTxt">*</span></th>
			<td style="padding:4px"><input type="text" class="w60" id="insertname"/></td>			
		</tr>
		<tr>
			<th>금액 <span class="blTxt">*</span></th>
			<td style="padding:4px">				
				<input type="text" id="insertprice"/> 원
			</td>
		</tr>	
		
		
	</table>

</div>


	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" id="insertMenu">식권 등록</button></li>
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
<!--wrap-->




</body>


<script type="text/javascript">

$(document).ready(function() {
	getAllMenuList();
})

// 메뉴 목록
function getAllMenuList(){
	$.ajax({
			type: "get",
			url: "/coupon/list",
			success: function (result) {

				$('#allMenuList').empty();
				let contents = `<tbody>` +
			`<tr>
				<th width="10%">번호</th>
				<th width="20%">기숙사</th>
				<th width="25%">메뉴</th>
				<th width="15%">가격</th>
				<th width="15%">수정</th>
				<th width="15%">삭제</th>
			</tr>`
			
			$.each(result, function(index, menu){
			
				contents += `<tr class="menurow">
					<td><b>` + (++index) +`</b><div class='menuidx' style="display:none">`
					+ menu.menuidx
					+ `</div></td><td class="menutd">`
					+ menu.domitoryName
					+ `<td class="menutd"><div class="menuname">` 
					+ menu.menu + `</div></td>
					<td class="menutd"><div class="menuprice">` + menu.menuPrice + `</div></td>
					<td class="menuBtn"><div class='menuUpdate'>수정</div></td>
					<td class="menuBtn"><div class='menuDelete'>삭제</div></td>
				</tr>`

			})
			contents += `</tbody></table>`;
			$('#allMenuList').append(contents);
			
			}
		})
	}
	
// 버튼 변경 이벤트
$(document).on("click", ".menuUpdate", function() {
	var row = $(this).closest(".menurow");
	var idx = row.find(".menuidx").text();
	var name = row.find(".menuname").text();
	var price = row.find(".menuprice").text();
	
	row.find(".menuname").html("<input type='text' style='width:95%' class='nameInput' placeholder='" + name + "' value='" + name + "' />");
	row.find(".menuprice").html("<input type='text' style='width:95%' class='priceInput' placeholder='" + price + "' value='" + price + "' />");
	$(this).html("완료").removeClass("menuUpdate").addClass("menuComplete");
});

// 메뉴 수정
$(document).on("click", ".menuComplete", function() {
	var row = $(this).closest(".menurow");
	var name = row.find(".nameInput").val();
	var price = row.find(".priceInput").val();
	var idx = row.find(".menuidx").text();

	row.find(".menuname").text(name);
	row.find(".menuprice").text(price);
	$(this).html("수정").removeClass("menuComplete").addClass("menuUpdate");
	
	$.ajax({
		type: "post",
		url: "/coupon/update",
		data : {
			"idx" : idx,
			"name": name,
			"price": price,
		}, 
		success: function(data) {
			
		}
	})
}); 

$(document).on("click", ".menuDelete", function() {
	var row = $(this).closest(".menurow");
	var idx = row.find(".menuidx").text();	
	
	Swal.fire({
		title: '삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#e96b56',
		cancelButtonColor: 'grey',
		confirmButtonText: 'DELETE'
		}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type: "get",
				url: "/coupon/delete",
				data: {
					"idx": idx,
				},
				success: function(data) {
					getAllMenuList();
				}
			}) // ajax end
		}
		})
}) // document.on end

// 메뉴 추가
$(document).on("click", "#insertMenu", function() {
	var name = $('#insertname').val();
    var price = $('#insertprice').val();
        
    $.ajax({
    	type: "post",
    	url: "/coupon/insert",
    	data: {
    		"name": name,
    		"price": price,
    	},
    	success: function (data) {
    		getAllMenuList();
    		document.getElementById('insertname').value = '';
    		document.getElementById('insertprice').value = '';
    	}
    })
}) // document.on end



</script>
	


</html>