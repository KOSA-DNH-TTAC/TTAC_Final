
window.onload = function (){

		function call(){
			$.ajax({
				type : "POST",
				url : "/eveningCall",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data : {
					"report" : report,
				}, 
				success : function(data) {
					alert(data);
					$('#location').empty();
					$('#location').append("<b>위도 : </b>"+lat+"  <b>경도 : </b>"+lon);
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
				var report=[lat, lon];
				$('#location').empty();
				$('#location').append("<b>위도 : </b>"+lat+"  <b>경도 : </b>"+lon);
				console.log("<b>위도 : </b>"+lat+"  <b>경도 : </b>"+lon)
				
				function mySpaceReport(){
					console.log("눌림?")
					console.log("<b>위도 : </b>"+lat+"  <b>경도 : </b>"+lon)
				}
			});
		}
		
	}