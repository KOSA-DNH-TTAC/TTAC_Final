<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:기숙사통합관리시스템</title>
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
  <link href="resources/assets/css/nightOver.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  
  <!-- Jquery -->
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

  
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
          <li>외박신청</li>
        </ol>
        <h2>외박신청</h2>

      </div>
    </section>
  
  	<div id="box">
  	<div id="date">
  		<label class="label" for="start">시작 날짜</label>
  		<label class="label" for="end">종료 날짜</label>
  		<label class="label" for="end">신청 구분</label>
  		<label class="label" for="end">증빙 첨부</label>
  		
  	</div>
  	<div id="select">
		<input class="form-select1" type="date" id="start" name="trip-start" value="2000-10-04">
		<input class="form-select1" type="date" id="start" name="trip-start" value="2000-10-04">
		<select class="form-select1" aria-label="Default select example">
		  <option selected>외박</option>
		  <option value="1">외박</option>
		  <option value="2">장기외박</option>
		</select>
		<label class="form-select1" for="file" style="background-color:#FFC107; border-radius: 9px; cursor: pointer; justify-content: center;">파일 업로드</label>
		<input class="file" id="file" type="file" style="display:none;">
  	</div>
  	<div id="reason">
  		<div class="form-floating">
		  <textarea class="form-control" placeholder="외박 사유를 적어주세요." id="floatingTextarea2" style="height: 100px"></textarea>
		  <label for="floatingTextarea2">외박 사유를 적어주세요.</label>
		</div>
  	</div>
  	<button type="submit" class="btn btn-warning">신청하기</button>
  	</div>
  </div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  </main>
  <!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>

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

</html>