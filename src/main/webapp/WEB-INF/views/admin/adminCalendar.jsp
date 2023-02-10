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
			<li class="smenu" style="background-color:#4D6794; color:white;"><a href="/adminCoupon" ><h1>기숙사 통합관리 솔루션</h1></a></li>
			<li class="smenu"><a href="/admin/adminMember">회원관리</a>
				<ul class="sub ">
					<li ><a href="/admin/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
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
					<li ><a href="/admin/analyze">시설관리</a></li>
					<li ><a href="/admin/enroll">시설등록</a></li>
					<li ><a href="/admin/domitory">기숙사(동) 등록</a></li>
				</ul>	
			</li>
			<li class="smenu"><a href="/admin/calendar" class="msub on">일정관리</a></li>
			<li class="smenu"><a href="/admin/sail" >통계관리</a></li>
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
		<h3 class="sub_h3">일정관리 <span></span></h3>

<div class="coupon_top bmb">
	<h3 class="bgtab txtin">일정 추가 / 수정</h3>	

</div>

<!--일정정보-->
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
			<th>날짜</th>
			<th>일정제목</th>
			<th>일정내용</th>
		</tr>
		<tr>
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">박예빈 소방훈련</td>
			<td>소방의 날</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">고범종 지진대피훈련</td>
			<td>지진의 날</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">도현정 위장훈련</td>
			<td>군인의 날</td>
		</tr>
		<tr class="bgc">
			<td><input type="checkbox" value=""/></td>
			<td>200170800001</td>
			<td class="tal">임준한 김장체험</td>
			<td>세계 김치의 날</td>
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
			<th>날짜선택 <span class="blTxt">*</span></th>
			<td><input class="form-select1" type="date" id="start" name="trip-start" value="2000-10-04">
				 - <input class="form-select1" type="date" id="end" name="trip-start" value="2000-10-04">&nbsp;&nbsp;</td>			
		</tr>
		<tr>
			<th>일정제목 <span class="blTxt">*</span></th>
			<td><input type="text" class="w60"/></td>			
		</tr>
		<tr>
			<th>일정내용 <span class="blTxt">*</span></th>
			<td>				
				<input type="text"/> 
			</td>
		</tr>	
		
		
	</table>

</div>
<!--쿠폰등록 e-->






	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2">일정등록</button></li>
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
		<link rel="stylesheet" media="all" href="/resources/assets/css/litebox.css" />
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