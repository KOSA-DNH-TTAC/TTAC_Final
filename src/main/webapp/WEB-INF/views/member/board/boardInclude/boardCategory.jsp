<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="container">

		<ul>
			<li><a class="allBoard" data-boardName="공지사항"
				href='${pageContext.request.contextPath}/공지사항'>공지사항</a></li>
			<li><a class="allBoard" data-boardName="건의사항"
				href='${pageContext.request.contextPath}/건의사항'>건의사항</a></li>
			<li><a class="allBoard" data-boardName="자유게시판"
				href='${pageContext.request.contextPath}/자유게시판'>자유게시판</a></li>
			<li><a class="allBoard" data-boardName="거래게시판"
				href='${pageContext.request.contextPath}/거래게시판'>거래게시판</a></li>
		</ul>







		<!-- <ol>
					<li><a href="index.html">Home</a></li>
					<li>dlszmffnem!!!</li>
				</ol>
				<h2>자유게시판</h2>
 -->
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
