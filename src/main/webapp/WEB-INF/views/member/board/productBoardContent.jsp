<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DOTO: 거래게시판</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Swiper.css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

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
<link href="/resources/assets/css/yb.css" rel="stylesheet"> 
<!-- Template Main CSS File -->
<link href="/resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Eterna - v4.10.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
 <link href="/resources/assets/css/nightOver.css" rel="stylesheet">
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
					<li>거래게시판</li>
				</ol>
				<h2>거래게시판</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div id="contentsDiv" class="col-lg-8 entries">
						<c:forEach items="${boardContent}" var="boardContent">
						<!--  -->
						<div class="container" data-aos="fade-up"><div class="row">
						<div class="col-lg-12 entries">
					
					<article class="entry">
					<h2 class="entry-title">          
					<c:choose>
						<c:when test="${productContent.productSold eq '판매중'}"><span id="sold">판매중</span>&nbsp; ${boardContent.title}</c:when>
						<c:when test="${productContent.productSold eq '거래완료'}"><span id="sold">거래완료</span>&nbsp; ${boardContent.title}</c:when>
						<c:when test="${productContent.productSold eq '예약중'}"><span id="sold">예약중</span>&nbsp; ${boardContent.title}</c:when>
					</c:choose> 
                    
                    </h2>
                    <div class="entry-meta">
                    <div id="boardName" style="display:none">${boardContent.boardName}</div>
					<div id="idx" style="display:none">${boardContent.idx}</div>
                    <ul>
                    	<li class="d-flex align-items-center"><i class="bi bi-person"></i><a href="blog-single.html" value="${boardContent.memberId}">${boardContent.memberId}</a></li>
                    	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>${boardContent.writeDate}</li>
                    	<li class="d-flex align-items-center"><i class="bi-hand-thumbs-up"></i>${boardContent.likeNum}</li>
                    	<li class="d-flex align-items-center"><i class="bi bi-cart2"></i>${productContent.productPrice}원</li>
                    </ul>
                    </div>
                    <article class="entry" style="padding-top: 15px">
                    <div class="swiper" id="my-swiper">
					  <!-- Additional required wrapper -->
					  <div class="swiper-wrapper">
					    <!-- Slides -->
					    <c:forEach var="fileContent" items="${fileContent }">
					    <div class="swiper-slide d-flex justify-content-center"><img class="aws-img " src="${fileContent.fileUrl}" onerror="this.style.display='none'"></div>
				      	</c:forEach>
				    
					  </div>
					  <!-- If we need pagination -->
					  <div class="swiper-pagination"></div>
					
					  <!-- If we need navigation buttons -->
					  <div class="swiper-button-prev"></div>
					  <div class="swiper-button-next"></div>
					
					</div>  
					</article>
					
                    <div class="entry-content" style="margin-bottom:50px;">
                    <p style="margin-top: 40px;">
                     ${boardContent.content}
                    </p>
                    
                   
                    </div>
                    </article>
                    </div>
                    </div> 
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    
	                    	<c:if test="${userId == boardContent.memberId}">
			                    <button onclick="location.href='/board/${boardName}/${idx}/edit'" type="submit" style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">수정</button>
	                    	</c:if>
		                    
							<button onclick="history.go(-1)" style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#000000; color:white; margin-top:10px; font-size: large;">목록</button>					
	                    </div>
                    </div>
                  
                    </c:forEach>
 	             
					</div>
					<!-- End blog entries list -->

				
				<div class="col-lg-4">

						<div class="sidebar">
							<div class="sidebar-item search-form">
								<div class="d-flex justify-content-center align-self-center">
									<button type="submit"
									onclick="location.href='/board/productBoardWrite'"
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

					</div>
				</div>
				</div>
			
		</section>
		<!-- End Blog Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<!-- End Footer -->

	<a href="#"	class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

	<!-- Vendor JS Files -->
	<script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script	src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script	src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script	src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Swiper.js -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>

	<script type="text/javascript">
			
		$(document).ready(
				
			function replyContent(dd) {
				
				var boardName = $('#boardName').text();
				var idx = $('#idx').text();
				
				if (boardName=="공지사항") {
					param = "noticeList";
				} else if (boardName=="건의사항") {
					param = "opinionList";
				} else if (boardName=="자유게시판") {
					param = "freeBoardList";
				} else if (boardName=="거래게시판") {
					param = "productBoardList";
				}
				
				// 댓글 Ajax
				$.ajax({
					type : "get",
					url : '/board/'+ param + '/' + idx + '/reply', 
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						
						var replyContent = "";
					
						$('#replyDiv').empty();
					      
		                $.each(data.replyContent, function(index, reply) {
		                	
		                	if (reply.parentReplyIdx == '0') {
			                		
			                	var pIdx = reply.replyIdx;
			                	
			                	replyContent +=
			 	                
			 	                '<li class="ybreply2"><button class="toMessage" seq="' 
			 	                + reply.memberId 
			 	                + '" data-replyIdx="'
			 	                + reply.replyIdx
			 	                + '" data-parentReplyIdx="'
			 	                + reply.parentReplyIdx
			 	                + '">익명&ensp;</button></li><span class="replyDate">'
			 	                + reply.replyDate
			 	                + '</span><div style="clear:both"></div><li class="replyContent">'
			 	                + reply.replyContent 
			 	                + '</li><button class="reSubmit">댓글 쓰기</button><br>'
			 	                + '<div id="replyIdx2" style="display:none">'
			 	                + reply.replyIdx
			 	                + '"</div>'
			 	                + '<hr><div class="rereply">';

													
								$.each(data.reReplyContent, function(index, rere){
								if(rere.parentReplyIdx == pIdx){
								replyContent +=
					 	    
								'<li class="ybreply3"><i class="bi bi-arrow-return-right">&ensp;</i><button class="toMessage" seq"'
								+ data.reReplyContent[index].memberId
								+ '" data=replyIdx="'
								+ data.reReplyContent[index].replyIdx
								+ '" data=parentReplyIdx"'
								+ data.reReplyContent[index].parentReplyIdx
								+ '">익명&ensp;</button></li><span class="replyDate">'
								+ data.reReplyContent[index].replyDate
								+ '</span><div style="clear:both"></div><li class="replyContent">&emsp;&ensp;'
								+ data.reReplyContent[index].replyContent 
								+ '</li><br><div class="replyDown">'
								+ '<div id="replyIdx3" style="display:none">'
								+ data.reReplyContent[index].replyIdx
								+ '"</div></div><hr>'
													}
												})
			 	              			 	               
			               }

					})
						
						$('#replyDiv').append(replyContent);
					}
				})
				
				
				
		});
		
		// 클릭시 익명 회원의 memberId값 받아오기
		$(document).on(					
			"click",
			".toMessage", function toMessage() {
				var toMessage = $(this).attr('seq');
				var replyIdx = $(this).attr('data-replyIdx');
				var parentReplyIdx = $(this).attr('data-parentReplyIdx');
		})
		
		const swiper = new Swiper('.swiper', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,

		// If we need pagination
		pagination: {
			el: '.swiper-pagination',
			
		},

		// Navigation arrows
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},

		// And if we need scrollbar
		scrollbar: {
			el: '.swiper-scrollbar',
		},
		
		autoplay: {
			   delay: 3000,
			 },
		});
			
	</script>

</body>
</html>