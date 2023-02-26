<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4DV6JYFYRH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4DV6JYFYRH');
</script>
  <meta charset="utf-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:저녁 점호</title>
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
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=172587aec5c5b7b4462a7f174770edd8"></script>

  <!--준한-->
  <!-- <script src="resources/assets/js/eveningCallMap.js"></script> -->

  <!-- Sweet Alert -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>

   <!-- ======= Header ======= -->
  <c:import url="/WEB-INF/views/common/top.jsp" />
  <!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>	
          <li>점호하기</li>
        </ol>
        <h2>점호하기</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

		<!-- 나의 위치 -->
        <div class="row">
          <div>
            <div class="info-box mb-4">
              <i class="bx bx-map"></i>
              <h3>나의 현재위치</h3>
              <p id="location"></p>
              	<div style="display:flex; justify-content:center; align-items:center; margin: auto; width:280px; height:5px; border-radius: 50px; border: none; background-color:#E96B56; color:white; margin-top:10px;">
              		
              	</div>
              <div id="hjmsgdiv">
                <button id="report"  style="width:130px; height:20; border-radius: 50px; padding:5px; border: none; background-color:#E96B56; color:white; margin-top:10px; font-size: large;">점호하기</button>
              </div>
            </div>
          </div>
        </div>
      
		<!-- 지도 -->
        <div class="row">
          <div>
            <div id="map" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></div>
          </div>
        </div>

      </div>
    </section>
    <!-- End Contact Section -->

  </main>
  <!-- End #main -->

   <!-- ======= Footer ======= -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- End Footer -->


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
  <script>
 
window.onload = function (){

  let report;


  var now = new Date();
  var start = new Date();
  start.setHours(20, 0, 0); // 오후 8시
  var end = new Date();
  end.setHours(22, 0, 0); // 오후 10시
  
    if ((now >= start && now <= end)) { // 오후 8시부터 10시 사이가 아니면
     
      Swal.fire(
        "NOPE",
        "점호 가능 시간이 아닙니다.",
        "error"
      )
      var button = document.getElementById('report');
      button.style.backgroundColor = '#cfcfcf';
      $('#report').prop('disabled', true);
    }

  $('#report').click(function(){
    mySpaceReport();
  })
  

  function mySpaceReport(){
      // call();
      $.ajax({
        type : "POST",
        url : "/eveningCall",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data : {
          "report" : report,
        }, 
        success : function(data) {
          
          $('#report').html("점호완료");
          $('#report').prop('disabled', true);
          
          if(data == 'ALREADY'){
            //이미 점호
            Swal.fire(
                  data,
                  '이미 점호를 했습니다',
                  'warning'
                  )
          }else if(data == 'SUCCESS'){
            Swal.fire(
                  data,
                  '점호가 완료되었습니다',
                  'success'
                  )
          }

        },
        error : function(data) {
          Swal.fire(
                  data,
                 
                  'error'
                  )
          // alert(data+": 에러, 또는 점호 가능한 지역이 아닙니다.");
        }
      });
    }
    

function call(){
 
  $.ajax({
    type : "POST",
    url : "/eveningCall",
    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    data : {
      "report" : report,
    }, 
    success : function(data) {
      Swal.fire(
							data,
							'점호가 완료되었습니다.',
							'success'
							)
    
    },
    error : function(data) {
      alert(data+": 에러, 또는 점호 가능한 지역이 아닙니다.");
    }
  });
}


if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function (position) {
    var lat = position.coords.latitude,
      lon = position.coords.longitude;


    //  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3
        // 지도의 확대 레벨 
      };

    var imageSrc = 'resources/assets/img/homemarker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
    var positions = [
      {
        content: '<div>나의 현재 위치</div>',
        latlng: new kakao.maps.LatLng(lat, lon),
        Image: ''
      }
       ,
      {
        content: '<div>KOSA대학교 기숙사</div>',
        latlng: new kakao.maps.LatLng(37.58333911134363, 126.99960091512034),
        Image: markerImage
      }
      /*,
      {
        content: '<div>3조의 보금자리</div>',
        latlng: new kakao.maps.LatLng(37.6834512, 127.999820)
      }
      ,
      {
        content: '<div>피자맛집</div>',
        latlng: new kakao.maps.LatLng(37.5845323, 126.997216)
      },
      {
        content: '<div>낙산공원</div>',
        latlng: new kakao.maps.LatLng(37.5818113, 127.006307)
      } */
    ];

    for (var i = 0; i < positions.length; i++) {
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: positions[i].Image // 마커이미지 설정 
      });
      // 마커를 생성합니다
      // var marker = new kakao.maps.Marker({
      // 	position: markerPosition, 
      // 	image: markerImage // 마커이미지 설정 
      // });

      // 마커에 표시할 인포윈도우를 생성합니다 
      var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
      });

      // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
      // 이벤트 리스너로는 클로저를 만들어 등록합니다 
      // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
      kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
      kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    }

    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
      return function () {
        infowindow.open(map, marker);
      };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
      return function () {
        infowindow.close();
      };
    }
    report=[lat, lon];
    $('#location').empty();
    $('#location').append("<b>위도 : </b>"+lat+"  <b>경도 : </b>"+lon);
      
  });
}

}
  </script>
</body>

</html>