<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:기숙사통합관리시스템</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../resources/assets/img/3projectpavicon.ico" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  
  <!-- Jquery -->
  <script  src="	http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- css -->
	<style>
		/* Sidebar */
		.sidebar {
		
		top: 0;
		bottom: 0;
		left: 0;
		/* padding: 58px 0 0; /* Height of navbar */
		/* box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);*/
		width: 240px;
		z-index: 600;
		}
		
		.list-group-item {
			text-align : center;
			padding: 12px 0 12px 0;
			font-size : 18px;
		}
		
		#contentBox{
			padding : 15px 15px 15px 15px;
			text-align : center;
		}
		
    table {
      font-size: 18px;
    }

		.infoTd{
			text-align:left;
		}
    #content{
      margin-top: 5px;
    }
    	
	</style>
</head>
<body>

  <!-- ======= Header ======= -->
  <c:import url="/WEB-INF/views/common/top.jsp" />
  <!-- End Header -->
  
  <main id="main">
  <div id="container">
   <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="/mypage">마이페이지</a></li>
          <li>정보수정</li>
        </ol>
        <h2>마이페이지 - 정보수정</h2>
        <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px">
			<div id="contentBox" class="col-lg-12" style="background:white">
				
				<!-- content start -->
				<div id="content">
								<h2 style="margin :15px 0 20px 0">내 정보 수정</h2>
								<form action="/mypage/modify" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
									<table class="table">
										<tbody>
                      <tr>
                         <th scope="row">학번</th>
                         <td class="infoTd" id="memberid"></td>
                      </tr>
                      <tr>
                        <th scope="row">학과</th>
                        <td class="infoTd" id="major"></td>
                      </tr>
                      <tr>
                        <th scope="row">기숙사</th>
                        <td class="infoTd" id="room"></td>
                      </tr>
                      <tr>
                        <th scope="row">비밀번호</th>
                        <td class="infoTd"><input class="form-control" id="password" name="password" type="password" value=""></td>
                      </tr>
                      <tr>
                        <th scope="row">이메일</th>
                        <td class="infoTd"><input class="form-control col-sm-4" id="email" name="email" type="email" value="" ></td>
                      </tr>
                      <tr>
                        <th scope="row">연락처</th>
                        <td class="infoTd"><input class="form-control" id="phone" name="phone" type="number" value="01021118965"></td>
                      </tr>
                      <tr>
                        <th scope="row">보호자연락처</th>
                        <td class="infoTd"><input class="form-control" id="parentsPhone" name="parentsPhone" type="number" value="01012345678"></td>
                      </tr>
                      <tr>
                        <th scope="row">벌점</th>
                        <td class="infoTd" id="demerit"></td>
                      </tr>
                      <tr>
                        <th scope="row">사진변경</th>
                        <td class="infoTd" id="demerit"><input type="file" name="file" id="file" accept=".jpg"></td>
                      </tr>
                    </tbody>
									</table>
									<button type="submit" class="btn btn-warning">수정완료</button>
								</form>
				</div>
				<!-- content end -->
			</div>
		</div>
		
      </div>
    </section>
  
  
  </div>
  </main>
  
  <!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>

<!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var member;
		$.ajax({
		  type: "GET",
		  url: "/mypage/myinfo",
		  success: function (result) {
		   
		    member = {
		      "memberid": result.memberId,
		      "name": result.name,
		      "major": result.major,
		      "password" : result.password,
		      "room": result.room,
		      "email": result.email,
		      "phone": result.phone,
		      "parentsPhone": result.parentsPhone,
		      "demerit": result.demerit
		    }
		   
		    $('#memberid').append(member.memberid);
		    $('#major').append(member.major);
		    $('#room').append(member.room);
		    $('#email').val(member.email);
		    $('#phone').val(member.phone);
		    $('#parentsPhone').val(member.parentsPhone);
		    $('#demerit').append(member.demerit + "점");
		    
      },
      error : function(err){
    	  console.log("에러")
      }
	})
})
	
</script>
</html>