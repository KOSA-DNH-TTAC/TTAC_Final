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
          
          #reading{
          	text-align : left;
          }

          .infoTd {
            text-align: left;
          }

          #content {
            margin-top: 5px;
          }
          .table>:not(caption)>*>*{
          	background-color: #F8F9FA;
          	border:none;
          }
          
          #hjbtn:hover{
          	background-color: #ff7600 ;
            border-color: #ff7600 ;
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
                  <li><a href="/message">쪽지함</a></li>
                </ol>
                <h2>쪽지</h2>

                <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px; ">
                  <div id="contentBox" class="col-lg-6" style="min-height:600px; margin: auto; padding: 50px; padding-bottom : 15px; background: #F8F9FA; box-shadow: 0 4px 16px rgb(0 0 0 / 10%); border-radius: 9px;">
                    <h2 id="mptitle" style="margin :15px 0 20px 0"><i class="bi bi-envelope"></i></h2>

                    <!-- content start -->
                    <div id="content">
                    <table class="table table-warning" id='reading'>
                    <tbody>
                     <tr>
                        	<td colspan="2" style="text-align:center"><h2>${msg.messageTitle}</h2></td>
                        </tr>
                      <tr>
                        <td><b>보낸 사람 ID</b>&nbsp;&nbsp;<span id="smember">${msg.smemberId}</span></td>
                        <td><b>받는 사람 ID</b>&nbsp;&nbsp;${msg.rmemberId}</td>
                       
                      </tr>
                      <tr>
                      <hr>
                        <td colspan="2">
                        <hr>
                        	${msg.messageContent}<br>
                        	<hr>
                        </td>
                      </tr>
                      <tr>
                      	<td colspan="2" style="text-align : right"><button id="hjbtn" class="btn btn-dark">답장하기</button></td>
                      </tr>
                    </tbody>
                  </table>
                  
                      
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
        var receiver = $('#smember').text().trim();
        console.log(receiver);
        $('#hjbtn').click(function(){
            location.href = "/message/writing/" + receiver;
        })
	</script>
 </html>