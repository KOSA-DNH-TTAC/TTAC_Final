<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>DOTO:기숙사통합관리시스템</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!--부트스트랩-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!-- Favicons -->
        <link href="resources/assets/img/3projectpavicon.ico" rel="icon">
        <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css"
          rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

        <!-- Jquery -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <!-- Apex Chart -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

        <!-- css -->
        <style>
          /* Sidebar */
          .sidebar {

            top: 0;
            bottom: 0;
            left: 0;
            /* padding: 58px 0 0; /* Height of navbar */
            /* box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);*/
            width: 240px;
            z-index: 600;
          }

          .list-group-item {
            text-align: center;
            padding: 12px 0 12px 0;
            font-size: 18px;
          }

          #contentBox {
            padding: 15px 15px 15px 15px;
            text-align: center;
          }

          table {
            font-size: 18px;
          }

          .infoTd {
            text-align: left;
          }

          #content {
            margin-top: 5px;
          }

          .list-group-item.active {
            /* <a href="#" class="list-group-item list-group-item-action active" aria-current="true">내 정보 조회</a> */
            background-color: #ff7600 !important;
            border-color: #ff7600 !important;
          }

          #hjreply {
            color: #bababa;
          }

          #searchTable {
            border-collapse: collapse;
            border-spacing: 0;
          }
          .hjtitle{
            color : black;
          }
          .hjtitle:hover {
            color: #e96b56;
            transition: 0.3s;
          }

        </style>
      </head>

      <body>

        <!-- ======= Header ======= -->
        <c:import url="/WEB-INF/views/common/top.jsp" />
        <!-- End Header -->

        <main id="main">
          <div id="container">
            <section id="breadcrumbs" class="breadcrumbs">
              <div class="container">

                <ol>
                  <li><a href="/">Home</a></li>
                  <li><a href="/mypage">마이페이지</a></li>
                  <li>나의 통계</li>
                </ol>
                <h2>나의 통계</h2>
                <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px">
                <div id="memberId" style="display:none">${user.memberId}</div>


                  <div class="col-lg-2">

                    <!-- <div class="sidebar"> -->
                    <div class="list-group">
                      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">외박</a>
                      <a href="#" class="list-group-item list-group-item-action">결제</a>
                      <a href="#" class="list-group-item list-group-item-action">커뮤니티</a>
                      <a href="#" class="list-group-item list-group-item-action">벌점</a>
                    </div>
                    <!-- </div> -->
                  </div>

                  <div id="contentBox" class="col-lg-10" style="background:white">
                    <h2 id="mptitle" style="margin :15px 0 20px 0">내 통계 보기</h2>

                    <!-- content start -->
                    <div id="content">
                        <div id="chart"></div>
                        <div id="chart2"></div>
                    </div>
                    <!-- content end -->
                    </div>
                </div>

                </div>
            </section>


          </div>
        </main>

        <!-- ======= Footer ======= -->
        <c:import url="/WEB-INF/views/common/footer.jsp" />
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

      </body>

      <!-- Vendor JS Files -->
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>


      <!--날짜변환-->
      <!-- <script src="${pageContext.request.contextPath}/js/dateFormatter.js" type="application/js"></script> -->

      <!-- Template Main JS File -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

      <script>
        $(document).ready(function(){
        	
            var options = {
            chart: {
                type: 'line'
            },
            series: [{
                name: 'sales',
                data: [30,40,35,50,49,60,70,91,125]
            }],
            xaxis: {
                categories: [1991,1992,1993,1994,1995,1996,1997, 1998,1999]
            }
            }

            var chart = new ApexCharts(document.querySelector("#chart"), options);

            chart.render();
        })
        
        $('#chart').empty();

         $('.list-group-item').click(function (e) {
          e.preventDefault();
          var menu = $(this).text().trim(); //선택한 카테고리 메뉴 값 가져옴
          console.log(menu);
          //클릭한 메뉴 활성화
          $that = $(this);
          $that.addClass('active');
          // 다른 active되어있는 a태그의 active를 제거
          var el = $(e.target).closest('a');
          el.siblings('a').removeClass("active");

          $('#chart').empty();
          $('#chart2').empty();
        
          let menutitle = "나의 " + menu + " 통계"
          $('#mptitle').text(menutitle) //content title 선택 메뉴로 바꿔줌

          //각 if문에서 ajax로 데이터 가져온 후
          
          
          //해당 내용에 맞는 뷰로 바꿔주기....
          if (menu == '외박') {
        	  let memberId = $('#memberId').text();
        	  
        	  $.ajax({
      			type: "post",
      			url: "/mypage/sleepover",
      			data: JSON.stringify({
      				"memberId": memberId
      			}),
      			dataType: 'json',
      			async: true, //비동기 여부
      			contentType: "application/json",
      			success: function (data) {
      				console.log(data);
      				replyContent();
      			}
      		})
        	  
        	$('#chart').empty();
            $('#chart2').empty();
        	  

            //월별 외박 건수
            var options = {
            chart: {
                type: 'bar'
            },
            series: [{
                name: 'sleepover',
                data: [30,40,35,50,49,60,70,91,125]
            }],
            xaxis: {
                categories: ['1월','2월','3월','4월','5월','6월','7월', '8월','9월']
            }
            }

            var chart = new ApexCharts(document.querySelector("#chart"), options);

            chart.render();

          }else if(menu == '결제'){

            //월별 결제 건수

            //월별 결제 금액

          }else if(menu == '커뮤니티'){
            
            //월별 작성 글 + 댓글 수

          }else if(menu == '벌점'){
            
            //월별 벌점

          }
         })
      </script>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

      </html>