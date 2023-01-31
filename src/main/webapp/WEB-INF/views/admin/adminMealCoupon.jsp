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
<link href="resources/assets/css/font.css" rel="stylesheet">
<link href="resources/assets/css/font-awesome.css" rel="stylesheet">
<link href="resources/assets/css/style2.css" rel="stylesheet">
<link href="resources/assets/css/program.css" rel="stylesheet">
<link href="resources/assets/css/layout.css" rel="stylesheet">
<link href="resources/assets/css/menu.css" rel="stylesheet">
<link href="resources/assets/css/category.css" rel="stylesheet">
<link href="resources/assets/css/graph.css" rel="stylesheet">

<script type="text/javascript" src="resources/assets/js/pg_script.js"></script>
<script type="text/javascript" src="resources/assets/js/jquery-2.1.4.js"></script>

<script type="text/javascript" src="resources/assets/js/jquery-ui-1.7.2.custom.min.js"></script>
<!--<script type="text/javascript" src="../js/jquery.menu-aim.js"></script>-->
<script type="text/javascript" src="resources/assets/js/jquery.tablednd.js"></script>

<script type="text/javascript" src="resources/assets/js/tytabs.jquery.min.js"></script>
<script type="text/javascript" src="resources/assets/js/tableDnDblog.js"></script>

<script type="text/javascript" src="resources/assets/js/menu.js"></script> <!-- Resource jQuery -->
<script type="text/javascript" src="resources/assets/js/modernizr.js"></script> <!-- Modernizr -->
<script type="text/javascript" src="resources/assets/js/jquery.flot.min.js"></script> <!--gap-->


<body class="">
<div class="wrap">
			
	<div id="header">				
		<div class="headerwrap">
			<div id="headerin">
				<h1><a href="../" class="logo"><img src="resources/assets/img/logoBLUE.png" alt="로고" style="height:60px;"/></a></h1>		
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
			<li class="smenu" style="background-color:#4D6794; color:white;"><a href="/adminCoupon" ><h1>기숙사 통합관리 솔루션</h1></a></li>
			<li class="smenu"><a href="/adminMember" class="msub ">회원관리</a>
				<ul class="sub ">
					<li ><a href="/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
				</ul>	
			</li>	
			<li class="smenu"><a href="/adminCoupon" class="msub on">식권관리</a></li>
			<li class="smenu"><a href="/adminPopular" >외박관리</a></li>
			<li class="smenu"><a href="/adminAnalyze">시설관리</a></li>
			<li class="smenu"><a href="adminCalendar" >일정관리</a></li>
			<li class="smenu"><a href="/adminSail" >통계관리</a></li>
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

<!--쿠폰검색-->
<div class="coupon_top bmb">
	<h3 class="bgtab txtin">발급쿠폰검색</h3>	
<!-- 
	<table class="srch_table mb20">	
		<colgroup>
			<col width="10%"/>
			<col width="40%"/>
			<col width="10%"/>
			<col width="40%"/>
		</colgroup>
		<tr>
			<th>쿠폰명</th>
			<td><input type="text" class="w40"/></td>
			<th>혜택구분</th>
			<td>
				<select name="benefit_type">
					<option value="" selected="">전체</option>
					<option value="A">할인금액</option>
					<option value="B">할인율</option>
					<option value="C">적립금액</option>
					<option value="D">적립율</option>
					<option value="E">기본배송비할인</option>
					<option value="F">즉시 적립</option>
					<option value="I">기본배송비할인+할인율</option>
					<option value="H">기본배송비할인+할인금액</option>
				</select>
			</td>
		</tr>	
		<tr>
			<th>발급구분</th>
			<td>
				<select id="fIssueType" name="issue_type">
					<option value="" selected="">전체</option>
					<option value="M">대상자 지정 발급</option>
					<option value="A">조건부 자동 발급</option>
					<option value="D">고객 다운로드 발급</option>
				</select>
			</td>
			<th>적용범위</th>
			<td>
				<select name="used_level_type">
					<option value="" selected="">전체</option>
					<option value="O">주문서 쿠폰</option>
					<option value="P">상품 쿠폰</option>
				</select>
			</td>
		</tr>	
		<tr>
			<th>생성일자</th>
			<td>
				<select id="fCreateDate" name="create_date_type">
					<option value="" selected="">전체</option>
					<option value="D">생성일자</option>
					<option value="P">생성기간</option>
				</select>
			</td>
			<th>삭제여부</th>
			<td>
				<select name="is_deleted">
					<option value="">전체</option>
					<option value="T">삭제</option>
					<option value="F" selected="">미삭제</option>
				</select>
			</td>
		</tr>	
	</table> 
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="();">검색</button></li>
		</ul>
	</div>	-->
</div>
<!--쿠폰검색e-->

<!--쿠폰정보-->
<div class="coupon">
	<div class="ofh mb10">	
		<select name="" class="dpi">
			<option value="">10개씩보기</option>
			<option value="">20개씩보기</option>
			<option value="">30개씩 보기</option>
			<option value="">50개씩 보기</option>
		</select>
	</div>
	
	<div class="bgtab bgtab2">
		<div class="w70 fl">
			<a href="#" class="btn_sumit">수정</a>
			<a href="#" class="btn_sumit2">삭제</a>
		</div>
	</div>
	<table class="comm_table tac bmb">	
		<tr>
			<th><input type="checkbox" value=""/></th>
			<th>식권번호</th>
			<th>메뉴이름</th>
			<th>가격</th>
		</tr>
		<tr>
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">돈까스</td>
			<td>6000 원</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">고구마</td>
			<td>7000 원</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">감자</td>
			<td>400 원</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">김치떡볶이</td>
			<td>10000 원</td>
		</tr>
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
			<th>메뉴이름 <span class="blTxt">*</span></th>
			<td><input type="text" class="w60"/></td>			
		</tr>
		<tr>
			<th>금액 <span class="blTxt">*</span></th>
			<td>				
				<input type="text"/> 원
			</td>
		</tr>	
		
		
	</table>

</div>
<!--쿠폰등록 e-->


<!-- 
<div class="coupon_info bmb">
	<h4 class="tit_nm">사용정보</h4>
	<table class="comm_table mb">
		<colgroup>
			<col width="180px"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>사용기간 <span class="blTxt">*</span></th>
			<td>
				<input type="text"><button class="btn_cal"></button>
				<select class="fSelect" name="start_hour" id="start_hour">
					<option value="0" selected="selected">00</option>
					<option value="1">01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>
				시&nbsp;&nbsp;
				<select class="fSelect" name="start_min" id="start_min">
					<option value="0" selected="selected">00</option>
					<option value="5">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
				분
				~
				<input type="text"><button class="btn_cal"></button>
				<select class="fSelect" name="start_hour" id="start_hour">
					<option value="0" selected="selected">00</option>
					<option value="1">01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>
				시&nbsp;&nbsp;
				<select class="fSelect" name="start_min" id="start_min">
					<option value="0" selected="selected">00</option>
					<option value="5">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
				분
				<ul class="dpi_li dpi">
					<li><a href="#" class="btn_sumit">오늘</a></li>
					<li><a href="#" class="btn_sumit">3일</a></li>
					<li><a href="#" class="btn_sumit">7일</a></li>
					<li><a href="#" class="btn_sumit">1개월</a></li>
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th>사용가능 기준금액 <span class="blTxt">*</span></th>
			<td>
			
				<input type="text"/> 원 이상 구매시
			</td>
		</tr>
		<tr>
			<th>동일쿠폰사용설정 <span class="blTxt">*</span></th>
			<td>
				주문서 당 <input type="text" class="w50p"/> 개 까지 사용가능
			</td>
		</tr>
		<tr>
			<th>중복쿠폰사용설정 <span class="blTxt">*</span></th>
			<td>
				<div class="txtin">
					<label class="mr10"><input type="radio" value=""> 사용가능</label>
					<label class="mr10"><input type="radio" value=""> 사용불가</label>			
				</div>
			</td>
		</tr>		
	</table>-->



	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2">식권생성</button></li>
		</ul>
	</div>
</div> 
<!--쿠폰등록 e-->





		</div><!--con-->
	</div><!--subcon-->





		<div id="footer">
		<p>Copyright(c)뷰티몰 쇼핑몰관리시스템. All rights reserved. supported by <a href="http://www.cmaru.com" target="_blank">크리에이티브마루.</a></p>
	</div>

	<div id="pageup">
	</div>
</div><!--wrap-->




</body>
<!-- litebox -->
		<script type="text/javascript" src="resources/assets/js/hs_draggable.js"></script>
		<script type="text/javascript" src="resources/assets/js/jquery-ui.min.js"></script>
		<link rel="stylesheet" media="all" href="resources/assets/css/litebox.css" />
		<script type="text/javascript" src="resources/assets/js/litebox.js"></script>
		<script type="text/javascript" src="resources/assets/js/backbone.js"></script>
		<script type="text/javascript" src="resources/assets/js/images-loaded.min.js"></script>
		<script type="text/javascript">
			$('.litebox').liteBox();
		</script>
<!-- litebox -->



	<script type="text/javascript">
		$("#pageup").pageup();
	</script>
	


</html>