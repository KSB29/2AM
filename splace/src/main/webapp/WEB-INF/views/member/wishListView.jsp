<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- template -->
		<noscript><link rel="stylesheet" href="${contextPath }/resources/css/noscript.css"></noscript>
		<!-- js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- css -->	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="${contextPath }/resources/css/fontawesome-all.min.css" type="text/css">
		<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/wishlist.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		
		
	</head>
	<!-- Header -->
	<jsp:include page="../common/top.jsp"/>
	
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
						<jsp:include page="memberMenu.jsp"/>
							<header>
								<h1>위시 리스트</h1>
							</header>
							<body>
								<div class="border">
									<section class="photoframe">
										<article class="row">
												<div class="image info">
													<img src="${contextPath}/resources/img/pic01.jpg" alt="" />
												</div>																		
												<div class="contents col-4">
													<h3 id="location" class="line_height">kh 정보교육원</h3>
													<div class="content_box row">
														<ul class="content col-12">
															<li>#JAVA #보안 #국비지원</li>
															<li>서울시 종로구 대일빌딩</li>
															<li>운영시간:&nbsp; 09:00 ~ 23:00</li>
															<li>비용:&nbsp; 5000원/시간</li>
															<li>최대인원:&nbsp; 10명 </li>
														</ul>
														<div class="wish_btn_box col-12 ">
																<div class="wish_btn"> <a class="button fit" href="">예약 하기</a> </div>
																<div class="wish_btn"> <a class="button fit primary" href="">삭제</a> </div>
														</div>
													</div>
												</div>
												<div class="col-4" >
													<div id="map">
													</div>
													<input id="address" type="hidden" value="서울특별시 중구 남대문로 120 대일빌딩"/>						
												</div>
										</article>
									</section>
								</div>
								<script>
										// Initialize and add the map
										function initMap() {
											
										  var map = new google.maps.Map(
											  document.getElementById('map'), {zoom: 12.5, center: {lat: -34.397, lng: 150.644}});
										
										
										  /* Google Geocoding. Google Map API에 포함되어 있다.*/
										  var geocoder = new google.maps.Geocoder();
										
										  // 검색횟수 재한 때문에 주석처리 
										  geocodeAddress(geocoder, map);
										
										  // submit 버튼 클릭 이벤트 실행
										  document.getElementById('location').addEventListener('click', function() {
										  console.log('submit 버튼 클릭 이벤트 실행');

										  // 여기서 실행
										   geocodeAddress(geocoder, map);
										});


																			/**
										 * geocodeAddress
										 * 
										 * 입력한 주소로 맵의 좌표를 바꾼다.
										 */
										function geocodeAddress(geocoder, resultMap) {
											console.log('geocodeAddress 함수 실행');
							
											// 주소 설정
											var address = document.getElementById('address').value;
							
											/**
											 * 입력받은 주소로 좌표에 맵 마커를 찍는다.
											 * 1번째 파라미터 : 주소 등 여러가지. 
											 *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
											 * 
											 * 2번째 파라미터의 함수
											 *      ㄴ result : 결과값
											 *      ㄴ status : 상태. OK가 나오면 정상.
											 */
											geocoder.geocode({'address': address}, function(result, status) {
												console.log(result);
												console.log(status);
							
												if (status === 'OK') {
													// 맵의 중심 좌표를 설정한다.
													resultMap.setCenter(result[0].geometry.location);
													// 맵의 확대 정도를 설정한다.
													resultMap.setZoom(18);
													// 맵 마커
													var marker = new google.maps.Marker({
														map: resultMap,
														position: result[0].geometry.location
													});
							
													// 위도
													console.log('위도(latitude) : ' + marker.position.lat());
													// 경도
													console.log('경도(longitude) : ' + marker.position.lng());
												} else {
													alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
												}
											});
										}

										}
								</script>
								 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_ao9ONZbr-zIC6_fa1CcI3YBWrzvGmKI&callback=initMap"
								 async defer></script>
							</body>		

						</div>
					</div>
				</div>

				
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
				<!-- Footer -->
				<jsp:include page="../common/bottom.jsp"/>
				
</html>