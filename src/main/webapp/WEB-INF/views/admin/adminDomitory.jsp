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
			<li class="smenu"><a href="/adminMember">회원관리</a>
				<ul class="sub ">
					<li ><a href="/adminMember">회원현황</a></li>
					<li ><a href="../sub01/sub01_02.php">벌점관리</a></li>
				</ul>	
			</li>
			<li class="smenu"><a href="/adminCoupon" >식권관리</a></li>
			<li class="smenu"><a href="/adminPopular" >외박관리</a></li>
			<li class="smenu"><a href="/adminAnalyze" class="msub on">시설관리</a>
				<ul class="sub ">
					<li ><a href="/adminAnalyze">시설관리</a></li>
					<li ><a href="/adminEnroll">시설등록</a></li>
					<li ><a href="/adminDomitory">기숙사(동) 등록</a></li>
				</ul>	
			</li>
			<li class="smenu"><a href="adminCalendar" >일정관리</a></li>
			<li class="smenu"><a href="/adminSail" >통계관리</a></li>
		</ul>

    </nav>
<script>
$(document).ready(function(){
	var tabledata = "";
	$.ajax({
		type : "GET",
		url : "adminAnalyze/domitoryPrint",
		/* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */ 
		success : function(data) {
			console.log("data : "+data);
			$('#item').val('');
			 $.each(data, function(index) {
	                tabledata +=
	                	'<tr class="tar">'+
	                	'<td class="tal" style="text-align:center;">'+data[index].domitoryIdx+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].domitoryName+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].domitoryFloor+'</td>'+
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
	var tabledata = "";
	var item = $('#item').val();
	var item2 = $('#item2').val();
	var domitory=[item, item2];
	console.log(item);
	$.ajax({
		type : "POST",
		url : "/adminAnalyze/insertDomitory",
		/* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */
		data : {
			"domitory" : domitory,
		}, 
		success : function(data) {
			console.log("data : "+data);
			$('#item').val('');
			$('#item2').val('');
			 $.each(data, function(index) {
				 tabledata +=
	                	'<tr class="tar">'+
	                	'<td class="tal" style="text-align:center;">'+data[index].domitoryIdx+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].domitoryName+'</td>'+
						'<td class="tal" style="text-align:center;">'+data[index].domitoryFloor+'</td>'+
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
		<h3 class="sub_h3">시설관리 <span>기숙사(동) 등록</span></h3>	

<div class="bmb">
	<div class="bgtab">
		<h3 class="txtin"> 건물(동) 정보 등록</h3>	
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

			<th>기숙사(동) 명</th>
			<td><input type="text" id="item" class="w40"/>	
			</td>
			<th>층 수</th>
			<td><input type="text" id="item2" class="w40"/>
				<span><button type="button" class="btn_sumit2" onclick="mySpaceReport();">등록</button></span>	
			</td>
		</tr>
	</table> 
</div>


<div><!--날짜지정검색시-->
	<div class="bgtab bgtab2 ofh">
		<div class="w50 fl">			
			<p class="txtin wtTxt fsbb">등록 건물(동) 정보</p>
		</div>
	</div>
</div><!--날짜지정검색시 e-->


<table class="comm_table mb">
	<thead>
		<tr>
			<th>순번</th>
			<th>등록 건물(동) 정보</th>		
			<th>층 수</th>			
		</tr>
	</thead>
	<tbody id="table">
	
	</tbody>
</table>





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