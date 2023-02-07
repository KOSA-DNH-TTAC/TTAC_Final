<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DOTO: 자유게시판</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

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
<link href="/resources/assets/css/yb.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
 <link href="resources/assets/css/nightOver.css" rel="stylesheet">
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
					<li>자유게시판</li>
				</ol>
				<h2>자유게시판</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">

				<div class="row">

					<div id="contentsDiv" class="col-lg-8 entries">

						<c:forEach items="${allBoardList}" var="freeBoard">
							<article class="entry">

								<div class="entry-title">									
									<a href="/freeBoardList/${freeBoard.idx}">
										<c:choose>
											<c:when	test="${freeBoard.title != null && fn:length(freeBoard.title) > 80}">
															${fn:substring(freeBoard.title,0,80)}...
											</c:when>
											<c:otherwise>
												${freeBoard.title}
											</c:otherwise>
										</c:choose>
									</a>
								</div>

								<div class="entry-meta">
									<ul>
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>익명</li>
										<li class="d-flex align-items-center"><i class="bi bi-clock"></i>${freeBoard.writeDate}</a></li>
										<li class="d-flex align-items-center"><i class="bi-hand-thumbs-up"></i>${freeBoard.likeNum}</li>
										<li class="d-flex align-items-center"><i class="bi-chat-dots"></i>${freeBoard.replyCount}</li>
									</ul>
								</div>

								<div class="entry-content">
									<p>${freeBoard.content}</p>
								</div>
							</article>
							<!-- End blog entry -->
							
							<!-- reply -->
							<div id="replyDiv">
							</div>

						</c:forEach>

						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li><a href="#">1</a></li>
								<li class="active"><a href="#">2</a></li>
								<li><a href="#">3</a></li>
							</ul>
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="submit"
								onclick="location.href='/freeBoardList/freeBoardWrite'"
								style="width: 130px; height: 20; border-radius: 50px; padding: 5px; border: none; background-color: #E96B56; color: white; margin-top: 10px; font-size: large;">글쓰기</button>
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

							<jsp:include
								page="/WEB-INF/views/member/board/boardInclude/category.jsp" />


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
<script type="text/javascript">
	
	function boardContent(dd) {
		var test = $(dd);
		var boardIdx = $(dd).attr('name');

		$.ajax({
			type : "get",
			url : '${allBoard}' + '/' + boardIdx,
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