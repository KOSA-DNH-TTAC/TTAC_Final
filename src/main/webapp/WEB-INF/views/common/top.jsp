<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between align-items-center">

      <div class="logo">
        <h1><a href="/"><img src="${pageContext.request.contextPath}/resources/assets/img/DOTO_LOGO.png"></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="/">Home</a></li>
          <!-- <li><a href="/">About</a></li>
          <li><a href="/">Services</a></li>
          <li><a href="portfolio.html">Portfolio</a></li>
          <li><a href="team.html">Team</a></li>
          <li><a href="pricing.html">Pricing</a></li> -->
          <li><a href="/community">Community</a></li>
          <li class="dropdown"><a><span>마이페이지</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/mypage">내 정보</a></li>
              <li><a href="#">마이 포인트 : 100p</a></li>
              <li><a href="#">내 식권보기</a></li>
              <li><a href="/login">로그인</a></li>
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