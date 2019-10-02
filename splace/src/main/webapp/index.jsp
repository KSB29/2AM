<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.slide{
    width: 100%;
    height: 24.7em;
}
.row>section{
	position:relative !important;
	width:100%;
	display:block;
	padding:0;
	margin-top: 0;
	margin-left:0;
 
	
}
.row>h2{
margin-top:3em;
margin-bottom:0;
}


.tiles>.row>article{
/* border:1px solid black;   */
height:23em;
}

.location>span>img,.reviewHeart>span>img{
width:1em;
height:1em;
}
.price, .reviewHeart{
width:3em;
display:inline;
}
.price{
margin-right:4em
}
.locationName>h3{
margin-top:1em;
margin-bottom: 1em !important;

}
</style>
<title>SPLACE</title>
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
	
		<jsp:include page="WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->

				<!--슬라이드   -->
				<section>
					<div class="row">
						<div id="carouselExampleInterval" class="carousel slide"data-ride="carousel">
							<div class="carousel-inner w-100 h-100">
								<div class="carousel-item w-100 h-100 active" data-interval="10000">
									<img src="resources/img/studio.jpg" class="d-block w-100 h-100" alt="...">
								</div>
								<div class="carousel-item w-100 h-100" data-interval="2000">
									<img src="resources/img/conference.jpg" class="d-block w-100 h-100" alt="...">
								</div>
								<div class="carousel-item w-100 h-100">
									<img src="resources/img/rooftop.jpg" class="d-block w-100 h-100" alt="...">
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
				</section>

				<!-- 추천 공간 -->
				<section>
					<div class="row">
						<h2>추천 공간</h2>
					</div>
					<hr>
				</section>
				
				<!-- 목록 -->
				<c:url var="bookForm" value="bookForm.sp">
					<c:param name="spaceId" value="1000"/>
					<c:param name="bookDate" value="191009"/>
					<c:param name="startTime" value="18"/>
					<c:param name="endTime" value="22"/>
					<c:param name="bookPer" value="3"/>
					<c:param name="price" value="1000"/>
				</c:url>
				<c:url var="bookList" value="bookList.sp" />
				<c:url var="bookDetail" value="bookDetail.sp" />
				<c:url var="bookCancel" value="bookCancel.sp" />
				<section class="tiles">
					<div class="row">
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> 
							<a href="${bookForm}"></a> 
							<span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> 
									<img src="resources/img/location.svg"> 
									서울시 중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> 
									<span>원/시간</span>
								</div>
								<div class="reviewHeart">
									<span> 
									<img src="resources/img/comment.svg"> 
									<span>10</span>&nbsp;&nbsp;&nbsp;
									</span> 
									<span> 
									<img src="resources/img/heart.svg"> 
									<span>10</span>
									</span>
								</div>
							</span>
						</article>
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> 
							<a href="${bookList}"></a> 
							<span>
									<div class="locationName">
										<h3>Kh정보교육원</h3>
									</div>
									<div class="location">
										<span> <img src="resources/img/location.svg"> 서울시
											중구
										</span>
									</div>
									<div class="tags">
										<span>#파티룸 #회의실 #중구</span>
									</div>
									<div class="price">
										<strong>10,000</strong> <span>원/시간</span>
									</div>
									<div class="reviewHeart">
										<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
										</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
										</span>
									</div>
							</span>
						</article>
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> <a href="${bookDetail}"></a> <span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> <img src="resources/img/location.svg"> 서울시
										중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> <span>원/시간</span>
								</div>
								<div class="reviewHeart">
									<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
									</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
									</span>
								</div>
							</span>
						</article>
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> <a href="#"></a> <span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> <img src="resources/img/location.svg"> 서울시
										중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> <span>원/시간</span>
								</div>
								<div class="reviewHeart">
									<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
									</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
									</span>
								</div>
							</span>
						</article>
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> <a href="#"></a> <span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> <img src="resources/img/location.svg"> 서울시
										중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> <span>원/시간</span>
								</div>
								<div class="reviewHeart">
									<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
									</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
									</span>
								</div>
							</span>
						</article>
						<article>
							<span class="image"> <img src="resources/img/studio.jpg"
								alt="" />
							</span> <a href="#"></a> <span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> <img src="resources/img/location.svg"> 서울시
										중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> <span>원/시간</span>
								</div>
								<div class="reviewHeart">
									<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
									</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
									</span>
								</div>
							</span>
						</article>
					</div>
				</section>
				
				<!-- 새로 등록된 공간  -->
				<section>
					<div class="row">
						<h2>새로 등록된 공간</h2>
					</div>
					<hr>
				</section>
				
				<!-- 목록  -->
				<section class="tiles">
					<div class="row">
						<c:if test="${!empty spaceList}">
						<article>
							<span class="image"> 
								<img src="resources/img/studio.jpg" alt="" />
							</span> 
								<a href="#"></a> 
								<span>
								<div class="locationName">
									<h3>Kh정보교육원</h3>
								</div>
								<div class="location">
									<span> 
									<img src="resources/img/location.svg">
									서울시 중구
									</span>
								</div>
								<div class="tags">
									<span>#파티룸 #회의실 #중구</span>
								</div>
								<div class="price">
									<strong>10,000</strong> <span>원/시간</span>
								</div>
							<!-- 	<div class="reviewHeart">
									<span> <img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
									</span> <span> <img src="resources/img/heart.svg"> <span>10</span>
									</span>
								</div> -->
							</span>
						</article>
						</c:if>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>