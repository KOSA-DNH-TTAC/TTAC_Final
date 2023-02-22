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
 <!-- Apex Chart -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

		<!-- <script type="text/javascript" src="resources/assets/js/pg_script.js"></script> -->
		<!-- <script type="text/javascript" src="resources/assets/js/jquery-2.1.4.js"></script> -->

		<!-- <script type="text/javascript" src="resources/assets/js/jquery-ui-1.7.2.custom.min.js"></script> -->
		<!--<script type="text/javascript" src="../js/jquery.menu-aim.js"></script>-->
		<!-- <script type="text/javascript" src="resources/assets/js/jquery.tablednd.js"></script> -->

		<!-- <script type="text/javascript" src="resources/assets/js/tytabs.jquery.min.js"></script> -->
		<!-- <script type="text/javascript" src="resources/assets/js/tableDnDblog.js"></script> -->

		<!--<script type="text/javascript" src="resources/assets/js/menu.js"></script>  Resource jQuery -->
		<!-- <script type="text/javascript" src="resources/assets/js/modernizr.js"></script> Modernizr -->
		<!--<script type="text/javascript" src="resources/assets/js/jquery.flot.min.js"></script> gap-->

		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(function(){
	
	var longsleepoverCount= []; //관리자 통계 장기 외박
	var sleepoverCount= []; 	//관리자 통계 그냥 외박
	var sleepoverMonth= []; 	//관리자 통계 외박 달
	var year = $('#selectyear').val();
	var year1 = $('#selectyear1').val();
		
		$.ajax({
			type: "GET",
			url: "/adminachart/sleepover",
			data: {
	               "year": year,
	            },
			contentType: "application/json; charset=UTF-8",
			success: function (data) {
				// console.log(data);
				
				$.each(data, function(index, adminchart){

						longsleepoverCount.push(adminchart.longsleepoverCount);

						sleepoverCount.push(adminchart.sleepoverCount);	

					sleepoverMonth.push(adminchart.month);
					console.log("장기외박 :"+longsleepoverCount);
					console.log("외박 : "+sleepoverCount);
					console.log("sleepoverMonth : "+sleepoverMonth);
                })
                
                var options = {	
			        series: [{
			        	name: "외박",
			            data: sleepoverCount,
			        },
			        {
			        	name: "장기외박",
			            data: longsleepoverCount,
			        }],
			        xaxis: {
			            categories: sleepoverMonth,
			          },
			        chart: {
			            type: 'line',
			            height: 350
			        },
			        stroke: {
			            curve: 'smooth',
			        },
			        dataLabels: {
			            enabled: false
			        },
			        title: {
			            text: data[0].year+' 월별 외박 신청 현황',
			            align: 'left'
			        },
			        markers: {
			            hover: {
			                sizeOffset: 4
			            }
			        }
			    };
				
				 var chart = new ApexCharts(document.querySelector("#chart"), options);
				    chart.render();
                
			},
			error: function (request, status, error) {
				console.log("에러")
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
		/* 월별 외박 통계 END */
		
		/* 포인트 결제 차트 */
		/* $.ajax({
			type: "GET",
			url: "/adminachart/point",
			data: {
	               "year": year1,
	            },
			contentType: "application/json; charset=UTF-8",
			success: function (data) {
				console.log(data);
				
				$.each(data, function(index, adminchart){
					if(adminchart.status == 12){ //장기외박일 때
						longsleepoverCount.push(adminchart.sleepoverCount);
					}else if(adminchart.status == 11){ //외박일 때
						sleepoverCount.push(adminchart.sleepoverCount);	
					}
					console.log("결제자 수 :"+longsleepoverCount);
					console.log("총 결제금액 : "+sleepoverCount);
                })
                
                var options = {	
			        series: [{
			        	name: "결제자 수",
			            data: sleepoverCount,
			        },{
			        	name: "결제금액",
			            data: longsleepoverCount,
			        }],
			        xaxis: {
			            categories: [1,2,3,4,5,6,7,8,9,10,11,12]
			          },
			        chart: {
			            type: 'line',
			            height: 350
			        },
			        stroke: {
			            curve: 'smooth',
			        },
			        dataLabels: {
			            enabled: false
			        },
			        title: {
			            text: data[0].year+' 월별 포인트 결제자 수 및 월별 결제금액',
			            align: 'left'
			        },
			        markers: {
			            hover: {
			                sizeOffset: 4
			            }
			        }
			    };
				
				 var pointchart = new ApexCharts(document.querySelector("#pointchart"), options);
				 pointchart.render();
                
			},
			error: function (request, status, error) {
				console.log("에러")
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}) */

      //커뮤니티

      let month = [];
      let postCount = [];
      let replyCount = [];

      $.ajax({
			type: "GET",
			url: "/adminchart/community",
			data: {
	               "year": year,
	            },
			contentType: "application/json; charset=UTF-8",
			success: function (result) {
				console.log(result);
				
            $.each(result, function(index, adminchart){
               month.push(adminchart.month);
               postCount.push(adminchart.postCount);
               replyCount.push(adminchart.replyCount);
            })
				
            var options = {	
                     series: [{
                        name: "글",
                        data: postCount,
                        type: 'bar',
                     },{
                        name: "댓글",
                        data: replyCount,
                        type: 'line',
                     }],
                     xaxis: {
                        categories: month
                     },
                     chart: {
                        height: 350
                     },
                     stroke: {
                        curve: 'smooth',
                        width: [0, 4]
                     },
                     dataLabels: {
                        enabled: false
                     },
                     title: {
                        text: '월별 커뮤니티 현황',
                        align: 'left'
                     },
                     markers: {
                        hover: {
                              sizeOffset: 4
                        }
                     },
                     plotOptions: {
                        bar: {
                              columnWidth: '50%',
                              endingShape: 'flat',
                              colors: {
                              ranges: [{
                                 from: 0,
                                 to: 0,
                                 color: '#008FFB'
                              }]
                              },
                              dataLabels: {
                                 position: 'top',
                              },
                              border: {
                                 width: 0,
                                 radius: 4
                              },
                        }
                     }
                  };


				 var chart = new ApexCharts(document.querySelector("#chartHj"), options);
				 chart.render();
                
			},
			error: function (request, status, error) {
				console.log("에러")
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
});

function sleepoverchart(){
	var longsleepoverCount= []; //관리자 통계 장기 외박
	var sleepoverCount= []; 	//관리자 통계 그냥 외박
	var sleepoverMonth= []; 	//관리자 통계 외박 달
	var year = $('#selectyear').val();
	$.ajax({
		type: "GET",
		url: "/adminachart/sleepover",
		data: {
               "year": year,
            },
		contentType: "application/json; charset=UTF-8",
		success: function (data) {
			console.log(data);
			$('#chart').empty();
			
			$.each(data, function(index, adminchart){

					longsleepoverCount.push(adminchart.longsleepoverCount);

					sleepoverCount.push(adminchart.sleepoverCount);	

				console.log("장기외박 :"+longsleepoverCount);
				console.log("외박 : "+sleepoverCount);
            })
            
            var options = {	
		        series: [{
		        	name: "외박",
		            data: sleepoverCount,
		        },{
		        	name: "장기외박",
		            data: longsleepoverCount,
		        }],
		        xaxis: {
		            categories: sleepoverMonth
		          },
		        chart: {
		            type: 'line',
		            height: 350
		        },
		        stroke: {
		            curve: 'smooth',
		        },
		        dataLabels: {
		            enabled: false
		        },
		        title: {
		            text: data[0].year+' 월별 외박 신청 현황',
		            align: 'left'
		        },
		        markers: {
		            hover: {
		                sizeOffset: 4
		            }
		        }
		    };
			
			 var chart = new ApexCharts(document.querySelector("#chart"), options);
			    chart.render();
            
		},
		error: function (request, status, error) {
			console.log("에러")
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
}


   /*  var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render(); */
</script>
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
							<li class="smenu" style="background-color:#4D6794; color:white;"><a href='javascript:void(0);'>
									<h1>기숙사 통합관리 솔루션</h1>
								</a></li>
							<li class="smenu"><a href="/admin/adminMember">회원관리</a>
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
							<li class="smenu"><a href="/admin/analyze">시설관리</a>
								<ul class="sub ">
									<li><a href="/admin/analyze">시설관리</a></li>
									<li><a href="/admin/enroll">시설등록</a></li>
								</ul>
							</li>
							<li class="smenu"><a href="/admin/calendar">일정관리</a></li>
							<li class="smenu"><a href="/admin/file" >회원파일등록</a></li>
							<li class="smenu"><a href="/admin/sail" class="msub on">통계관리</a></li>
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
});
</script>

</div>   <div class="con">
      <h3 class="sub_h3">통계관리 <span>통계자료</span></h3>

<div class="bgtab bgtab2">
   <div class="w50 fl">
            <input class="form-select1" type="date" id="start" name="trip-start" value="2000-10-04">
             - <input class="form-select1" type="date" id="end" name="trip-start" value="2000-10-04">&nbsp;&nbsp;
            <ul class="dpi_li dpi">
               <li><a href="#" class="btn_sumit">전체</a></li>
            </ul>
   </div>
</div>

<div class="nmbox mb">
   <div class="tit">
      <h3>월별 외박 신청 현황</h3>
      <p>외박, 장기외박현황을 월별로 살펴볼 수 있으며, 차트를 통해 수치를 살펴볼 수 있습니다.</p>
      연도 선택 : <select id="selectyear" style="text-align:center; width:100px;">
      	<option value="2023" selected>2023</option>
      	<option value="2022">2022</option>
      </select>
      <button id="yearsubmit" class="btn_sumit" onclick="sleepoverchart()">선택</button>
   </div>
   <div class="contents">
      <div id="chart"></div>
   </div>
</div>

<div class="nmbox mb">
   <div class="tit">
      <h3>월별 포인트 결제자 수 및 결제 금액</h3>
      <p>결제자 수와 결제 금액을 월 별로 살펴볼 수 있습니다.</p>
       연도 선택 : <select id="selectyear1" style="text-align:center; width:100px;">
      	<option value="2023" selected>2023</option>
      	<option value="2022">2022</option>
      </select>
      <button id="yearsubmit" class="btn_sumit" onclick="sleepoverchart()">선택</button>
   </div>
   <div class="contents">
      <div id="pointchart"></div>
   </div>
</div>

<div class="nmbox mb">
   <div class="tit">
      <h3>일별 사용율</h3>
      <p>포인트 및 사용율을 일별로 살펴볼 수 있습니다.</p>
   </div>
   <div class="contents">
      <img src="/resources/assets/img/graph03.jpg" width="100%"/>
   </div>
</div>

<div class="nmbox mb">
   <div class="tit">
      <h3>월별 커뮤니티</h3>
      <p>우리학교 게시판에 올라온 글 수와 댓글 수를 월 별로 살펴볼 수 있습니다.</p>
   </div>
   <div class="contents">
      <div id="chartHj"></div>
   </div>
</div>


<div class="bgtab bgtab2">
   <div class="w50 fl">
      <p class="txtin blTxt fwb">[검색된 날짜 19-09-20(금)~19-09-22(일)]</p>
   </div>
   <div class="w50 fl tar">      
      <select name="" class="dpi">
         <option value="">20개</option>
         <option value="">50개</option>
         <option value="">100개</option>
      </select>
      <a href="#" class="btn_sumit2">엑셀다운로드</a></li>
   </div>
</div>

<table class="comm_table mb">
   <colgroup>
      <col width="*"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
      <col width="8%"/>
   </colgroup>
   <thead>
      <tr>
         <th rowspan="2">날짜</th>
         <th colspan="5">결제</th>         
         <th colspan="3">쿠폰</th>
         <th colspan="3">환불</th>
      </tr>
      <tr>
         <th>결제자수</th>
         <th>결제상품수</th>
         <th>결제금액</th>         
         <th>적립 마일리지</th>
         <th>모바일비율</th>
         <th>쿠폰합계</th>
         <th>상품쿠폰</th>
         <th>주문쿠폰</th>
         <th>환불건수</th>
         <th>환불금액</th>
         <th>환불비율</th>   
      </tr>
   </thead>
   <tbody>
      <tr class="tar">         
         <td class="tac bgc">2019-09-22(일)</td>
         <td>1</td>
         <td>1</td>
         <td>50,000</td>
         <td>40,000</td>
         <td>100%</td>
         <td>1,000</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>      
      </tr>
   </tbody>
   <tfoot class="tac">
      <tr class="bgc tar fsb redTxt fwb">
         <td class="tac">합계</td>
         <td>1</td>
         <td>1</td>
         <td>50,000</td>
         <td>40,000</td>
         <td>100%</td>
         <td>1,000</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>
         <td>0</td>            
      </tr>
   </tfoot>
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
</html>