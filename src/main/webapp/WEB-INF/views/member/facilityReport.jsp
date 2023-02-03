<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:mealticket</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/favicon.png" rel="icon">
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
  
  <link href="resources/assets/css/nightOver.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
.blog-pagination {
  color: #878787;
}

.blog-pagination ul {
  display: flex;
  padding: 0;
  margin: 0;
  list-style: none;
}

.blog-pagination li {
  margin: 0 5px;
  transition: 0.3s;
}

.blog-pagination li a {
  color: #545454;
  padding: 7px 16px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.blog-pagination li.active,
.blog-pagination li:hover {
  background: #e96b56;
}

.blog-pagination li.active a,
.blog-pagination li:hover a {
  color: #fff;
}
  </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <c:import url="/WEB-INF/views/common/top.jsp" />
  <!-- End Header -->
  
  <main id="main">
  <div id="container">
   <section id="breadcrumbs" class="breadcrumbs" style="margin-bottom:0px;">
      <div class="container">

        <ol>
          <li><a href="/">Home</a></li>
          <li>시설물신고</li>
        </ol>
        <h2>시설물신고</h2>

      </div>
    </section>
    
    
  	<div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
  	<div id="box" style="width: 275px; height: 553.44px; left: 61.27px; background: #FFFFFF;">
  	<div id="select" style="display:flex; flex-direction:column; justify-content:center; width:100%;">
		<select class="form-select3" aria-label="Default select example">
		  <option selected>기숙사 건물(동)</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">명륜학사 B동</option>
		</select>
		<select class="form-select3" aria-label="Default select example">
		  <option selected>기숙사 층</option>
		  <option value="1">1층</option>
		  <option value="2">2층</option>
		</select>
		<select class="form-select3" aria-label="Default select example">
		  <option selected>시설물</option>
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
  	<button type="submit" class="btn btn-warning" style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">신청하기</button>
  	</div>
  	
  	
  	
  	
  	
  	
  	<div id="box2" style="width: 835px; height: 553.44px; background: #FFFFFF;">
  	<div id="select" style="display:flex; flex-direction:row; width:100%;">
		<select class="form-select2" aria-label="Default select example">
		  <option selected>기숙사 건물(동)</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
		<select class="form-select2" aria-label="Default select example">
		  <option selected>기숙사 층</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
		<select class="form-select2" aria-label="Default select example">
		  <option selected>시설물</option>
		  <option value="1">명륜학사 A동</option>
		  <option value="2">장기외박</option>
		</select>
  	</div>
  	<div id="reason1" style="border:none;">
  	<h3 style="margin-left: 10px; color:#4B4B4B;"><b>시설물 현황</b></h3>
  		<table class="table" id='nightoverTable'>
            <thead>
            <tr>
              <th>기숙사 건물(동)</th>
              <th>기숙사 층</th>
              <th>시설물</th>
              <th>신고 상세</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>명륜학사 A동</td>
              <td>7층</td>
              <td>세탁기</td>
              <td>세탁기가 작동하지 않습니다.</td>
            </tr>
            <tr>
              <td>명륜학사 B동</td>
              <td>6층</td>
              <td>변기</td>
              <td>변기가 내려가지 않습니다.</td>
            </tr>
            <tr>
              <td>명륜학사 B동</td>
              <td>3층</td>
              <td>정수기</td>
              <td>정수기가 온수가 나오지 않습니다.</td>
            </tr>   
          	<tr>
              <td>명륜학사 A동</td>
              <td>2층</td>
              <td>세면대</td>
              <td>세면대 물이 나오지 않습니다.</td>
            </tr>
          	<tr>
	          <td>명륜학사 B동</td>
              <td>4층</td>
              <td>거울</td>
              <td>화장실 거울이 깨져있습니다.</td>
	        </tr>
	        <tr>
              <td>명륜학사 A동</td>
              <td>2층</td>
              <td>세면대</td>
              <td>세면대 물이 나오지 않습니다.</td>
            </tr>
            <tr>
	          <td>명륜학사 B동</td>
              <td>4층</td>
              <td>거울</td>
              <td>화장실 거울이 깨져있습니다.</td>
	        </tr>
          </tbody>
        </table>
        
  	</div>
  	
  	
  	<!-- 페이징 -->
  		<div class="blog-pagination">
        <ul class="justify-content-center">
           <li class="active"><a href="#">1</a></li>
           <li><a href="#">2</a></li>
           <li><a href="#">3</a></li>
        </ul>
  	</div>
  	<div>
		<c:if test="${cpage > 1}">
			<a
				href="boardList.user?boardname=${boardname}&cp=${cpage-1}&ps=${pagesize}&boardname=${boardname}">이전</a>
		</c:if>
		<!-- page 목록 나열하기 -->
		<c:forEach var="i" begin="1" end="${pagecount}" step="1">
			<c:choose>
				<c:when test="${cpage==i}">
					<font color="red">[${i}]</font>
				</c:when>
				<c:otherwise>
					<a
						href="boardList.user?boardname=${boardname}&cp=${i}&ps=${pagesize}&boardname=${boardname}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!--다음 링크 -->
		<c:if test="${cpage < pagecount}">
			<a
				href="boardList.user?boardname=${boardname}&cp=${cpage+1}&ps=${pagesize}&boardname=${boardname}">다음</a>
		</c:if>
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