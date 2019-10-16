<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>SPLACE - 찜 목록</title>
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
								<h1 class="center">위시 리스트</h1>
							</header>
							
						<div class="wishList_wrapper">
								<section class="wishList_border row">
									<article class="contents_box">
								<c:choose>
									<c:when test="${empty wishList }">
										<div class="center title">
											<h1 id="wish_title" class="center title">찜한 내역이 없습니다.</h1>	
										</div>
									</c:when>
									<c:otherwise>
									<c:forEach var="n" items="${wishList}">
										<div class="contents">
											<div id="img_box" class="con">
												<span><img src="/splace/resources/spaceImg/${n.spaceAttChange}"></span>
											</div>
											<div id="wish_info" class="con">
												<ul>
													<li><h3>${n.spaceName}</h3></li>
													<li><span class="location"><img id="location_img" src="resources/img/location.svg">${n.spaceAddress}</span></li>
													<li><span>${n.spaceTag }</span></li>
													<li><strong>5000원</strong>/시간</li>												
													<li>
														<span>최대 인원 : </span><strong>${n.spaceMaxPer}</strong><span>명</span>
													</li>
													<li>
													 	<input class="spaceId" type="hidden" value="${n.spaceId}"/>
													</li>													
													<li>
														<div class="reserver_btn">
															<a class="button primary small fit" href="${contextPath}/detailSpace.sp?spaceId=${n.spaceId}">예약</a>
														</div>
														<div class="reserver_btn">
															<a id="" class="button small fit deleteWish">삭제</a>
														</div>											
													</li>
												</ul>
											</div>
										</div>
										<input id="address" class="address" type="hidden" value="${n.spaceAddress}"/>										
									</c:forEach>	
									<input id="memberId" type="hidden" value="${loginUser.memberId}">
									</c:otherwise>											
								</c:choose>				
									</article>
									<div class="contents_box" id="map">
									</div>
								</section>							
								</div>
								
								<script>
										// Initialize and add the map
										function initMap() {
											
										  var map = new google.maps.Map(
											  document.getElementById('map'), {zoom: 12.5, center: {lat: -34.397, lng: 150.644}});
										
										  /* Google Geocoding. Google Map API에 포함되어 있다.*/
										  var geocoder = new google.maps.Geocoder();
										  var address;
										  
										  $(".location").on("click",function(){
											console.log($(this).text() );
											address = $(this).text();
										  	geocodeAddress(geocoder, map, address);
										  	
										  });
										  // submit 버튼 클릭 이벤트 실행
										  /*document.getElementById('location').addEventListener('click', function() {
										  console.log('submit 버튼 클릭 이벤트 실행');
										  // 여기서 실행
										   geocodeAddress(geocoder, map, address);
										});*/
										/**
										 * geocodeAddress
										 * 
										 * 입력한 주소로 맵의 좌표를 바꾼다.
										 */
										function geocodeAddress(geocoder, resultMap, address) {
											console.log('geocodeAddress 함수 실행');
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
								<!-- Scripts -->
								<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_ao9ONZbr-zIC6_fa1CcI3YBWrzvGmKI&callback=initMap" async defer></script>
								<script src="${contextPath}/resources/js/wishList.js"></script>
						</div>
					</div>
				</div>
	</body>
		<!-- Footer -->
		<jsp:include page="../common/bottom.jsp"/>
</html>