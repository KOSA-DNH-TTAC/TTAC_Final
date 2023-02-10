<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:저녁 점호</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/3projectpavicon.ico" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae20ffc78d270b6473f02625716b04d5"></script>
  <script src="resources/assets/js/eveningCallMap.js"></script>
<!--   <script>
	  function mySpaceReport(){
		//버튼 클릭시 함수 실행
			$.ajax(
				{
					 cache : false,
			            url : "/eveningCall", 
			            type:"POST", 
			            dataType:"html",	
			            success : function(data) {
			                $('#hotboardtable').empty(data);
			                $('#hotboardtable').append(data);
			            }, // success 
			    
			            error : function(request,status,error) {
			            	alert("code:" +request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
							console.log(error);
			            }
			        }); // $.ajax 
	 }	   
  </script> -->
</head>

<body>

   <!-- ======= Header ======= -->
  <c:import url="/WEB-INF/views/common/top.jsp" />
  <!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>	
          <li>점호하기</li>
        </ol>
        <h2>점호하기</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

		<!-- 나의 위치 -->
        <div class="row">
          <div>
            <div class="info-box mb-4">
              <i class="bx bx-map"></i>
              <h3>나의 현재위치</h3>
              <p id="location"></p>
              	<div style="display:flex; justify-content:center; align-items:center; margin: auto; width:280px; height:5px; border-radius: 50px; border: none; background-color:#E96B56; color:white; margin-top:10px;">
              		<!-- <button id="report" onclick="mySpaceReport()"; style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">점호하기</button> -->
              	</div>
            </div>
          </div>
        </div>
      
		<!-- 지도 -->
        <div class="row">
          <div>
            <div id="map" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></div>
          </div>
        </div>

      </div>
    </section>
    <!-- End Contact Section -->

  </main>
  <!-- End #main -->

   <!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- End Footer -->


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>

</html>