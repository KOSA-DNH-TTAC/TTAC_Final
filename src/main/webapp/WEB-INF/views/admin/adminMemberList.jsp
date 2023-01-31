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
			<li class="smenu"><a href="/adminMember" class="msub on">회원관리</a>
				<ul class="sub ">
					<li ><a href="/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
				</ul>	
			</li>	
			<li class="smenu"><a href="/adminCoupon" >식권관리</a></li>
			<li class="smenu"><a href="/adminPopular" >외박관리</a></li>
			<li class="smenu"><a href="/adminAnalyze">시설관리</a>
				<ul class="sub ">
					<li ><a href="/adminAnalyze">시설관리</a></li>
					<li ><a href="/adminEnroll">시설등록</a></li>
				</ul>	
			</li>
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
		<h3 class="sub_h3">회원관리 <span>회원현황</span></h3>
<div class="bmb">
	<div class="bgtab">
		<div class="w50 fl">
			<h3 class="txtin">회원 조회</h3>	
		</div>
		<div class="w50 fl tar">
			<a  class="btn_sumit2"">엑셀다운로드</a>
		</div>
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
				<div class="txtin">
					<label class="mr10"><input type="radio" value=""> 전체</label>  
					<label class="mr10"><input type="radio" value=""> 학번</label>  
					<label class="mr10"><input type="radio" value=""> 이름</label>
					<label class="mr10"><input type="radio" value=""> 학과</label>
				</div>
			</td>				
		</tr>	
		<tr>
			<th>기간</th>
			<td colspan="3">
				<input class="form-select1" type="date" id="start" name="trip-start" value="2000-10-04">
				 - <input class="form-select1" type="date" id="end" name="trip-start" value="2000-10-04">&nbsp;&nbsp;
				<ul class="dpi_li dpi">
					<li><a href="#" class="btn_sumit">전체</a></li>
				</ul>
			</td>				
		</tr>
	</table>
	<div class="ok_btn">
		<ul>
			<li><button type="button" class="btn_sumit2" onclick="();">검색</button></li>
		</ul>
	</div>	
</div>

<div class="ofh">
	<div class="halfcon mr">		
		<h4 class="bgtab bgtab2">회원 목록</h4>
		<table class="comm_table tac bmb">	
			<tbody>
				<tr>		
					<th>순번</th>
					<th colspan="2">이름</th>
					<th>학번</th>
					<th>학과</th>
					<th>전화</th>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">임준한</td>
					<td>20171839</td>	
					<td>실버산업</td>
					<td>01012345678</td>					
				</tr>
				<tr>
					<td>2</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">도현정</td>
					<td>20135241</td>	
					<td>귤감별사</td>
					<td>01012345678</td>					
				</tr>
				<tr>
					<td>3</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">고범종</td>
					<td>20145875</td>	
					<td>해커학과</td>
					<td>01045678955</td>					
				</tr>
				<tr>
					<td>4</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">박예빈</td>
					<td>20157845</td>	
					<td>치킨학과</td>
					<td>01098745632</td>					
				</tr>
				<tr>
					<td>5</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">노현중</td>
					<td>맞장구치기</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>6</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">노다영</td>
					<td>난리부리기</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>7</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">경아리</td>
					<td>감말리기</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>8</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>9</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>10</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
			</tbody>
		</table>


	</div>
	<div class="halfcon">
		<h4 class="bgtab bgtab2">회원 목록</h4>
		<table class="comm_table tac bmb">	
			<tbody>
				<tr>		
					<th>순번</th>
					<th colspan="2">이름</th>
					<th>학번</th>
					<th>학과</th>
					<th>전화</th>
				</tr>
				<tr>
					<td>1</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>2</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>3</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>4</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>5</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>6</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>7</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>8</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>9</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
				<tr>
					<td>10</td>
					<td><img src="../img/no_img.gif" width="50px" alt=""/></td>
					<td class="tal">회원이름</td>
					<td>20,000원</td>	
					<td>103</td>
					<td>10</td>					
				</tr>
			</tbody>
		</table>
	</div>
</div>



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