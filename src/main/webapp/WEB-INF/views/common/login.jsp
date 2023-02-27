<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:로그인</title>
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
<!--   <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  
  <!-- Jquery -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

  <link rel="stylesheet" type="text/css" href="style.css" />
  <link href="resources/assets/css/nightOver.css" rel="stylesheet">

<style>
/* Reset CSS */
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  font-size: 100%;
  vertical-align: baseline;
  background: transparent;
}
body {
  background: #DCDDDF url(https://cssdeck.com/uploads/media/items/7/7AF2Qzt.png);
  color: #000;
  font: 14px Arial;
  margin: 0 auto;
  padding: 0;
  position: relative;
}
h1{ font-size:28px;}
h2{ font-size:26px;}
h3{ font-size:18px;}
h4{ font-size:16px;}
h5{ font-size:14px;}
h6{ font-size:12px;}
h1,h2,h3,h4,h5,h6{ color:#563D64;}
small{ font-size:10px;}
b, strong{ font-weight:bold;}
a{ text-decoration: none; }
a:hover{ text-decoration: underline; }
.left { float:left; }
.right { float:right; }
.alignleft { float: left; margin-right: 15px; }
.alignright { float: right; margin-left: 15px; }
.clearfix:after,
form:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.container { margin: 25px auto; position: relative; width: 100%; }
#content {
  background: #f9f9f9;
  background: -moz-linear-gradient(top,  rgba(248,248,248,1) 0%, rgba(249,249,249,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -o-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -ms-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f9f9f9',GradientType=0 );
  -webkit-box-shadow: 0 1px 0 #fff inset;
  -moz-box-shadow: 0 1px 0 #fff inset;
  -ms-box-shadow: 0 1px 0 #fff inset;
  -o-box-shadow: 0 1px 0 #fff inset;
  box-shadow: 0 1px 0 #fff inset;
  border: 1px solid #c4c6ca;
  margin: 0 auto;
  margin-top: 85px;
  padding: 25px 0 0;
  position: relative;
  text-align: center;
  text-shadow: 0 1px 0 #fff;
  width: 400px;
}
#content h1 {
  color: #7E7E7E;
  font: bold 25px Helvetica, Arial, sans-serif;
  letter-spacing: -0.05em;
  line-height: 20px;
  margin: 10px 0 30px;
}
#content h1:before,
#content h1:after {
  content: "";
  height: 1px;
  position: absolute;
  top: 10px;
  width: 27%;
}
#content h1:after {
  background: rgb(126,126,126);
  background: -moz-linear-gradient(left,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
  background: -webkit-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -o-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -ms-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    right: 0;
}
#content h1:before {
  background: rgb(126,126,126);
  background: -moz-linear-gradient(right,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
  background: -webkit-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -o-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -ms-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    left: 0;
}
#content:after,
#content:before {
  background: #f9f9f9;
  background: -moz-linear-gradient(top,  rgba(248,248,248,1) 0%, rgba(249,249,249,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -o-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -ms-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f9f9f9',GradientType=0 );
  border: 1px solid #c4c6ca;
  content: "";
  display: block;
  height: 100%;
  left: -1px;
  position: absolute;
  width: 100%;
}
#content:after {
  -webkit-transform: rotate(2deg);
  -moz-transform: rotate(2deg);
  -ms-transform: rotate(2deg);
  -o-transform: rotate(2deg);
  transform: rotate(2deg);
  top: 0;
  z-index: -1;
}
#content:before {
  -webkit-transform: rotate(-3deg);
  -moz-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  -o-transform: rotate(-3deg);
  transform: rotate(-3deg);
  top: 0;
  z-index: -2;
}
#content form { margin: 0 0px; position: relative }  /* margin 값 때문에 CSS 꺠짐 */
#content form input[type="text"],
#content form input[type="password"] {
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  -ms-border-radius: 3px;
  -o-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
  background: #eae7e7 url(https://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat;
  border: 1px solid #c8c8c8;
  color: #777;
  font: 13px Helvetica, Arial, sans-serif;
  margin: 0 0 10px;
  padding: 15px 10px 15px 40px;
  width: 80%;
}
#content form input[type="text"]:focus,
#content form input[type="password"]:focus {
  -webkit-box-shadow: 0 0 2px #ed1c24 inset;
  -moz-box-shadow: 0 0 2px #ed1c24 inset;
  -ms-box-shadow: 0 0 2px #ed1c24 inset;
  -o-box-shadow: 0 0 2px #ed1c24 inset;
  box-shadow: 0 0 2px #ed1c24 inset;
  background-color: #fff;
  border: 1px solid #ed1c24;
  outline: none;
}
#logemail { background-position: 10px 10px !important }
#logpass { background-position: 10px -53px !important }
#content form input[type="submit"] {
  background: rgb(254,231,154);
  background: -moz-linear-gradient(top,  rgba(254,231,154,1) 0%, rgba(254,193,81,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -o-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -ms-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fee79a', endColorstr='#fec151',GradientType=0 );
  -webkit-border-radius: 30px;
  -moz-border-radius: 30px;
  -ms-border-radius: 30px;
  -o-border-radius: 30px;
  border-radius: 30px;
  -webkit-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -moz-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -ms-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -o-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  border: 1px solid #D69E31;
  color: #85592e;
  cursor: pointer;
  float: left;
  font: bold 15px Helvetica, Arial, sans-serif;
  height: 35px;
  margin: 20px 0 35px 15px;
  position: relative;
  text-shadow: 0 1px 0 rgba(255,255,255,0.5);
  width: 120px;
}
#content form input[type="submit"]:hover {
  background: rgb(254,193,81);
  background: -moz-linear-gradient(top,  rgba(254,193,81,1) 0%, rgba(254,231,154,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: -o-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: -ms-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fec151', endColorstr='#fee79a',GradientType=0 );
}
#content form div a {
  color: #004a80;
    float: right;
    font-size: 12px;
    margin: 30px 15px 0 0;
    text-decoration: underline;
}
.button {
  background: rgb(247,249,250);
  background: -moz-linear-gradient(top,  rgba(247,249,250,1) 0%, rgba(240,240,240,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(247,249,250,1) 0%,rgba(240,240,240,1) 100%);
  background: -o-linear-gradient(top,  rgba(247,249,250,1) 0%,rgba(240,240,240,1) 100%);
  background: -ms-linear-gradient(top,  rgba(247,249,250,1) 0%,rgba(240,240,240,1) 100%);
  background: linear-gradient(top,  rgba(247,249,250,1) 0%,rgba(240,240,240,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7f9fa', endColorstr='#f0f0f0',GradientType=0 );
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.1) inset;
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.1) inset;
  -ms-box-shadow: 0 1px 2px rgba(0,0,0,0.1) inset;
  -o-box-shadow: 0 1px 2px rgba(0,0,0,0.1) inset;
  box-shadow: 0 1px 2px rgba(0,0,0,0.1) inset;
  -webkit-border-radius: 0 0 5px 5px;
  -moz-border-radius: 0 0 5px 5px;
  -o-border-radius: 0 0 5px 5px;
  -ms-border-radius: 0 0 5px 5px;
  border-radius: 0 0 5px 5px;
  border-top: 1px solid #CFD5D9;
  padding: 15px 0;
}
.button a {
  background: url(https://cssdeck.com/uploads/media/items/8/8bcLQqF.png) 0 -112px no-repeat;
  color: #7E7E7E;
  font-size: 17px;
  padding: 2px 0 2px 40px;
  text-decoration: none;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}
.button a:hover {
  background-position: 0 -135px;
  color: #00aeef;
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

    </section>
  
  	<div class="container" style="width:100%; height: 400px;">
  <section id="content">
    <form id="myform" action="/login" method="POST">
      <h1>로그인</h1>
      <div>
        <!-- <input type="text" placeholder="Username" required="" id="username" /> -->
        <input type="text" name="username" class="form-style" placeholder="ID" id="logemail" autocomplete="off">
      </div>
      <div>
        <!-- <input type="password" placeholder="Password" required="" id="password" /> -->
        <input type="password" name="password" class="form-style" placeholder="Password" id="logpass" autocomplete="off">
      </div>
      <div class="form-check" style="padding:0 auto; display: flex; justify-content: center;">
        <input class="form-check-input" type="checkbox" name='remember-me'/>
        <span style="margin-left:10px;">로그인 상태 유지</span>
      </div>
      <!-- 로그인 실패 시 출력할 메세지 -->
		<%-- <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p> --%>
		<c:if test="${not empty param.fail}">
    		<div>
				<font color="red">
				<!-- <p>Your login attempt was not successful, try again.</p> -->
				<p>· ID 또는 패스워드가 맞지 않습니다.</p>
				</font>
				<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
    		</div>
    	</c:if>
      <div>
        <input type="submit" value="Log in" id="loginbtn"/>
        <a href="/forgot">비밀번호를 잊으셨나요?</a>
      </div>
    </form><!-- form -->
    
  </section><!-- content -->
</div><!-- container -->
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
  
  <!-- bootstrap5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
<script>
  $(document).ready(function(){
    setDate();
	
   	$("#loginbtn").click(function(event){
   		if($("#logemail").val() == ""){
   			alert("로그인 아이디를 입력해주세요");
   			$("#logemail").focus();
   		}else if($("#logpass").val() == ""){
   			alert("로그인 비밀번호를 입력해주세요");
   			$("#logpass").focus();
   		}else{
        event.preventDefault();
        let email = $('#logemail').val();
        let pwd = $('#logpass').val();
        
        
        $.ajax({
          url: '/getinfo',
          type: 'post',
          data: JSON.stringify({id : email,
                pwd : pwd}),
                dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        }).always(function(response){
         
          $('#myform').submit();
        })

       
      }
   	});
    		

  })
  
  function setDate(){
    let today = new Date();
    // 년도 getFullYear()
    let year = today.getFullYear(); 
    // 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
    let month = today.getMonth() + 1
    // 일 getDate()
    let date = today.getDate(); // 일

    if(month<10){
      month = "0" + month;
    }
    if(date<10){
      date = "0" + date;
    }

    let todayFormat = year + "-" + month + "-" + date;
    $(".datepick").val(todayFormat);
  }
</script>

</html>