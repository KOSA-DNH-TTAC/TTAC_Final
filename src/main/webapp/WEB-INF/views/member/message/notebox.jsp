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
		        border-color: #ff7600	!important;
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
                  <li>쪽지함</li>
                </ol>
                <h2>쪽지함</h2>
                <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px">


                  <div class="col-lg-2">

                    <!-- <div class="sidebar"> -->
                    <div class="list-group">
                      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">받은 쪽지</a>
                      <a href="#" class="list-group-item list-group-item-action">보낸 쪽지</a>
                    </div>
                    <!-- </div> -->
                  </div>

                  <div id="contentBox" class="col-lg-10" style="background:white">
                    <h2 id="mptitle" style="margin :15px 0 20px 0">받은 쪽지</h2>

                    <!-- content start -->
                    <div id="content">
                                          <table class="table" id='nightoverTable'>
                      <thead>
                      <tr>
                        <th scope="col">보낸 사람</th>
                        <th scope="col">내용</th>
                        <th scope="col">받은날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>박예빈</td>
                        <td>예빈이는 제순을 싫어해</td>
                        <td>2023.01.29</td>
                      </tr>
                      <tr>
                        <td>임준한</td>
                        <td>자꾸자꾸싫어하면나는어떡해ㅜ</td>
                        <td>2023.01.29</td>
                      </tr>
                      <tr>
                        <td>고범종</td>
                        <td>배고프다</td>
                        <td>2023.01.29</td>
                      </tr>   
                      <tr>
                        <td>kglim</td>
                        <td>점심시간!!!!</td>
                        <td>2023.01.29</td>
                      </tr>
                    </tbody>
                  </table>
                  <button id="writing" class="btn btn-warning">쪽지쓰기</button>
                      
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

      <!-- Template Main JS File -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
	  <!-- bootstrap -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

	<script>
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


         $('#mptitle').text(menu) //content title 선택 메뉴로 바꿔줌
	 })

   $('#writing').on("click", function(){
    console.log("쪽지쓰기 누름")
    location.href = "/message/writing"
   })
	</script>
 </html>