<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

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
<style>
.dropdown{
  position : relative;
  display : inline-block;
}

.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
}

.dropdown-content a{
  display : block;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
			
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	
	<div class="wrap">
	
	<div class="categories">
		  <div class="dropdown">
		      <span class="dropbtn">drop down</span>
		      <div class="dropdown-content">
		        <a class="allBoard" href="#">link 1</a>
		        <a class="allBoard" href="#">link 2</a>
		        <a class="allBoard" href="#">link 3</a>
		      </div>
		    </div> 
	</div>
	
	
	<%--<div class="categories">

		 <ul>
			<li><a class="allBoard" data-boardName="공지사항"
				href='${pageContext.request.contextPath}/공지사항'>공지사항</a></li>
			<li><a class="allBoard" data-boardName="건의사항"
				href='${pageContext.request.contextPath}/건의사항'>건의사항</a></li>
			<li><a class="allBoard" data-boardName="자유게시판"
				href='${pageContext.request.contextPath}/자유게시판'>자유게시판</a></li>
			<li><a class="allBoard" data-boardName="거래게시판"
				href='${pageContext.request.contextPath}/거래게시판'>ㅠㅠ</a></li>
		</ul> 
	</div>--%>
	
	</div>
	
</section>

<!-- End Breadcrumbs -->

<script type="text/javascript">
	$.ajax({
		type : "get",
		url : "/categoryList",
		success : function(data) {
			createTable(data);
		},
		error : function(err) {
			console.log("error")
		}
	})

	// 커스텀 게시판 카테고리
	function createTable(data) {
		$('#list').empty();
		var opr = "";
		$
				.each(
						data,
						function(index, data) {
							opr += "<li><button class='ybbtn' id='boardName' seq='" + data.boardName + "'>"
									+ data.boardName + "</button></li>";
						});
		$('#list').append(opr);
	}

	// 커스텀 생성 게시판 카테고리
	$(document).on(
			"click",
			".ybbtn",
			function() {
				var boardName = "";
				boardName = $(this).attr('seq');

				location.href = "${pageContext.request.contextPath}/board/"
						+ boardName;

				console.log("boardName : " + boardName);
			})
</script>
