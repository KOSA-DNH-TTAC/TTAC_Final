<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>협력 대학교</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="/egg">성균관대학교</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/drawEgg">상명대학교</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">강남대학교</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">한서대학교</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">서울여자대학교</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>협력 기숙사</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">명륜학사</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">상명행복생활관</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">심전생활관</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">한서생활관</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="">샬롬하우스</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              254 Changgyeonggung-ro <br>
              Seoul Republic of Korea<br>
              Jongno-gu <br><br>
              <strong>Phone:</strong> +82 02 2188 6980 <br>
              <strong>Email:</strong> kosa@naver.com<br>
            </p>

          </div>

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>About TTAC</h3>
            <p>TTAC, 그들은 대한민국의 한국소프트웨어 산업협회에 속한 개발자들이다.</p>
            <div class="social-links mt-3">
              <a onclick="window.open('https://github.com/JunHans');" class="jh"><i class="bx bi-github"></i></a>
              <a onclick="window.open('https://github.com/Domaya');" class="hj"><i class="bx bi-github"></i></a>
              <a onclick="window.open('https://github.com/Bamjong');" class="bj"><i class="bx bi-github"></i></a>
              <a onclick="window.open('https://github.com/Yebin1');" class="yb"><i class="bx bi-github"></i></a>
            </div>
			<br>
        		<div class="tomorrow"
		           data-location-id="065456"
		           data-language="EN"
		           data-unit-system="METRIC"
		           data-skin="dark"
		           data-widget-type="aqiMini"
		           style="padding-bottom:22px;position:relative;"
		        >
		          <a
		            href="https://www.tomorrow.io/weather-api/"
		            rel="nofollow noopener noreferrer"
		            target="_blank"
		            style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;"
		          >
		            <img
		              alt="Powered by the Tomorrow.io Weather API"
		              src="https://weather-website-client.tomorrow.io/img/powered-by.svg"
		              width="250"
		              height="18"
		            />
		          </a>
		        </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span> Eterna</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/"> BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->
            <script>
        (function(d, s, id) {
            if (d.getElementById(id)) {
                if (window.__TOMORROW__) {
                    window.__TOMORROW__.renderWidget();
                }
                return;
            }
            const fjs = d.getElementsByTagName(s)[0];
            const js = d.createElement(s);
            js.id = id;
            js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

            fjs.parentNode.insertBefore(js, fjs);
        })(document, 'script', 'tomorrow-sdk');
        </script>
</body>
</html>