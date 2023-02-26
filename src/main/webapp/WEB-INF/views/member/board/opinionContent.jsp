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

				<title>DOTO: 건의사항</title>
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
				<link href="/resources/assets/css/hj.css" content-Type="text/css" rel="stylesheet">
				<!-- Template Main CSS File -->
				<link href="/resources/assets/css/style.css" rel="stylesheet">

				<!-- Sweet Alert -->
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
								<li><a href="/">Home</a></li>
								<li><a href="/board/opinionList">건의사항</a></li>
								
								<c:forEach items="${boardContent}" var="boardContent">
									<c:choose>
										<c:when	test="${boardContent.title != null && fn:length(boardContent.title) > 10}">
														<li>${fn:substring(boardContent.title,0,10)}...</li>
										</c:when>
										<c:otherwise>
											<li>${boardContent.title}</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
							</ol>
							<h2>건의사항</h2>

						</div>
					</section>
					<!-- End Breadcrumbs -->

					
					<!-- ======= Blog Section ======= -->
					<section id="blog" class="blog">
						<div class="container" data-aos="fade-up">

							<div class="row">
							
					<!-- 로그인 유저 정보 -->
					<sec:authentication property="principal" var="prc"/>

								<div id="contentsDiv" class="col-lg-8 entries">
									<c:forEach items="${boardContent}" var="boardContent">
										<!--  -->
										<div class="container" data-aos="fade-up">
											<div class="row">
												<div class="col-lg-12 entries">
													<article class="entry">
														<h2 class="entry-title">
														<c:choose>
															<c:when test="${boardContent.likeNum eq 3}"><span id="sell">해결중</span></c:when>
															<c:when test="${boardContent.likeNum eq 4}"><span id="sold">해결완료</span></c:when>
														</c:choose> 
														&nbsp;
															${boardContent.title}
														</h2>

													
														<div class="entry-meta">
															<div id="boardName" style="display:none">
																${boardContent.boardName}</div>
															<div id="idx" style="display:none">${boardContent.idx}</div>
															<ul>
																<li class="d-flex align-items-center"><i
																		class="bi bi-person"></i>${boardContent.memberId}</li>
																<li class="d-flex align-items-center"><i
																		class="bi bi-clock"></i>${boardContent.writeDate}
																</li>
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

											<div class="d-grid gap-2 d-md-flex justify-content-md-end">

												<c:if test="${userId == boardContent.memberId}">
													<button onclick="location.href='/board/${boardName}/${idx}/edit'"
														type="submit"
														style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">수정</button>
												</c:if>

												<button onclick="location.href='/board/${boardName}/'"
													style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#000000; color:white; margin-top:10px; font-size: large;">목록</button>
											</div>

										</div>

										<i class="bi bi-chat-dots"></i>&nbsp;
										<b id="hjreplycount">${boardContent.replyCount}</b>
										<hr>
									</c:forEach>
									<div class="box">
										<ul class="ybreply" style=" list-style-type: none;">
											<div id="replyDiv"></div>

											<li>
												<textarea class="form-control" name="messageContent"
													placeholder="댓글을 입력하세요." value=""
													id="exampleFormControlTextarea1"></textarea>
												<button id="newreplybtn">댓글작성</button>
											</li>

										</ul>

									</div>
								</div>
								<!-- End blog entries list -->

								<div class="col-lg-4">

									<div class="sidebar">
										<div class="sidebar-item search-form">
											<div class="d-flex justify-content-center align-self-center">
												<button type="submit"
												onclick="location.href='/board/freeBoardWrite'"
												style="width: 100%; height: 20; border-radius: 50px; padding: 5px; border: none; background-color: #E96B56; color: white; margin-top: 10px; font-size: large;">글쓰기</button>
											</div>
										</div>

										<!-- End sidebar search formn-->

										<jsp:include page="/WEB-INF/views/member/board/boardInclude/category.jsp" />


									</div>
									<!-- End sidebar -->
									<jsp:include page="/WEB-INF/views/member/board/boardInclude/Chatting.jsp" />
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

				<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
					<i class="bi bi-arrow-up-short"></i>
				</a>

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

<script type="text/javascript">

	let toggleReply = [];


	//새 부모댓글 작성
	$('#newreplybtn').click(function () {
		let idx = $('#idx').text();
		let reply = $('#exampleFormControlTextarea1').val();

		$.ajax({
			type: "post",
			url: "/board/newreply",
			data: JSON.stringify({
				"postidx": idx,
				"reply": reply
			}),
			dataType: 'json',
			async: true, //비동기 여부
			contentType: "application/json",
			success: function (result) {
				
				replyContent();
				
				$('#exampleFormControlTextarea1').val("");
			}
		})

	})

	
	//삭제 버튼 클릭
	function deleteClick(e){
		//댓글
		let replyidx = $(e).parent().attr("id");
		
		Swal.fire({
			title: '정말 삭제하시겠습니까?',
			text: "되돌릴 수 없어요!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#e96b56',
			cancelButtonColor: 'grey',
			confirmButtonText: 'DELETE'
			}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					type: "delete",
					url: '/board/reply/' + replyidx,
					success: function(result){
						
						replyContent();
						Swal.fire(
						'삭제완료!',
						'댓글이 지워졌습니다.',
						'success'
						)
					}
				})
				
			}
			})


		
	}

	//답댓글 쓰기....
	function rereply(e){
		let parentIdx = $(e).parent().attr("id");
		
		let count = 0;
		//toggleReply 배열 돌면서
		//배열에 있다면 제거해주고, 답댓글 div를 없앰
		toggleReply.forEach(function(replyidx, index){
			if(replyidx == parentIdx){
				toggleReply.splice(index, 1);
				
				$(e).parent().children().last().remove();
				count++;
				return;
			}
		})
		if(count==0){
			toggleReply.push(parentIdx);
			let content = `
							<ul id="rerearea">
							<li><i class="bi bi-arrow-return-right">&ensp;</i>
							<textarea class="form-control" name="messageContent" placeholder="댓글을 입력하세요." id="rereplyarea"></textarea>
							<button id="newrereplybtn" onclick="rereplySubmit(this)">작성</button>
							</li>
							</ul>`
			$(e).parent().append(content);
		}
		
	}


	//답댓글 작성 버튼 클릭!!
	function rereplySubmit(e){
		let idx = $('#idx').text();
		let rereply = $('#rereplyarea').val();
		let parentidx = $(e).parent().parent().parent().attr("id")
		
		//ajax로 댓글 작성
		$.ajax({
			type: "post",
			url: "/board/newrereply",
			data: JSON.stringify({
				"postidx": idx,
				"reply": rereply,
				"parentidx": parentidx
			}),
			dataType: 'json',
			async: true, //비동기 여부
			contentType: "application/json",
			success: function (data) {
				replyContent();
			}
		})
	}

	function replyContent(dd) {

		var idx = $('#idx').text();
		var param = "freeBoardList";

		var currentId = "${prc.memberId}"
		
		// 추천 아이콘 Ajax
		$.ajax({
			type: "get",
			url: '/board/' + param + '/' + idx + '/postlike/icon',
			success: function (data) {

				if (data == 1) {
					$('#postLike').empty();
					$('#postLike').append('<i id="like" class="bi-hand-thumbs-up-fill"></i>');
				} else {
					$('#postLike').empty();
					$('#postLike').append('<i class="bi-hand-thumbs-up"></i>');
				}


			}
		})

		// 댓글 Ajax
		$.ajax({
			type: "get",
			url: '/board/' + param + '/' + idx + '/reply',
			contentType: "application/json; charset=utf-8",
			success: function (data) {
				
				let replyCount = data.replyContent.length;
				let rereplyCount = data.reReplyContent.length;
				
				let totalcount = replyCount + rereplyCount;
				var replyContent = "";
				$('#replyDiv').empty();
				$('#hjreplycount').empty();
				$('#hjreplycount').append(totalcount);
				$.each(data.replyContent, function (index, reply) {
					
					if (data.replyContent[index].parentReplyIdx == '0') {

						var pIdx = data.replyContent[index].replyIdx;

						replyContent +=
							`<div class="hjreply" id="` + reply.replyIdx + `"  data-toggle="off">
							<li class="ybreply2"><button class="toMessage"
							seq="`+ reply.memberId + `data-replyIdx="` + reply.replyIdx+ '" data-parentReplyIdx="'+ reply.parentReplyIdx+ '">익명&ensp;</button></li>'
							if(reply.memberId == currentId){
								replyContent += `<button class="deleteReply" onclick="deleteClick(this)">삭제</button>`;
							}
							replyContent += '<span class="replyDate">'+ reply.replyDate +'</span>'
							+ '<div style="clear:both"></div>'
							+ `<li class="replyContent">` + reply.replyContent;
							
							replyContent += '</li>'
							+ '<button class="reSubmit" onclick="rereply(this)">답댓글 쓰기</button><br>'
							+ '</div><hr>'
							

						$.each(data.reReplyContent, function (index, rere) {
							
							if (rere.parentReplyIdx == pIdx) {
								replyContent +=
									'<div class="rereply"><div class="hjreply" id="' + rere.replyIdx + '">'+
									'<li class="ybreply3"><i class="bi bi-arrow-return-right">&ensp;</i><button class="toMessage" seq"'
									+ data.reReplyContent[index].memberId
									+ '" data=replyIdx="'
									+ data.reReplyContent[index].replyIdx
									+ '" data=parentReplyIdx"'
									+ data.reReplyContent[index].parentReplyIdx+'">익명&ensp;</button></li>'
									if(rere.memberId == currentId){
										replyContent += `<button class="deleteReply" onclick="deleteClick(this)">삭제</button>`;
									}
									replyContent += '<span class="replyDate">'
									+ data.reReplyContent[index].replyDate
									+ '</span><div style="clear:both"></div><li class="replyContent">&emsp;&ensp;'
									+ data.reReplyContent[index].replyContent
									+ '</li><br><div class="replyDown">'
									+ '<div id="replyIdx3" style="display:none">'
									+ data.reReplyContent[index].replyIdx
									+ '"</div></div></div><hr>'
							}
						})
					replyContent +="</div>"
					}

				})
				$('#replyDiv').append(replyContent);
			}
		}) // 댓글 ajax end


		// 추천 아이콘
		$('#postLike').click(function () {

			
			$.ajax({
				type: "post",
				url: '/board/' + param + '/' + idx + '/postlike',
				contentType: "application/json; charset=utf-8",
				success: function (data) {

					if ($('#postLike i').hasClass('bi-hand-thumbs-up')) {
						$('#postLike').empty();
						$('#postLike').append('<i id="like" class="bi-hand-thumbs-up-fill"></i>');
					} else {
						$('#postLike').empty();
						$('#postLike').append('<i class="bi-hand-thumbs-up"></i>');
					}

					$('#likenum').empty();
					$('#likenum').append(data);


				}
			})



		});



	}
	$(document).ready(function () {
		replyContent();
	}

	);

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