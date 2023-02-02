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
  
  <!-- bootstrap5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

  
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
    
    
  	<div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
  	<div id="box" style="width: 275px; height: 553.44px; left: 61.27px; background: #FFFFFF;">
  	<div id="select" style="display:flex; flex-direction:column; justify-content:center; width:100%;">
		기숙사 건물(동)
		<select class="form-select1" aria-label="Default select example">
		  <option selected>명륜학사 A동</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">명륜학사 B동</option>
		</select>
		기숙사 층 
		<select class="form-select1" aria-label="Default select example">
		  <option selected>1층</option>
		  <option value="1">1층</option>
		  <option value="2">2층</option>
		</select>
		시설물
		<select class="form-select1" aria-label="Default select example">
		  <option selected>세탁기</option>
		  <option value="1">세탁기</option>
		  <option value="2">변기</option>
		</select>
  	</div>
  	<div id="reason">
  		<div class="form-floating">
		  <textarea class="form-control" placeholder="신고 상세 설명을 적어주세요." id="floatingTextarea2" style="height:200px;"></textarea>
		  <label for="floatingTextarea2">신고 상세 설명</label>
		</div>
  	</div>
  	<button type="submit" class="btn btn-warning">신청하기</button>
  	</div>
  	
  	
  	
  	
  	
  	
  	<div id="box" style="width: 835px; height: 553.44px; background: #FFFFFF;">
  	  	<div id="date1">
  		<label class="label" for="start">기숙사 건물(동)</label>
  		<label class="label" for="end">기숙사 층</label>
  		<label class="label" for="end">시설물</label>
  	</div>
  	<div id="select" style="display:flex; flex-direction:row; width:100%;">
		<select class="form-select2" aria-label="Default select example">
		  <option selected>명륜학사 A동</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
		<select class="form-select2" aria-label="Default select example">
		  <option selected>명륜학사 A동</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
		<select class="form-select2" aria-label="Default select example">
		  <option selected>명륜학사 A동</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
  	</div>
  	<div id="reason" style="border:none;">
  		<table class="table" id='nightoverTable'>
            <thead>
            <tr>
              <th scope="col">외박기간</th>
              <th scope="col">외박사유</th>
              <th scope="col">신청일자</th>
              <th scope="col">승인여부</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>코사를 탈주</td>
              <td>2023.01.29</td>
              <td>미승인</td>
            </tr>   
          	<tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
          	<tr>
	            <td>2023.01.30 ~ 2023.01.31</td>
	            <td>병원</td>
	            <td>2023.01.29</td>
	            <td>승인</td>
	          </tr>
          </tbody>
        </table>
  	</div>
  	</div>
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
  
  <!-- bootstrap5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  

</html>