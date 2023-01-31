<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:기숙사통합관리시스템</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/3projectpavicon.ico" rel="icon">
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

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  
  <!-- Jquery -->
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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
          <li>마이페이지</li>
        </ol>
        <h2>마이페이지</h2>
        <div class="row no-gutters" style="margin-top:10px; margin-bottom : 25px">
        	
        	
          <div class="col-lg-2">

            <!-- <div class="sidebar"> -->
	            <div class="list-group">
				  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">내 정보 조회</a>
				  <a href="#" class="list-group-item list-group-item-action">외박내역</a>
				  <a href="#" class="list-group-item list-group-item-action">결제내역</a>
				  <a href="#" class="list-group-item list-group-item-action">내 커뮤니티</a>
				  <a href="#" class="list-group-item list-group-item-action">벌점이력</a>
				  <a class="list-group-item list-group-item-action disabled">쪽지함</a>
				</div>
			<!-- </div> -->
			</div>
			
			<div id="contentBox" class="col-lg-10" style="background:white">
				<h2 id="mptitle" style="margin :15px 0 20px 0">제목</h2>

				<!-- content start -->
				<div id="content">
								<p>여기에 컨텐츠 들어감</p>
								<p>마이페이지에 최초 접속시 뷰에 내 정보 조회 띄워줄건데 이걸 ajax로 뷰단에서 할지 아니면 컨트롤러에서 싣어서 뷰를 리턴할지?</p>
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
  <script src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

<script type="text/javascript">
	$('.list-group-item').click(function(e){
		e.preventDefault();
		var menu = $(this).text().trim(); //선택한 카테고리 메뉴 값 가져옴
    	console.log(menu);
		//클릭한 메뉴 활성화
        $that = $(this);
        $that.addClass('active');
     	// 다른 active되어있는 a태그의 active를 제거
        var el = $(e.target).closest('a');
		el.siblings('a').removeClass("active");
        
		
    	$('#mptitle').text(menu) //content title 선택 메뉴로 바꿔줌
    	
    	//각 if문에서 ajax로 데이터 가져온 후
    	//해당 내용에 맞는 뷰로 바꿔주기....
    	
		if(menu == '내 정보 조회'){

			$('#content').empty()
			
      //ajax로 내 정보 가저옴
      //td값과 사진값 바꿔줌
      var contents = `<div class="row">
					<div class="col-lg-4">
						<img style="text-align:center" width="200px" src="http://image.newsis.com/2022/04/07/NISI20220407_0000969087_web.jpg" class="img-fluid" alt="Responsive image">
					</div>
					<div class="col-lg-8">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="row">이름</th>
						      <td class="infoTd">박명수</td>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						   		<th scope="row">학번</th>
						   		<td class="infoTd">2017109210</td>
						      
						    </tr>
						    <tr>
						    	<th scope="row">학과</th>
						    	<td class="infoTd">컴퓨터과학과</td>
						    </tr>
						    <tr>
						    	<th scope="row">기숙사</th>
						    	<td class="infoTd">KOSA관 703호</td>
						    </tr>
						    <tr>
						    	<th scope="row">이메일</th>
						    	<td class="infoTd">c2hila@naver.com</td>
						    </tr>
						    <tr>
						    	<th scope="row">연락처</th>
						    	<td class="infoTd">010-2111-8965</td>
						    </tr>
						    <tr>
						    	<th scope="row">보호자연락처</th>
						    	<td class="infoTd">010-1234-5678</td>
						    </tr>
						    <tr>
						    	<th scope="row">벌점</th>
						    	<td class="infoTd">18점</td>
						    </tr>
						  </tbody>
						</table>
					</div>
					</div>`
			$('#content').append(contents)
		}
    else if(menu == '외박내역'){

      //ajax로 외박내역 가져옴

		var contents = `<table class="table" id='nightoverTable'>
            <thead>
            <tr>
              <th scope="col">외박기간</th>
              <th scope="col">외박사유</th>
              <th scope="col">신청일자</th>
              <th scope="col">승인여부</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
            <tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>코사를 탈주</td>
              <td>2023.01.29</td>
              <td>미승인</td>
            </tr>   
          	<tr>
              <td>2023.01.30 ~ 2023.01.31</td>
              <td>병원</td>
              <td>2023.01.29</td>
              <td>승인</td>
            </tr>
          	<tr>
	            <td>2023.01.30 ~ 2023.01.31</td>
	            <td>병원</td>
	            <td>2023.01.29</td>
	            <td>승인</td>
	          </tr>
          </tbody>
        </table>`
			$('#content').empty()
			$('#content').append(contents)

      
			
		}
    else if(menu == '결제내역'){

    	//ajax로 결제내역 가져옴
    	var contents = `<table class="table" id='nightoverTable'>
            <thead>
            <tr>
              <th scope="col">결제일자</th>
              <th scope="col">결제금액</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2023.01.30</td>
              <td>15000원</td>
            </tr>
            <tr>
              <td>2023.01.30</td>
              <td>15000원</td>
            </tr>
            <tr>
              <td>2023.01.30</td>
              <td>15000원</td>
            </tr>
            <tr>
              <td>2023.01.30</td>
              <td>15000원</td>
            </tr>
          </tbody>
        </table>`
			$('#content').empty()
			$('#content').append(contents)
			
			
		}
    else if(menu == '내 커뮤니티'){
        //ajax로 내가 쓴 글 가져옴
        //제목 뒤엔 [n]으로 댓글 수 표시
        var contents = `
          <table class="table">
            <thead>
              <tr>
                <th scope="col">게시판</th>
                <th scope="col">글제목</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>자유게시판</td>
                <td>3층 요즘 너무 시끄럽지 않나요 [3]</td>
                <td>23.01.17</td>
              </tr>
              <tr>
                <td>자유게시판</td>
                <td>같이 엽떡 시켜드실 분 구해용 [25]</td>
                <td>23.01.17</td>
              </tr>
              <tr>
                <td>건의게시판</td>
                <td>휴게실에서 술을 먹는 걸 봤습니다 [1]</td>
                <td>23.01.17</td>
              </tr>
              <tr>
                <td>자유게시판</td>
                <td>행운의 편지......... [3]</td>
                <td>23.01.17</td>
              </tr>
            </tbody>
          </table>
        `
			$('#content').empty()
			$('#content').append(contents)
			
			
		}
    else if(menu == '벌점이력'){
      var contents = `
          <p align="left">누적 벌점 : 18점</p>
          <table class="table">
            <thead>
              <tr>
                <th scope="col">일자</th>
                <th scope="col">사유</th>
                <th scope="col">부여 벌점</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>23.01.17</td>
                <td>방 청소 불량</td>
                <td>1</td>
              </tr>
              <tr>
                <td>23.01.18</td>
                <td>무단 외박</td>
                <td>2</td>
              </tr>
              <tr>
                <td>23.01.19</td>
                <td>무단 외박</td>
                <td>2</td>
              </tr>
              <tr>
                <td>23.01.30</td>
                <td>점호 이후 출입</td>
                <td>3</td>
              </tr>
            </tbody>
          </table>
        `
			$('#content').empty()
			$('#content').append(contents)
			
		}
    else if(menu == '쪽지함'){
			console.log("여기에 쪽지함이 들어갈까요?")
			$('#content').empty()
			
			
		}
	})
</script>
</html>