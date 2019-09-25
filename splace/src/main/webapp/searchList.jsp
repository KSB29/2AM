<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.slide {
	width: auto;
	height: 24.7em;
	padding-left: 0px !important;
}

.row>section {
	position: relative !important;
	width: 100%;
	display: block;
	padding: 0;
	margin-top: 0;
	margin-left: 0;
}

.row>h2 {
	margin-top: 3em;
	margin-bottom: 0;
}

.tiles>.row>article {
	/* border:1px solid black;   */
	height: 23em;
}

.location>span>img, .reviewHeart>span>img {
	width: 1em;
	height: 1em;
}

.price, .reviewHeart {
	width: 3em;
	display: inline;
}

.price {
	margin-right: 4em
}

.locationName>h3 {
	margin-top: 1em;
	margin-bottom: 1em !important;
}

.row>p {
	font-size: 1.6em;
	font-weight: 200;
	padding-left: 1em;
}

.row>select {
	width: 14em;
	text-align: center !important;

}

#location, #option, #placeType{
text-align: center !important;
	padding-left:5em;
}

.searchOption{
width:23%;
margin-right:3%;
box-shadow: none;
border: none;
outline: none;
}

.searchOption:hover{
color: none;
box-shadow: none;
border: none;
outline: none;
background-color: none!important;
}

.searchOption:click{
background-color: none;
}
.searchOption:active{
color: none;
box-shadow: none;
border: none;
outline: none;
background-color: none!important;
}

.searchOption:focus{
box-shadow: none;
border: none;
outline: none;
background-color: none!important;
}

#searchButton{
margin-left: 2.4%;
width: 15%;
outline-style: none;

}

 #optionRow{
 margin-left:0.2%;
}
#optionRow>button{
 padding:0;
}

#optionRow>button:active{
  background-color: rgba(255, 255, 255, 0.1); 
}

.material-icons{
font-size:36px;
}


#optionField{
border:1px solid #585858;
border-radius: 5px;
margin-top:2%;
width:100%;
margin-right:0;
display: none; 

}
#optionField>ul{
list-style: none;
margin-top:3% !important;
}

#optionField>ul>li{
width: 24%;
display:inline-block;
box-sizing: border-box;
position:relative;
}


#optionField>ul>li>input.checkbox{
    position: absolute;
    left: 0;
    top: 0;
    width: 1px;
    height: 1px;
    z-index: -1;
}
input[type="checkbox"]:checked+ label{
	color:#4c74b9;
}

.tiles>.row{
width:100%;
}

.optionSection{
width:100%;}
</style>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
				<section>
					<div class="row">
						<p>[ 검색결과 ]입니다</p>
					</div>
				</section>
				
				<section>
					<div class="row">
						<span>상세검색</span>
					</div>
				</section>
				<!-- 상세 검색 리스트 구역 -->
				<section class="optionSection">
					<div class="row default-select" id="optionRow">
					<button class="searchOption">지역</button>
					<button class="searchOption">유형</button>
					<button class="searchOption" onclick="myFunction();">옵션</button>
					<button id="searchButton" class="button primary">search</button>
					</div>
				</section>
			
				<!-- 옵션 창 구역  -->
				<section>
					<div class="row" id="optionField">
						<ul>
							<li>
								<input type="checkbox" id="option1">
								<label for="option1">
									<i class="material-icons">fastfood</i>
									음식물반입가능
								</label>
							</li>
								<li>
								<input type="checkbox" id="option2">
								<label for="option2">
									<i class="material-icons">local_parking</i>
									주차가능
								</label>
							</li>
								<li>
								<input type="checkbox" id="option3">
								<label for="option3">
									<i class="material-icons">mic</i>
									음향/마이크
								</label>
							</li>
								<li>
								<input type="checkbox" id="option4">
								<label for="option4">
									<i class="material-icons">wifi</i>
									인터넷/와이파이
								</label>
							</li>
								<li>
								<input type="checkbox" id="option5">
								<label for="option5">
								<i class="material-icons">pets</i>
									반려동물동반가능
								</label>
							</li>
								<li>
								<input type="checkbox" id="option6">
								<label for="option6">
									<i class="material-icons">smoke_free</i>
									금연
								</label>
							</li>
								<li>
								<input type="checkbox" id="option7">
								<label for="option7">
									<i class="material-icons">live_tv</i>
									TV/프로젝터
								</label>
							</li>
								<li>
								<input type="checkbox" id="option8">
								<label for="option8">
									<i class="material-icons">local_bar</i>
									주류반입가능
								</label>
							</li>
								<li>
								<input type="checkbox" id="option9">
								<label for="option9">
									<i class="material-icons">local_printshop</i>
									복사/인쇄기
								</label>
							</li>
								<li>
								<input type="checkbox" id="option10">
								<label for="option10">
									<i class='fas fa-restroom'></i>
									화장실
								</label>
							</li>
								<li>
								<input type="checkbox" id="option11">
								<label for="option11">
									<i class='fas fa-chalkboard'></i>
									화이트보드
								</label>
							</li>
						 <li>
                        <input type="checkbox" id="option12">
                        <label for="option12">
                           <i class='fab fa-hotjar'></i>
                        	   난방기
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option13">
                        <label for="option13">
                           <i class='fas fa-wind'></i>
                     	      에어컨
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option14">
                        <label for="option14">
                           <i class='fas fa-video'></i>
                           CCTV
                        </label>
                     </li>
					</ul>
				</div>
				</section>
				
				
				<!-- 검색 결과 공간 리스트  -->
				<section class="tiles">
					<div class="row">
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
		
</div>		
</div>
	<jsp:include page="WEB-INF/views/common/bottom.jsp" />
	</div>
	
		<!-- Scripts -->
	<script>
	/* 옵션창 오픈클로즈 */
	function myFunction() {
		  var x = document.getElementById("optionField");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	</script>
</body>
</html>