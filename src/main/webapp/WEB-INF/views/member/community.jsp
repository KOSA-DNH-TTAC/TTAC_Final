<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DOTO:커뮤니티</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
   rel="apple-touch-icon">

<!-- Google Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/animate.css/animate.min.css"
   rel="stylesheet">
<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="resources/assets/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.min.css"
   rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.min.css"
   rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">
 	
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
               <li><a href="index.html">Home</a></li>
               <li>커뮤니티</li>
            </ol>
            <h2>커뮤니티</h2>

         </div>
      </section>
      <!-- End Breadcrumbs -->

      <!-- ======= Blog Section ======= -->
      <section id="blog" class="blog">
         <div class="container" data-aos="fade-up">

            <div class="row">

               <div class="col-lg-8 entries">

                  <c:forEach var="post" items="${postList}">
                     <article class="entry">

                        <h2 class="entry-title">
                           <a href="blog-single.html">${post.title}</a>
                        </h2>

                        <div class="entry-meta">
                           <ul>
                              <li class="d-flex align-items-center"><i class="bi bi-person"></i><a href="blog-single.html">${post.memberId}</a></li>
                              <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-single.html">${post.writeDate}</a></li>
                              <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">${reply.comment}</a></li>
                              <!-- reply.comment 댓글 개수 -->
                              <li class="d-flex align-items-center"><i class="bi bi-chat-dots" />${post.likeNum}</li>
                           </ul>
                        </div>

                        <div class="entry-content">
                           <p>${post.content}</p>
                        </div>

                     </article>
                     <!-- End blog entry -->

                  </c:forEach>

                  <article class="entry">
                  	게시글 띄워줄곳
                  </article>


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
			
			
			 <div class="blog-pagination">
              <ul class="justify-content-center">
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                
              </ul>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-danger me-md-2 " style="background-color: #e96b56;" type="button" onclick="location.href='/boardWrite'">글쓰기</button>
			</div>
               </div>
               <!-- End blog entries list -->
               
               

               <div class="col-lg-4">

                  <div class="sidebar">

                     <h3 class="sidebar-title">Search</h3>
                     <div class="sidebar-item search-form">
                        <form action="">
                           <input type="text">
                           <button type="submit">
                              <i class="bi bi-search"></i>
                           </button>
                        </form>
                     </div>
                     <!-- End sidebar search formn-->

                     <jsp:include page="/WEB-INF/views/member/board/boardInclude/category.jsp" />


                  </div>
                  <!-- End sidebar -->

               </div>
               <!-- End blog sidebar -->

            </div>

         </div>
      </section>
      <!-- End Blog Section -->

   </main>
   <!-- End #main -->

   <!-- ======= Footer ======= -->
   <c:import url="/WEB-INF/views/common/footer.jsp" />
   <!-- End Footer -->

   <a href="#"
      class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

   <!-- Vendor JS Files -->
   <script
      src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
   <script
      src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
   <script
      src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
   <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
   <script
      src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
   <script src="resources/assets/vendor/php-email-form/validate.js"></script>

   <!-- Template Main JS File -->
   <script src="resources/assets/js/main.js"></script>

</body>

</html>