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
            border-color: #ff7600 !important;
          }

          #hjreply {
            color: #bababa;
          }

          #searchTable {
            border-collapse: collapse;
            border-spacing: 0;
          }
          .hjtitle{
            color : black;
          }
          .hjtitle:hover {
            color: #e96b56;
            transition: 0.3s;
          }

        </style>
      </head>

      <body>

        <!-- ======= Header ======= -->
        <c:import url="/WEB-INF/views/common/top.jsp" />
        <!-- End Header -->

        <main id="main">
        <!-- 로그인 유저 정보 -->
        <sec:authentication property="principal" var="prc"/>
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
                      <a href="#" class="list-group-item list-group-item-action">나의 통계</a>
                    </div>
                    <!-- </div> -->
                  </div>

                  <div id="contentBox" class="col-lg-10" style="background:white">
                    <h2 id="mptitle" style="margin :15px 0 20px 0">내 정보 조회</h2>

                    <!-- content start -->
                    <div id="content">
                      <div class="row">
                        <div class="col-lg-4" style="text-align : center">
                          <img style="text-align:center" width="230px"
                            src="${url}" class="img-fluid"
                            alt="Responsive image">
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
                                <td class="infoTd">${member.domitoryName} ${member.room}호</td>
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
                                <td class="infoTd">${member.demerit}점</td>
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


      <!--날짜변환-->
      <!-- <script src="${pageContext.request.contextPath}/js/dateFormatter.js" type="application/js"></script> -->

      <!-- Template Main JS File -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

      <script type="text/javascript">

        function intervalSearch() {
          console.log("기간별 검색")
          let startString = $('#start').val();
          let endString = $('#end').val();

          $.ajax({
            type: "GET",
            url: "/mypage/sleepoverInterval",
            data: {
              "startdate": startString,
              "enddate": endString,
            },
            contentType: "application/json; charset=UTF-8",
            success: function (result) {
              console.log(result);

              $('#nightoverTable').empty();
              let Ncontents = `<tbody>
									<tr>
										<th>번호</th>
										<th>외박일</th>
										<th>복귀일</th>
										<th>사유</th>
									</tr>`
              $.each(result.list, function (index, over) {
                let startdate = dateFormatter(over.startDate);
                let enddate = dateFormatter(over.endDate);
                // let localeStart = startdate.toLocaleString("ko-KR");
                // let localeEnd = enddate.toLocaleString("ko-KR");
                Ncontents += "<tr><td>" + (++index) + "</td>"
                  + "<td>" + startdate + "</td>"
                  + "<td>" + enddate + "</td>"
                  + "<td>" + over.sleepOverReason + "</td>"
                  + "<input type='hidden' value='" + over.sleepOverIdx + "' ></tr>"
              })

              $('#nightoverTable').append(Ncontents);
            }
          }
          )
        }

        function sleepoverChart(){
          location.href="/mypage/mychart"
        }

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
                  "domitory": result.domitoryName,
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
							<img style="text-align:center" width="230px" src="https://kosa-s3-bucket.s3.ap-northeast-2.amazonaws.com/${member.universityCode}/user/${member.memberId}/${member.memberId}.jpg" class="img-fluid" alt="Responsive image">
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
						    	<td class="infoTd">` + member.domitory + " " + member.room + `호</td>
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
                $('#content').empty();
                $('#content').append(contents)

              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })

          }
          else if (menu == '외박내역') {
            var today = new Date();

            var todayFormat = dateFormatter(today);
            //ajax로 외박내역 가져옴
            $.ajax({
              type: "GET",
              url: "/mypage/sleepover",
              success: function (result) {
                console.log("성공")
                console.log(result);

                var contents = `<table id="searchTable" class="table"><tr>
                                <td>
                                  <label for="trip-start">기간별 조회</label>
                                  <input class="form-select1" type="date" id="start" name="trip-start" value="` + todayFormat + `">
                                  - <input class="form-select1" type="date" id="end" name="trip-end" value="` + todayFormat + `">
                                  <button type="button" class="btn btn-warning" onclick="intervalSearch()">검색</button>
                                </td>
                              </tr>
                              <tr>선택 기간에 외박일자가 포함되는 경우를 검색합니다</tr>
                              </table>
                              
                              <table class="table" id='nightoverTable'>
                                <thead>
                                <tr>
                                  <th scope="col">순번</th>
                                  <th>외박일</th>
										              <th>복귀일</th>
                                  <th>사유</th>
                                </tr>
                              </thead>
                              <tbody>
                            `
                $.each(result.list, function (index, over) {
                  // var sdate = new Date(over.startDate);
                  // var edate = new Date(over.endDate);
                  var startFormat = dateFormatter(over.startDate);
                  var endFormat = dateFormatter(over.endDate);

                  contents += `<tr><td>` + `<b>` + (++index) + `<b>` + `</td>
                          <td>`+ startFormat + `</td>
                          <td>` + endFormat + `</td>
                          <td>` + over.sleepOverReason + `</td></tr>
                          `;
                })
                contents += `</tbody></table><button type="button" class="btn btn-warning" onclick="sleepoverChart()">통계보기</button>`

                $('#content').empty();
                $('#content').append(contents);
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })
          }
          else if (menu == '결제내역') {

            //ajax로 결제내역 가져옴
            $.ajax({
              type: "GET",
              url: "/mypage/payments",
              success: function (result) {
                console.log("성공")
                console.log(result);
                let contents = `<table class="table" id='nightoverTable'>
                            <thead>
                            <tr>
                              <th scope="col">결제일자</th>
                              <th scope="col">결제금액</th>
                            </tr>
                          </thead>
                          <tbody>`;
                //forEach 안에서 tr 생성
                $.each(result, function (index, payment) {
                  var localetime = dateFormatter(payment.payDate);
                  contents += `<tr>
                                  <td>`+ localetime + `</td>
                                  <td>` + payment.payAmount + `</td>
                                </tr>`
                })
                //포이치 끝나면 tbody 닫아줌...
                contents += `</tbody></table>`
                $('#content').empty()
                $('#content').append(contents)
              },
              error: function (request, status, error) {
                console.log("에러")
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
              }
            })
          }
          else if (menu == '내 커뮤니티') {
            //ajax로 내가 쓴 글 가져옴
            //제목 뒤엔 [n]으로 댓글 수 표시
            $.ajax({
              type: "GET",
              url: "/mypage/myboard",
              success: function (result) {
                console.log("성공")
                console.log(result);

                var contents = `<table class="table">
                    <thead>
                      <tr>
                        <th scope="col">게시판</th>
                        <th scope="col">글제목</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>`
                $.each(result, function (index, post) {
                  let writetime = dateFormatter(post.writeDate);
                  var time = new Date(post.writeDate);
                  var localetime = time.toLocaleString("ko-KR");
                  var year = time.getFullYear();
                  var month = time.getMonth() + 1;
                  var day = time.getDate();
                  if (month < 10) {
                    month = "0" + month;
                  }
                  if (day < 10) {
                    day = "0" + day;
                  }

                  let bname = "";
                  if(post.boardName == "자유게시판"){
                    bname = "freeBoardList"
                  }else if(post.boardName == "거래게시판"){
                    bname="productBoardList"
                  }else if(post.boardName == "건의게시판"){
                    bname="opinionList"
                  }else if(post.boardName == "공지사항"){
                    bname="noticeList"
                  }else{
                    bname = "custom/" + post.boardName;
                  }

                  let link = "/board/" + bname + "/" + post.idx;
                  console.log(link)
                  contents += "<tr><td>" + post.boardName +
                    `</td><td style='text-align:left'><a class="hjtitle" href='` + link + `'>` + post.title 
                    + "&nbsp;<span id='hjreply'> <i class='bi-chat-dots'>" + post.replyCount + "</span></a>" +
                    "</td><td>" + writetime +
                    "</td></tr>";

                })
                contents += "</tbody></table>"

                $('#content').empty()
                $('#content').append(contents)

              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })


          }
          else if (menu == '벌점이력') {

            $.ajax({
              type: "GET",
              url: "/mypage/demerit",
              success: function (result) {
                console.log("성공")
                console.log(result);
                let contents = `<p align="left"><b>누적 벌점 : `+  result.total +`점</b></p>
                    <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">일자</th>
                        <th scope="col">사유</th>
                        <th scope="col">부여벌점</th>
                      </tr>
                    </thead>
                    <tbody>`;
                
                $.each(result.list, function(index, demerit){
                  console.log(demerit);
                  contents+= `<tr><td>` + demerit.demeritDate + `</td>
                              <td>` + demerit.demeritReason + `</td>
                              <td>` + demerit.demerit + `</td>
                              </tr>`
                })
                contents += '</tbody></table>'
                $('#content').empty()
                $('#content').append(contents)
              },
              error: function (err) {
                console.log("에러");
                console.log(err);
              }
            })

          }else if(menu == '나의 통계'){
            location.href='/mypage/mychart'
          }
        })


        function dateFormatter(date){
            var wantDate = new Date(date);
            // 년도 getFullYear()
            var year = wantDate.getFullYear();
            // 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
            var month = wantDate.getMonth() + 1
            // 일 getDate()
            var date = wantDate.getDate(); // 일
            if (month < 10) {
              month = "0" + month;
            }
            if (date < 10) {
              date = "0" + date;
            }
            var wantDateFormat = year + "-" + month + "-" + date;
            return wantDateFormat;
        }
      </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

      </html>