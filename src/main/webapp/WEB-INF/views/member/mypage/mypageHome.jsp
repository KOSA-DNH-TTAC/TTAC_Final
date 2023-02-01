<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>DOTO:기숙사통합관리시스템</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!--부트스트랩-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!-- Favicons -->
        <link href="resources/assets/img/3projectpavicon.ico" rel="icon">
        <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
          rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css"
          rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

        <!-- Jquery -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
            text-align: center;
            padding: 12px 0 12px 0;
            font-size: 18px;
          }

          #contentBox {
            padding: 15px 15px 15px 15px;
            text-align: center;
          }

          table {
            font-size: 18px;
          }

          .infoTd {
            text-align: left;
          }

          #content {
            margin-top: 5px;
          }
          .list-group-item.active {
            /* <a href="#" class="list-group-item list-group-item-action active" aria-current="true">내 정보 조회</a> */
          	background-color: #ff7600 !important;
		        border-color: #ff7600	!important;
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
                    </div>
                    <!-- </div> -->
                  </div>

                  <div id="contentBox" class="col-lg-10" style="background:white">
                    <h2 id="mptitle" style="margin :15px 0 20px 0">내 정보 조회</h2>

                    <!-- content start -->
                    <div id="content">
                      <div class="row">
                        <div class="col-lg-4" style="text-align : center">
                            <img style="text-align:center" width="230px" src="http://image.newsis.com/2022/04/07/NISI20220407_0000969087_web.jpg" class="img-fluid" alt="Responsive image">
                            <br>
                            <br>
                            <button class="btn btn-warning" onclick="location.href='/mypage/modify'">정보수정</button>
                        </div>
                        <div class="col-lg-8">
                          <table class="table">
                            <thead>
                              <tr>
                                <th scope="row">이름</th>
                                <td class="infoTd">${member.name}</td>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                 <th scope="row">학번</th>
                                 <td class="infoTd">${member.memberId}</td>
                                
                              </tr>
                              <tr>
                                <th scope="row">학과</th>
                                <td class="infoTd">${member.major}</td>
                              </tr>
                              <tr>
                                <th scope="row">기숙사</th>
                                <td class="infoTd">${member.room}</td>
                              </tr>
                              <tr>
                                <th scope="row">이메일</th>
                                <td class="infoTd">${member.email}</td>
                              </tr>
                              <tr>
                                <th scope="row">연락처</th>
                                <td class="infoTd">${member.phone}</td>
                              </tr>
                              <tr>
                                <th scope="row">보호자연락처</th>
                                <td class="infoTd">${member.parentsPhone}</td>
                              </tr>
                              <tr>
                                <th scope="row">벌점</th>
                                <td class="infoTd">${member.demerit} 점</td>
                              </tr>
                            </tbody>
                          </table>
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

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

      </body>

      <!-- Vendor JS Files -->
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
      <script
        src="${pageContext.request.contextPath}/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>

      <!-- Template Main JS File -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

      <script type="text/javascript">
        $('.list-group-item').click(function (e) {
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

          if (menu == '내 정보 조회') {

            var member;
            $.ajax({
              type: "GET",
              url: "/mypage/myinfo",
              success: function (result) {
                console.log("성공")
                console.log(result);
                member = {
                  "memberid": result.memberId,
                  "name": result.name,
                  "major": result.major,
                  "room": result.room,
                  "email": result.email,
                  "phone": result.phone,
                  "parentsPhone": result.parentsPhone,
                  "demerit": result.demerit
                }
                console.log("test...")
                console.log(member);
                console.log(member.name)


                //img는 나중에 그냥 사람 모양 그림 넣어두기 (아바타)

                var contents = `<div class="row">
					<div class="col-lg-4" style="text-align : center">
							<img style="text-align:center" width="230px" src="http://image.newsis.com/2022/04/07/NISI20220407_0000969087_web.jpg" class="img-fluid" alt="Responsive image">
							<br>
							<br>
							<button class="btn btn-warning" onclick="location.href='/mypage/modify'">정보수정</button>
					</div>
					<div class="col-lg-8">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="row">이름</th>
						      <td class="infoTd">` + member.name + `</td>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						   		<th scope="row">학번</th>
						   		<td class="infoTd">` + member.memberid + `</td>
						      
						    </tr>
						    <tr>
						    	<th scope="row">학과</th>
						    	<td class="infoTd">` + member.major + `</td>
						    </tr>
						    <tr>
						    	<th scope="row">기숙사</th>
						    	<td class="infoTd">` + member.room + `</td>
						    </tr>
						    <tr>
						    	<th scope="row">이메일</th>
						    	<td class="infoTd">` + member.email + `</td>
						    </tr>
						    <tr>
						    	<th scope="row">연락처</th>
						    	<td class="infoTd">` + member.phone + `</td>
						    </tr>
						    <tr>
						    	<th scope="row">보호자연락처</th>
						    	<td class="infoTd">` + member.parentsPhone + `</td>
						    </tr>
						    <tr>
						    	<th scope="row">벌점</th>
						    	<td class="infoTd">` + member.demerit + `점</td>
						    </tr>
						  </tbody>
						</table>
					`

            $('#content').append(contents)

            },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })

            $('#content').empty()

            //ajax로 내 정보 가저옴
            //td값과 사진값 바꿔줌
            
          }
          else if (menu == '외박내역') {

            //ajax로 외박내역 가져옴
            $.ajax({
              type: "GET",
              url: "/mypage/myinfo",
              success: function (result) {
                console.log("성공")
                console.log(result);
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })

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
          else if (menu == '결제내역') {

            //ajax로 결제내역 가져옴
            $.ajax({
              type: "GET",
              url: "/mypage/myinfo",
              success: function (result) {
                console.log("성공")
                console.log(result);
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })
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
          else if (menu == '내 커뮤니티') {
            //ajax로 내가 쓴 글 가져옴
            //제목 뒤엔 [n]으로 댓글 수 표시
            $.ajax({
              type: "GET",
              url: "/mypage/myinfo",
              success: function (result) {
                console.log("성공")
                console.log(result);
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })
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
          else if (menu == '벌점이력') {

            $.ajax({
              type: "GET",
              url: "/mypage/myinfo",
              success: function (result) {
                console.log("성공")
                console.log(result);
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })

            var contents = `
          <p align="left"><b>누적 벌점 : 18점</b></p>
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
        })
      </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

      </html>