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
<link href="/resources/assets/img/favicon.png" rel="icon">
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
<script src="https://kit.fontawesome.com/2a013a2563.js" crossorigin="anonymous"></script>
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
						<c:forEach items="${boardContent}" var="boardContent">
						<!--  -->
						<div class="container" data-aos="fade-up"><div class="row">
						<div class="col-lg-12 entries">
					
					<article class="entry">
					<h2 class="entry-title">              
                     ${boardContent.title}
                    </h2>
                    <div class="entry-meta">
                    <div id="boardName" style="display:none">${boardContent.boardName}</div>
					<div id="idx" style="display:none">${boardContent.idx}</div>
                    <ul>
                    	<li class="d-flex align-items-center"><i class="bi bi-person"></i><a value="${boardContent.memberId}">익명</a></li>
                    	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>${boardContent.writeDate}</li>
                    	<li class="d-flex align-items-center"><i class="bi-hand-thumbs-up"></i>${boardContent.likeNum}</li>
                    </ul>
                    </div>
                    <div class="entry-content" style="margin-bottom:50px;">
                    <p style="margin-top: 40px;">
                     ${boardContent.content}
                    </p>
                    </div>
                    </article>
                    </div>
                    </div> 
                    
                    </div>
                    <b><i class="bi bi-chat-dots"></i>&nbsp
                     ${boardContent.replyCount}</b>
                    <hr> 
                    </c:forEach>
 	                <div class="box">
 	                <ul class="ybreply" style=" list-style-type: none;">
						<div id="replyDiv"></div>
						
						<li>
							<textarea class="form-control" name="messageContent" placeholder="댓글을 입력하세요." id="exampleFormControlTextarea1">
							</textarea>
						</li>
		 	            
		 	            </ul>
		 	            
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
						console.log(data);
						$('#replyDiv').empty();
					      
		                $.each(data.replyContent, function(index) {
		                
		                	if (data.replyContent[index].parentReplyIdx == '0') {
		                		
		                	var pIdx = data.replyContent[index].replyIdx;
		                	
		                	replyContent +=
		 	                
		 	                '<li class="ybreply2"><button class="toMessage" seq="' 
		 	                + data.replyContent[index].memberId 
		 	                + '" data-replyIdx="'
		 	                + data.replyContent[index].replyIdx
		 	                + '" data-parentReplyIdx="'
		 	                + data.replyContent[index].parentReplyIdx
		 	                + '">익명&ensp;</button></li><span class="replyDate">'
		 	                + data.replyContent[index].replyDate
		 	                + '</span><div style="clear:both"></div><li class="replyContent">'
		 	                + data.replyContent[index].replyContent 
		 	                + '</li><button class="reSubmit">댓글 쓰기</button><br>'
		 	                + '<div id="replyIdx2" style="display:none">'
		 	                + data.replyContent[index].replyIdx
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
							// 대댓글 출력 시작
							/*
							if (data.reReplyContent[index].parentReplyIdx == pIdx) {
								
			 	            $.each(data.reReplyContent, function(index, rereply){
			 	            if(rereply.parentReplyIdx == pIdx){
			 	               	
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

							}*/
		 	               
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
		
		
		
			
			</script>

</body>
</html>