<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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

	<title>DOTO: 공지사항</title>
	<meta content="" name="description">
	<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="/resources/assets/img/3projectpavicon.ico" rel="icon">
	<link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

	<!-- Google Fonts -->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
	<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="/resources/assets/css/style.css" rel="stylesheet">

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
								<li>공지사항</li>
							</ol>
							<h2>공지사항</h2>

						</div>
					</section>
					<!-- End Breadcrumbs -->

					<!-- ======= Blog Section ======= -->
					<section id="blog" class="blog">
						<div class="container" data-aos="fade-up">

							<div class="row">

								<div class="col-lg-8 entries">
									<c:if test="${empty allBoardList}">
										<article class="entry">
											<div class="entry-title d-flex justify-content-center">
												아직 글이 없습니다!
											</div>
										</article>
									</c:if>

									<c:forEach items="${allBoardList}" var="notice">
										<article class="entry">

											<div class="entry-title">
												<a href="/board/noticeList/${notice.idx}">
													<c:choose>
													<c:when	test="${notice.title != null && fn:length(notice.title) > 20}">
																	<p>${fn:substring(notice.title,0,20)}...</p>
													</c:when>
													<c:otherwise>
														${notice.title}
													</c:otherwise>
													</c:choose>
												</a>
											</div>

											<div class="entry-meta">
												<ul>
													<li class="d-flex align-items-center"><i class="bi bi-person"></i>관리자</li>
													<li class="d-flex align-items-center"><i class="bi bi-clock"></i>${notice.writeDate}</li>
												</ul>
											</div>

											<div class="entry-content">
												<c:choose>
													<c:when	test="${notice.content != null && fn:length(notice.content) > 200}">
																	<p>${fn:substring(notice.content,0,200)}...</p>
													</c:when>
													<c:otherwise>
														<p>${notice.content}</p>
													</c:otherwise>
												</c:choose>
											</div>

										</article>
										<!-- End blog entry -->

									</c:forEach>
									<!--페이징-->
									<div class="blog-pagination">
										<ul class="justify-content-center">
											<c:if test="${pager.prev}">
												<li>
													<a href="/board/${boardname}?cpage=${pager.cri.page -1}">
														<i class="bi bi-caret-left-fill"></i>
													</a>
												</li>
											</c:if>
											<!-- page 목록 나열하기 -->
											<c:forEach var="i" begin="${pager.startPage}" end="${pager.endPage}" step="1">
												<c:choose>
													<c:when test="${pager.cri.page==i}">
														<li class="active"><a href="#">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="/board/${boardname}?cpage=${i}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<!--다음 링크 -->
											<c:if test="${pager.next}">
												<li>
													<a href="/board/${boardname}?cpage=${pager.cri.page +1}">
														<i class="bi bi-caret-right-fill"></i>
													</a>
												</li>
											</c:if>
										</ul>
									</div>
									<!--End Pagination-->
								</div>
								<!-- End blog entries list -->

								<div class="col-lg-4">

									<div class="sidebar">
										<div class="sidebar-item search-form">
											<div class="d-flex justify-content-center align-self-center">
												<sec:authorize access='hasRole("ROLE_ADMIN")'>
													<button type="submit"
													onclick="location.href='/board/noticeWrite'"
													style="width: 100%; height: 20; border-radius: 50px; padding: 5px; border: none; background-color: #E96B56; color: white; margin-top: 10px; font-size: large;">글쓰기</button>
												</sec:authorize>
											</div>
										</div>

										<!-- End sidebar search formn-->

										<jsp:include page="/WEB-INF/views/member/board/boardInclude/category.jsp" />
										
									</div>
									<!-- End sidebar -->
									<jsp:include page="/WEB-INF/views/member/board/boardInclude/Chatting.jsp" />
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

				<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
						class="bi bi-arrow-up-short"></i></a>

				<!-- Vendor JS Files -->
				<script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
				<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
				<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
				<script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
				<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
				<script src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
				<script src="/resources/assets/vendor/php-email-form/validate.js"></script>

				<!-- Template Main JS File -->
				<script src="/resources/assets/js/main.js"></script>

			</body>
			
			

			</html>