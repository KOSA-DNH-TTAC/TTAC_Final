<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4DV6JYFYRH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4DV6JYFYRH');
</script>
  <meta charset="utf-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:공지사항</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
  
  <!-- tinymce -->
  <script src="https://cdn.tiny.cloud/1/5ig9du9kh0a5htt18rr9cep98j1plgchozigfsoyk2nfuwn5/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

  <!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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
          <li><a href="/">Home</a></li>
          <li>글쓰기</li>
        </ol>
        <h2>글쓰기</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-12 entries">

            <article class="entry">
				<form action="/board/productBoardWrite" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
					<div class="mb-3">
					  <label for="title" class="form-label">게시글 제목</label>
					  <input type="text" class="form-control" name="title" id="title" placeholder="제목을 작성해주세요." autofocus required>
					</div>
					
					<div class="mb-3">
						<label for="file" class="form-label">대표이미지</label>
						<input type="file" class="form-control" id="file" name="file" accept="image/gif, image/jpeg, image/png" multiple required>
					</div>
					
					<div class="mb-3">
						<label for="price" class="form-label">물품 가격</label>
						<input type="number" class="form-control" name="price" id="price" min="0" step="100" value="0" required>
					</div>
					
					<div class="mb-3">
						<label for="sold" class="form-label">판매 상태</label>
						<select id="sold" name="sold" class="form-select">
		                    <option value=0 selected>판매중</option>
		                    <option value=1>거래완료</option>
		                    <option value=2>예약중</option>
			            </select>
					</div>
					
					<div class="mb-3">
						<textarea id="content" name="content" placeholder="글을 작성해주세요."> 
					  
					  	<h3>▶ 구매시기 </h3>
					  	<p></p>
					  	<h3>▶ 브랜드/모델명 </h3>
					  	<p></p>
					  	<h3>▶  제품의 상태 (사용감, 하자 유무 등)</h3>
					  	<p></p>
					  	<h6>※ 서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요.</h6>
					  
					  	</textarea>
					</div>
					
					
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button onclick="history.go(-1)" style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#000000; color:white; margin-top:10px; font-size: large;">취소</button>
					<button type="submit" style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">확인</button>
                    </div>
                    
                    
                    
                    	
				</form>
            </article><!-- End blog entry -->



          </div>

        </div>
      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->

 <!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
  
  <script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
      mergetags_list: [
        { value: 'First.Name', title: 'First Name' },
        { value: 'Email', title: 'Email' },
      ]
    });
  </script>

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>

</body>

</html>