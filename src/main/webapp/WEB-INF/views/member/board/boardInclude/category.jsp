<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<meta content="" name="description">
			<meta content="" name="keywords">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

			<!-- Favicons -->
			<link href="resources/assets/img/favicon.png" rel="icon">
			<link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

			<script type="text/javascript">
				
					$.ajax(
								{
									type: "get",
									url: "/categoryList",
									success: function (data) {
										createTable(data);
									},
									error : function(err){
										console.log("error")
									}
								}
							)

							// 커스텀 게시판 카테고리
							function createTable(data) {
								$('#list').empty();
								var opr = "";
								$.each(data, function (index, data) {
									opr += "<li><button class='ybbtn' id='boardName' seq='" + data.boardName + "'>" + data.boardName + "</button></li>";
								});
								$('#list').append(opr);
							}

							
								// 커스텀 생성 게시판 카테고리
								$(document).on(					
									"click",
									".ybbtn", function(){
									var boardName = "";
										boardName = $(this).attr('seq');
										
										location.href= "${pageContext.request.contextPath}/board/custom/" + boardName;
								})
									


			</script>
			<h3 class="sidebar-title">게시판</h3>

			<div class="sidebar-item categories">
				<ul>
					<li><a class="allBoard"  href='${pageContext.request.contextPath}/board/noticeList'>공지사항</a></li>
					<li><a class="allBoard"  href='${pageContext.request.contextPath}/board/opinionList'>건의사항</a></li>
					<li><a class="allBoard"  href='${pageContext.request.contextPath}/board/freeBoardList'>자유게시판</a></li>
					<li><a class="allBoard"  href='${pageContext.request.contextPath}/board/productBoardList'>거래게시판</a></li>
				</ul>
				<ul id="list">
				</ul>
			</div>