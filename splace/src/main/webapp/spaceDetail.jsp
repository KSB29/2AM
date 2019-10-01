<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
</style>
<title>SPLACE</title>
	<link rel="stylesheet" href="${contextPath }/resources/css/spaceDetail.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/swiper.css" type="text/css">

	<!-- 달력 -->
	<!-- <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'> -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto"/>
	<link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
	<link rel="stylesheet" href="${contextPath }/resources/css/calstyle.css" type="text/css">
	
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! -->
	<div id="wrapper">
		<jsp:include page="WEB-INF/views/common/top.jsp" />
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
						<div class="mainImg">
							<div id="carouselExampleInterval" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner w-100 height26">
									<div class="carousel-item w-100 h-100 active"
										data-interval="10000">
										<img src="${contextPath }/resources/img/exam2.jpg"
											class="d-block w-100 height26" alt="...">
									</div>
									<div class="carousel-item w-100 height26" data-interval="2000">
										<img src="${contextPath }/resources/img/exam.jpg"
											class="d-block w-100 height26" alt="...">
									</div>
									<div class="carousel-item w-100 height26">
										<img src="${contextPath }/resources/img/exam2.jpg"
											class="d-block w-100 height26" alt="...">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleInterval"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleInterval" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
					


					<!-- 왼쪽 부분 : 공간에 대한 소개  -->
					<div class="detailLeft">
						<!-- 공간 간단 소개 -->
						<div class="detailSimple">
							<p>파티룸이 필요한 여러분들을 위한 공간</p>
						</div>

						<!-- 공간 소개 -->
						<div class="spaceIntro fontStyle">
							<h2>공간소개</h2>
							<p></p>
							<h4>연트럴 파크 숲길 근처에 위치한 코코무드 플라워 카페입니다. 홍대입구 3번 출구부터 시작되는
								연트럴파크길을 따라 10분정도 쭈욱 길어오시다 보면 눈과 마음이 즐거워지는 기분을 안고 코코무드에 도착하실겁니다.
							</h4>
						</div>

						<div class="spaceIntro">
							<div class="col-4 spaceTime fontStyle">
								<h2>영업 시간</h2>
								<p></p>
								<h4>[ 10시 ~ 22시 ]</h4>

							</div>
							<div class="col-4 spaceClose fontStyle">
								<h2>휴무일</h2>
								<p></p>
								<h4>[ 공휴일, 매주 일요일 ]</h4>
							</div>
							<div class="col-4 spaceClose fontStyle">
								<h2>수용인원</h2>
								<p></p>
								<h4>[ 최소 2명, 최대 6명 ]</h4>
							</div>
						</div>
						<div class="spaceIntro fontStyle">
							<h2>시설 소개</h2>
							<p></p>
							<ol>
								<li><h4>화장실</h4></li>
								<li><h4>와아피이존</h4></li>
								<li><h4>블루투스 스피커</h4></li>
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
							<h2>찾아오시는길</h2>
							<p></p>
							<h3>건물 이름</h3>
							<h4>상세 주소</h4>
							<h4>홈페이지</h4>
							<img class="mapImg" src="${contextPath }/resources/img/map.png"
								alt="...">
						</div>


						<!------- QnA ------->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>Q & A</h2>
								<p></p>
							</div>
							<!-- 글쓰기 버튼 -->
							<div class="writeBtn">
								<button type="button" class="fa fa-edit" data-toggle="modal"
									data-target="#exampleModalCenter" data-backdrop="static"></button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">Q&A
												작성</h5>
										</div>
										<form action="">
											<div class="modal-body">
												<textarea class="content" maxlength="300"></textarea>
												<!-- 글자수 세기 -->
												<div class="textCount">
													<p class="counter"></p>
												</div>
											</div>

											<div class="modal-footer">
												<button type="reset" class="button primary cancel"
													data-dismiss="modal">취소</button>
												<button type="button" class="button">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!--Modal끝  -->

							<!-- QnA list 출력 -->
							<div class="QnAList">
								<div class="QDelete">
									<button>[삭제]</button>
								</div>
								<div class="QnA_Q">
									<h5>이름</h5>
									<h4>질문내용</h4>
									<h6>작성날짜</h6>
								</div>
								<div class="QnA_A">
									<h5 class="AName">호스트이름</h5>
									<h4>답변 내용</h4>
									<h6>작성날짜</h6>
								</div>
							</div>
							<!-- Q&A 페이징 처리 -->
							<div class="paging">
								<p>페이징</p>
							</div>
						</div>
						<!-- QnA끝 -->

						<!-------리뷰 -------->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>이용 후기</h2>
								<p></p>
							</div>
							<!-- 글쓰기 버튼 -->
							<div class="writeBtn">
								<button type="button" class="fa fa-edit" data-toggle="modal"
									data-target="#exampleModalCenter2" data-backdrop="static"></button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">이용
												후기 작성</h5>
										</div>

										<form action="">
											<div class="modal-body">
												<div class="starArea">
													<h5 class="starGrade">별점</h5>
													<div class="starChange">
														<p id="star_grade">
															<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
																class="fas fa-star"></i></a> <a href="#"><i
																class="fas fa-star"></i></a> <a href="#"><i
																class="fas fa-star"></i></a> <a href="#"><i
																class="fas fa-star"></i></a>
														</p>
													</div>
												</div>


												<textarea class="content" maxlength="300"></textarea>
												<!-- 글자수 세기 -->
												<div class="textCount">
													<p class="counter"></p>
												</div>
												<input multiple="multiple" class="fileMult" type="file"
													name="filename[]" />
											</div>

											<div class="modal-footer">
												<button type="reset" class="button primary cancel"
													data-dismiss="modal">취소</button>
												<button type="button" class="button">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!--  review list 출력 -->
							<div class="reviewList">
								<div class="reviewBtn">
									<button>[수정]</button>
									<button>[삭제]</button>
								</div>
								<div class="review">
									<h5>이름</h5>
									<h5>별점</h5>
									<h4>리뷰 내용</h4>
									<h6>작성날짜</h6>
								</div>
							</div>
							<!-- review 페이징 처리 -->
							<div class="paging">
								<p>페이징</p>
							</div>
						</div>
						<!-- review끝 -->

					</div>
					<!-- detailLeft 끝-->


					<!-- 오른쪽 부분 : 공간 예약관련  -->
					<div class="detailRight">
						<div class="reservation leftfontStyle">
							<h2>예약하기</h2>
							<p></p>
						</div>
						   <div class="calender">
		                     <h3>날짜 선택</h3>
		                     <p></p>
		                     <input type="text" data-type="date" id="date-input" />
		                     <div id="material-header-holder" style="display: none"></div>
		                  </div>
               
		                  <div class="timeHeader" style="display:block;">
		                     <h3>시간 선택</h3>
		                     <h3>9시-10시</h3>
		
		                     <p></p>
		
		                     <div id="timeOption" style="display: block;">
		                        <!-- Swiper -->
		                        <div class="swiper-container">
		                           <div class="swiper-wrapper">
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="1" value="1">
		                                 <label for="1"> 1시 <br>1000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="2" value="2">
		                                 <label for="2"> 2시 <br>2000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="3" value="3">
		                                 <label for="3"> 3시 <br>3000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="4" value="4">
		                                 <label for="4"> 4시 <br>4000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="5" value="5">
		                                 <label for="5"> 5시 <br>5000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="6" value="6">
		                                 <label for="6"> 6시 <br>6000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="7" value="7">
		                                 <label for="7"> 7시 <br>7000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="8" value="8">
		                                 <label for="8"> 8시 <br>8000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="9" value="9">
		                                 <label for="9"> 9시 <br>9000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="10" value="10">
		                                 <label for="10">10시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="11" value="11">
		                                 <label for="11">11시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="12" value="12">
		                                 <label for="10">12시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="13" value="13">
		                                 <label for="10">13시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="14" value="14">
		                                 <label for="10">14시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="15" value="15">
		                                 <label for="10">15시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="16" value="16">
		                                 <label for="10">16시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="17" value="17">
		                                 <label for="10">17시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="18" value="18">
		                                 <label for="10">18시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="19" value="19">
		                                 <label for="10">19시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="20" value="20">
		                                 <label for="10">20시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="21" value="21">
		                                 <label for="10">21시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="22" value="22">
		                                 <label for="10">22시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="23" value="23">
		                                 <label for="10">23시 <br>10000원
		                                 </label>
		                              </div>
		                              <div class="swiper-slide">
		                                 <input type="checkbox" name="timeSelect" id="24" value="24">
		                                 <label for="10">24시 <br>10000원
		                                 </label>
		                              </div>
		                           </div>
		
		                           <!-- Add Arrows -->
		                           <div class="swiper-button-next"></div>
		                           <div class="swiper-button-prev"></div>
		                        </div>
		                     </div>
		                  </div>






					</div>
					<!-- detailRight끝 -->

				</section>


				<section class="section">

					<!-- 호스트의 다른 공간 -->
					<div class="spaceIntro">
						<div class="write fontStyle">
							<h2>호스트의 다른 공간</h2>
							<p></p>
						</div>
					</div>
				</section>
				<!-- 				<section class="tiles">
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
				</section> -->
				<section>
					<!-- Swiper -->
				  <div class="swiper-container hostSpace">
				    <div class="swiper-wrapper">
				      <div class="swiper-slide">
				      	Slide 1
				      </div>
				      <div class="swiper-slide">Slide 2</div>
				      <div class="swiper-slide">Slide 3</div>
				      <div class="swiper-slide">Slide 4</div>
				      <div class="swiper-slide">Slide 5</div>
				      <div class="swiper-slide">Slide 6</div>
				      <div class="swiper-slide">Slide 7</div>
				      <div class="swiper-slide">Slide 8</div>
				      <div class="swiper-slide">Slide 9</div>
				      <div class="swiper-slide">Slide 10</div>
				    </div>
				  </div>
				  
				</section>
				
				
				
				
				<jsp:include page="WEB-INF/views/common/bottom.jsp"/>
				
	<script src="${contextPath }/resources/js/spaceDetail.js"></script> 
 	<script src="${contextPath }/resources/js/calscript.js"></script> 
	
	<!-- 시간, 호스트 다른 공간 슬라이드 -->
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

	<!-- 달력 -->
     <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script> 
 	<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.js'></script>  
</body>
</html>