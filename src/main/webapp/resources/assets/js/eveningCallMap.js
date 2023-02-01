
		window.onload = function (){
		
		
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function (position) {
				var lat = lat = position.coords.latitude,
					lon = position.coords.longitude;


				//  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
						level: 3
						// 지도의 확대 레벨 
					};


				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
				var positions = [
					{
						content: '<div>나의 현재 위치</div>',
						latlng: new kakao.maps.LatLng(lat, lon)
					}
					/* ,
					{
						content: '<div>마카로니 공원</div>',
						latlng: new kakao.maps.LatLng(37.5809194, 127.002413)
					},
					{
						content: '<div>3조의 보금자리</div>',
						latlng: new kakao.maps.LatLng(37.5834512, 126.999820)
					},
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
						position: positions[i].latlng // 마커의 위치
					});

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
			});
		}
		
	}