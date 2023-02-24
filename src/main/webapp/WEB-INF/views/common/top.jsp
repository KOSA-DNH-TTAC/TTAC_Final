<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
  #msgbox{
    color:red;
  }
</style>
</head>
<script>
  $(document).ready(function(){
    $.ajax({
      type: "GET",
      url: "/top/notebox",
      success: function (result) {
        if(result == 'Y'){
          console.log(result)
          $('#msgbox').append('<img src="${pageContext.request.contextPath}/resources/assets/img/circle-square.svg"  style="color: red;"/>')
        }
      },
      error: function (request, status, error) {
                    console.log("에러")
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
    })
  })
</script>
<body>

<!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between align-items-center">

      <div class="logo">
        <h1><a href="/"><img src="${pageContext.request.contextPath}/resources/assets/img/DOTO_LOGO.png"></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

<sec:authentication property="principal" var="principal"/> 

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="/">Home</a></li>
          <!-- <li><a href="/">About</a></li>
          <li><a href="/">Services</a></li>
          <li><a href="portfolio.html">Portfolio</a></li>
          <li><a href="team.html">Team</a></li>
          <li><a href="pricing.html">Pricing</a></li> -->
          <li><a href="/board/noticeList">커뮤니티</a></li>
          <li><a href="/facility">시설물 신고</a></li>
          <li><a href="/memberCalendar">연간일정</a></li>
          <li class="dropdown"><a><span>마이페이지</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
             
             <sec:authorize access="isAnonymous()">
              <li><a href="/userlogin">로그인</a></li>
             </sec:authorize>
             <sec:authorize access="isAuthenticated()">
              <li><a href="/mypage">내 정보</a></li>
              <li><a href="#">포인트 : ${principal.memberPoint}</a></li>
              <li><a href="/message">쪽지함<span id="msgbox"></span></a></li>
              <li><a href="/eveningCall"><b style="color:black">점호하기</b></a></li> <!-- #E96B56 -->
              <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="/admin/adminMember"><b style="color:black">관리자페이지</b></a></li>
              </sec:authorize>
              <li><a href="/logout">로그아웃</a></li>
             </sec:authorize>

              <!-- <li><a href="/userlogin">로그인</a></li> -->
            </ul>
          </li>
          <!-- <li><a href="contact.html">Contact</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
     <!-- .navbar -->
    </div>
  </header>
  <!-- End Header -->

</body>

</html>