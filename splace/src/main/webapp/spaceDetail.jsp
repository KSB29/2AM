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
						<h4>강남 역세권의 강남대로 변로변에 위치한 빌딩에 입접한</h4>
					</div>
					
				</div>
				
				<!-- 오른쪽 부분 : 공간 예약관련  -->
				<div class="detailRight">
					<div class="reservation">
						<p>예약하기</p>
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