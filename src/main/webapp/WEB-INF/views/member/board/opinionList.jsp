<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>DOTO: 건의사항</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

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
<link href="/resources/assets/css/yb.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/assets/css/style.css" rel="stylesheet">
<link href="/resources/assets/css/yb.css" rel="stylesheet"> 

<!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
 <link href="/resources/assets/css/nightOver.css" rel="stylesheet">
</head>
			<!-- 로그인 유저 정보 -->
  			<sec:authentication property="principal" var="prc"/>
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
					<li>건의사항</li>
				</ol>
				<h2>건의사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">

				<div class="row">

					<div id="contentsDiv" class="col-lg-8 entries">
						<article class="entry d-flex justify-content-center">
							<h4>이 곳은 본인과 사감만 볼 수 있는 게시판입니다.</h4>
						</article>
						
						<c:forEach items="${allBoardList}" var="freeBoard">
							<c:if test="${freeBoard.memberId eq prc.memberId || prc.authorities eq '[ROLE_ADMIN]'}">
							<article class="entry">
								
								<div class="entry-title">									
									<a href="/board/opinionList/${freeBoard.idx}">
										<c:choose>
												<c:when test="${freeBoard.likeNum eq 3}"><span id="sell">해결중</span></c:when>
												<c:when test="${freeBoard.likeNum eq 4}"><span id="sold">해결완료</span></c:when>
										</c:choose> 
										&nbsp;
										<c:choose>
											<c:when	test="${freeBoard.title != null && fn:length(freeBoard.title) > 30}">
												${fn:substring(freeBoard.title,0,30)}...
											</c:when>
											<c:otherwise>
												${freeBoard.title}
											</c:otherwise>
										</c:choose>
									</a>
								</div>

								<div class="entry-meta">
									<ul>
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>${freeBoard.memberId}</li>
										<li class="d-flex align-items-center"><i class="bi bi-clock"></i>${freeBoard.writeDate}</a></li>
										<li class="d-flex align-items-center"><i class="bi-chat-dots"></i>${freeBoard.replyCount}</li>
									</ul>
								</div>

								<div class="entry-content">
								
									<!-- 내용 넣는곳  -->
								
								</div>
							</article>
							</c:if>
							<!-- End blog entry -->
							
							<!-- reply -->
							<div id="replyDiv">
							</div>

						</c:forEach>

						<!-- <div class="blog-pagination">
							<ul class="justify-content-center">
								<li><a href="#">1</a></li>
								<li class="active"><a href="#">2</a></li>
								<li><a href="#">3</a></li>
							</ul>
						</div> -->


						<div class="blog-pagination">
							<ul class="justify-content-center">
								<c:if test="${pager.prev}">
									<li>
										<a href="/board/${boardname}?cpage=${pager.cri.page -1}">
										<!-- <i class="bi bi-caret-left-square-fill"></i> -->
											<!-- <i class="bi bi-caret-left"></i> -->
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
										<!-- <i class="bi bi-caret-right-square-fill"></i> -->
										<!-- <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-square-fill" viewBox="0 0 16 16">
											<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.5 10a.5.5 0 0 0 .832.374l4.5-4a.5.5 0 0 0 0-.748l-4.5-4A.5.5 0 0 0 5.5 4v8z"/>
										  </svg> -->
										</a>
									</li>
								</c:if>
							</ul>
						</div>

					</div>
					<!-- End blog entries list -->

					<div class="col-lg-4">

						<div class="sidebar">
							<div class="sidebar-item search-form">
								<div class="d-flex justify-content-center align-self-center">
									<button type="submit"
									onclick="location.href='/board/opinionWrite'"
									style="width: 100%; height: 20; border-radius: 50px; padding: 5px; border: none; background-color: #E96B56; color: white; margin-top: 10px; font-size: large;">글쓰기</button>
								</div>
							</div>
								
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

							<jsp:include
								page="/WEB-INF/views/member/board/boardInclude/category.jsp" />
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

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>


</body>
<script type="text/javascript">
	
	function boardContent(dd) {
		var test = $(dd);
		var boardIdx = $(dd).attr('name');

		$.ajax({
			type : "get",
			url : 'board/'+ '${allBoard}' + '/' + boardIdx,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log(data);
				var boardAndReply = "";
				$('#contentsDiv').empty();
				boardAndReply += 
					'<div class="container" data-aos="fade-up"><div class="row"><div class="col-lg-12 entries"><article class="entry"><h2 class="entry-title">'
                    + '<a href="blog-single.html">'
                    + data.boardContent[0].title
                    + '</a>'
 				    + '</h2>'
                    + '<div class="entry-meta">'
                    + '<ul>'
                    + '<li class="d-flex align-items-center"><i class="bi bi-person"></i><a href="blog-single.html" value="'
                    + data.boardContent[0].memberId 
                    + '">'
                    + '익명'
                    + '</a></li>'
                    + '<li class="d-flex align-items-center"><i class="bi bi-clock"></i><a href="blog-single.html">'
                    + data.boardContent[0].writeDate
                    + '</a></li>'
                    + '<li class="d-flex align-items-center"><i class="bi-hand-thumbs-up"></i>'
                    + data.boardContent[0].likeNum
                    + '</li>'
                    + '</ul>'
                    + '</div>'
                    + '<div class="entry-content" style="margin-bottom:50px;">'
                    + '<p style="margin-top: 40px;">'
                    + data.boardContent[0].content
                    + '</p>'
                    + '</div>'
                    + '</article>'
                    + '</div>'
                    + '</div>' + '</div>'
                    + '<b><i class="bi bi-chat-dots"></i>&nbsp'
                    + data.boardContent[0].replyCount
                    + '</b>'
                    + '<hr>'
 	                + '<div class="box"><ul class="ybreply" style=" list-style-type: none;">'
                    
                $.each(data.replyContent, function(index) {
                boardAndReply +=
 	                
 	                '<li class="ybreply2"><b value="' 
 	                + data.replyContent[index].memberId 
 	                + '">익명</b></li><li>'
 	                + data.replyContent[index].replyContent 
 	                + '</li>' + '<hr>'
                    })
                
                boardAndReply += '<li><textarea class="form-control" name="messageContent" placeholder="댓글을 입력하세요." id="exampleFormControlTextarea1"></textarea></li>'
 	                + '</ul></div>'
                
				$('#contentsDiv')
					.append(boardAndReply);
					}
				})

	}
	
</script>
</html>