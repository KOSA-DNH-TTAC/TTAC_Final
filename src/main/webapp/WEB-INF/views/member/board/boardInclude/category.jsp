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
  
  <script type="text/javascript">
  
  $(document).ready(function() {
		/* $.ajax(
			 {  
				type : "get",
				url  : "categoryList",
				success : function(data){ 
					console.log(data);
				$('#ul').append(<c:forEach var='categoryList' items='${categoryList}'>
					+ '<li><a href=/' + data.boardnameList.boardname 
					+ ">${boardnameList.boardname}</a></li></c:forEach>"
					); 
				} 
			 } 
		     )  ; */
		
		   //@restcontroller방식 ajax
			 $.ajax(
					 {  
						type : "get",
						url  : "categoryList",
						success : function(data){ 
							console.log(data);
							createTable(data, "@Restcontroller");
						} 
					 } 
			       )    
		});
  
		//Json 전용 table 생성
		function createTable(data){
			$('#list').empty();
			var opr="";
			$.each(data,function(index,data){
				opr += "<li><a href=/"+data.boardName+">"+data.boardName+"</a></li>";
			});
			$('#list').append(opr);
		}

  </script>
	<div>
	<h3 class="sidebar-title">게시판</h3>
	
	
	<div class="sidebar-item categories">
		<ul id="list">
			

		</ul>
	</div>
