<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
<link rel="stylesheet" href="${contextPath }/resources/css/spaceDetail.css" type="text/css">
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! -->
	<div id="wrapper">
		<jsp:include page="WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고
					nav 템플릿에 elements.html를 참고해주세용
				-->
				
			<section class="row">
			
				<div class="col-11">
					<!-- 공간 유형  -->
					<p>[파티룸]</p>
				</div>
				<div class="col-1">
					<i class="fa fa-heart"></i>
				</div>
				<div class="col-12">
					<div class="detailTitle">
						<p>아모르 파티룸</p>
					</div>
				</div>
				<div class="col-12">
					<div class="detailTag">
						<h3>#파티룸 #우리집같은 #편안함</h3>
					</div>				
				</div>
				<!-- 이미지 슬라이드  -->
				<div class="col-12">
					<div class= "mainImg">
						<div id="carouselExampleInterval" class="carousel slide"data-ride="carousel">
							<div class="carousel-inner w-100 height26">
								<div class="carousel-item w-100 h-100 active" data-interval="10000">
									<img src="${contextPath }/resources/img/exam2.jpg" class="d-block w-100 height26" alt="...">
								</div>
								<div class="carousel-item w-100 height26" data-interval="2000">
									<img src="${contextPath }/resources/img/exam.jpg" class="d-block w-100 height26" alt="...">
								</div>
								<div class="carousel-item w-100 height26">
									<img src="${contextPath }/resources/img/exam2.jpg" class="d-block w-100 height26" alt="...">
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleInterval"role="button" data-slide="prev"> 
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
								<span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next"> 
								<span class="carousel-control-next-icon" aria-hidden="true"></span> 
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>			
				</div>
				
				
				<!-- 왼쪽 부분 : 공간에 대한 소개  -->
				<div class = "detailLeft">
					<!-- 공간 간단 소개 -->
					<div class="detailSimple"> 
						<p>파티룸이 필요한 여러분들을 위한 공간</p>
					</div>
					
					<!-- 공간 소개 -->
					<div class="spaceIntro fontStyle">
						<h2>공간소개</h2>
						<p></p>
						<h4>
							연트럴 파크 숲길 근처에 위치한 코코무드 플라워 카페입니다.
							홍대입구 3번 출구부터 시작되는 연트럴파크길을 따라 10분정도 쭈욱 길어오시다 보면
							눈과 마음이 즐거워지는 기분을 안고 코코무드에 도착하실겁니다.
						</h4>
					</div>
					
					<div class="spaceIntro">
						<div class="spaceTime"> 
							<h4>영업 시간 [ 10시 ~ 22시 ]</h4>
						</div>
						<div class="spaceClose">
							<h4>휴무일 [ 공휴일, 매주 일요일]</h4>
						</div>
					</div>
					<div class="spaceIntro fontStyle">
						<h2>시설 소개</h2>
						<p></p>
						<ol>
							<li><h4>화장실</h4></li>
							<li><h4>와아피이존</h4></li>
							<li><h4>블루투스 스피커 </h4></li>
						</ol>
					</div>
					
					<div class="spaceIntro fontStyle">
						<h2>예약시 주의사항</h2>
						<p></p>
						<ol>
							<li><h4>계약된 시간 준수</h4></li>
							<li><h4>촬영준비 및 세팅 장비철수 원상복수 시간은 계약시간에 포함</h4></li>
							<li><h4>수용가능 인원 최대 10명</h4></li>
						</ol>
					</div>
					
					<div class="spaceIntro fontStyle">
						<h2>환불 규정 안내</h2>
						<p></p>
						<h4>이용 7일전 총 금액의 100% 환불</h4>
						<h4>이용 7일전 총 금액의 100% 환불</h4>
					</div>
					
					<div class="spaceIntro fontStyle">
						<h2>찾아오시는길 </h2>
						<p></p>
						<h3>건물 이름 </h3>
						<h4>상세 주소 </h4>
						<h4>홈페이지 </h4>
						지도 api
					</div>
					
						
					<div class="spaceIntro QnAIntro">
						<div class="QnA fontStyle">
							<h2>Q & A </h2>
							<p></p>
						</div>
						<div>
							<button class="QnABtn">
								<a class="far fa-edit" href="#open-modal"></a>
							</button>
						</div>
						<div id="open-modal" class="modal-window">
						<div>
							<a href="#" title="Close" class="modal-close">X</a>
							dfdsfsdf
						</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				<!-- 오른쪽 부분 : 공간 예약관련  -->
				<div class="detailRight">
					<div class="reservation">
						<h2>예약하기</h2>
					</div>
				</div>
				
				
				
			</section>
			
			
			
			<!-- inner 끝 -->
			</div>
		</div>
		<jsp:include page="WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>