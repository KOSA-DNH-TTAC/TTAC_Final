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

          .list-group-item {
            text-align: center;
            padding: 12px 0 12px 0;
            font-size: 18px;
          }

          #contentBox {
            min-height: 50vh;
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
          /* .table>:not(caption)>*>*{
          	background-color: #F8F9FA;
          	border:none;
          } */

          #AfterMailSend{
            color:green;
            font-size: small;
          }

          #sentMsg{
            color:green;
            font-size: small;
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

                <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px; ">
                  <div id="contentBox" class="col-lg-6" style="margin: auto; background: #F8F9FA; box-shadow: 0 4px 16px rgb(0 0 0 / 10%); border-radius: 9px;">
                    <h2 id="mptitle" style="margin :15px 0 20px 0">비밀번호 초기화</h2>

                    <!-- content start -->
                    <div id="content">
                        <div>
                            <label for="emailInput">이메일:</label>
                            <input type="text" id="emailInput">
                            <button id="sendEmailBtn">메일받기</button>
                        </div>
                        <div id="afterSent">

                        </div>
                      
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
        $(document).ready(function(){
            $("#sendEmailBtn").click(function() {
				var email = $("#emailInput").val();
				// 이메일 유효성 검사
				if (email === '') {
					alert('이메일을 입력해주세요.');
					return;
				}
				// if (!isValidEmail(email)) {
				// 	alert('올바른 이메일 주소를 입력해주세요.');
				// 	return;
				// }
				// 인증메일을 보내는 로직
				// sendVerificationEmail(email);

                console.log("야호")

				// 인증메일을 보냈다는 알림 출력
                $('#sendEmailBtn').attr('style', 'display:none;');
				$("#emailInput").after("<div id='sentMsg'>인증메일을 보냈습니다.</div>");
				// 인증번호 입력창과 버튼 생성
				$("#afterSent").append("<div><label for='verificationInput'>인증번호 입력:</label><input type='text' id='verificationInput'><button id='verifyBtn'>인증</button></div>");
			});
        })
	</script>
 </html>