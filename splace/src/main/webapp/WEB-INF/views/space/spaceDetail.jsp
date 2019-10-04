<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
<title>SPLACE</title>
	<link rel="stylesheet" href="${contextPath }/resources/css/spaceDetail.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/swiper.css" type="text/css">

	<!-- 달력 -->
	<!-- <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'> -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto"/>
	<link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
	<link rel="stylesheet" href="${contextPath }/resources/css/calstyle.css" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="${contextPath }/resources/css/heartstyle.css">
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! -->
	<div id="wrapper">
		<div id="main">
		<jsp:include page="../common/top.jsp" />
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고
					nav 템플릿에 elements.html를 참고해주세용
				-->

				<section class="row">

					<div class="col-11">
						<!-- 공간 유형  -->
						<p>${type.typeName}</p>
					</div>
					<div class="col-1">
						<div id="like-container" style="cursor: pointer;">
						  <svg id="svg-container" class="heartbtn" version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 68.3 61.1"></svg>
						  <!-- <div class="heartbtn">Like</div> -->
						</div>
					</div>
					<div class="col-12">
						<div class="detailTitle">
							<p>${space.spaceName }</p>
						</div>
					</div>
					<div class="col-12">
						<div class="detailTag">
							<h3>${space.spaceTag}</h3>
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
							<p>${space.spaceComment}</p>
						</div>

						<!-- 공간 소개 -->
						<div class="spaceIntro fontStyle">
							<h2>공간소개</h2>
							<p></p>
							<h4>${space.spaceDetail}
							</h4>
						</div>

						<div class="spaceIntro">
							<div class="col-4 spaceTime fontStyle">
								<h2>영업 시간</h2>
								<p></p>
								<h4>[ ${space.spaceOpenTime }시 ~ ${space.spaceCloseTime}시 ]</h4>

							</div>
							<!-- <div class="col-4 spaceClose fontStyle">
								<h2>휴무일</h2>
								<p></p>
								<h4>[ 공휴일, 매주 일요일 ]</h4>
							</div> -->
							<div class="col-4 spaceClose fontStyle">
								<h2>수용인원</h2>
								<p></p>
								<h4>[ 최소 ${space.spaceMinPer}명, 최대 ${space.spaceMaxPer}명 ]</h4>
							</div>
						</div>
						<div class="spaceIntro fontStyle">
							<h2>공간 세부 옵션</h2>
							<p></p>

										
							<ol class="optionOl">
							
							<c:forEach items="${spaceO}" var="option">
								<li><h4><c:if test="${option.optionId < 'I'}">
									<i class="material-icons">
										<c:out value="${option.optionIcon }"/>
									</i>
								</c:if>
								<c:if test="${option.optionId >= 'I'}">
									<i class='<c:out value="${option.optionIcon }"/>'></i>												
								</c:if>
								<c:out value="${option.optionName }"/> &nbsp;
								</h4></li>
							</c:forEach>
							
							</ol>
						</div>

						<div class="spaceIntro fontStyle">
							<h2>예약시 주의사항</h2>
							<p></p>
							<ol>
							<!--  모르겠음  -->
								<c:forEach items="${spaceNotice }" var="no">
							
									<li><h4><c:out value="${no }" /></h4></li>
								
							</c:forEach> 
							</ol>
							<!--  모	르겠음  -->
						</div>

						<div class="spaceIntro fontStyle">
							<h2>환불 규정 안내</h2>
							<p></p>
							<h4>이용 2일전 총 금액의 <b>100% 환불</b></h4>
							<h4>이용 전날 총 금액의 <b>50% 환불</b></h4>
							<h4>이용 당일 <b>환불 불가</b></h4>
						</div>

						<div class="spaceIntro fontStyle">
							<h2>찾아오시는길</h2>
							<p></p>
							<h3>${space.spaceName }</h3>
							<h4>${space.spaceAddress}</h4>
							<!-- <h4>홈페이지</h4> -->
							<%-- <img class="mapImg" src="${contextPath }/resources/img/map.png"
								alt="..."> --%>
							<div id="map" style="width:100%;height:400px;border:1px solid #585858"></div>
							<!-- 지도 연동 -->
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=703f39fd6324ec678abee0446f28eee5&libraries=services"></script>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										mapOption = {
											center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											level: 3 // 지도의 확대 레벨
										};  
									
									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();
									
									// 주소로 좌표를 검색합니다
									<c:forTokens var="addr" items="${space.spaceAddress}" delims="," varStatus="status">
										<c:if test="${status.index eq 1}">
											geocoder.addressSearch('${addr}', function(result, status) {
										</c:if>
									</c:forTokens>
									
										// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {
									
											var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									
											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker({
												map: map,
												position: coords
											});
											
											// 길찾기 버튼 클릭시 페이지 이동
											$("#directions").click(function(){
												location.href="https://map.kakao.com/link/to/우리회사,"+coords.getLat()+","+coords.getLng();
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow({
												content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
											});
											infowindow.open(map, marker);
									
											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										} 
									}); 
								</script>
						</div>


						<!------- QnA ------->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>Q & A</h2>
								<p></p>
							</div>
							<!-- 글쓰기 버튼 -->
							<div class="writeBtn">
								<button type="button" class="fa fa-edit" data-toggle="modal" data-target="#exampleModalCenter" data-backdrop="static"></button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">Q&A작성</h5>
										</div>
										<form action="insertQnA.sp" method="post">
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
									<h5>${qna.qMemberId}</h5>
									<h4>${qna.qContent}</h4>
									<h6>${qna.qDate}</h6>
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
															<a href="#"><i class="fas fa-star"></i></a> 
															<a href="#"><i class="fas fa-star"></i></a>
															<a href="#"><i class="fas fa-star"></i></a> 
															<a href="#"><i class="fas fa-star"></i></a>
															<a href="#"><i class="fas fa-star"></i></a>
														</p>
													</div>
												</div>


												<textarea class="content" maxlength="300"></textarea>
												<!-- 글자수 세기 -->
												<div class="textCount">
													<p class="counter"></p>
												</div>
												<div class="wrapFile">
													<input type="file" name="file" id = "reviewFile3" class="reviewFile col-3"/>
													<label for="reviewFile3">
							                           <i class="far fa-image"></i>
							                        </label>
													<input type="file" name="file" class="reviewFile col-3"/>
													<input type="file" name="file" class="reviewFile col-3"/>
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
		                  
		                  <!-- 인원수 선택 -->
		                  <section>
		                  	<div>
		                  		
		                  	
		                  	</div>
		                  
		                  </section>
					</div><!-- detailRight끝 -->
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

				<section class="spaceIntro">
					<!-- Swiper -->
				  	<div class="swiper-container ">
				    	<div class="swiper-wrapper">
				      		<div class="swiper-slide hostSpace">
				      		<article>
								<span class="image">
									<img src="resources/img/studio.jpg" alt=""/>
								</span> 
								 <a href="#"></a>
								<span>
									<div class="locationName">
										<h3>Kh정보교육원</h3>
									</div>
									<div class="location">
										<span>
											<img src="resources/img/location.svg"> 서울시 중구
										</span>
									</div>
									<div class="tags">
										<span>#파티룸 #회의실 #중구</span>
									</div>
									<div class="price">
										<strong>10,000</strong> <span>원/시간</span>
									</div>
									<div class="reviewHeart">
										<span>
											<img src="resources/img/comment.svg"><span>10</span>&nbsp;&nbsp;&nbsp;
										</span> 
										<span> 
											<img src="resources/img/heart.svg"> <span>10</span>
										</span>
									</div>
								</span> 
							</article>
				      		</div>
							<div class="swiper-slide hostSpace">
						      	<article>
									<span class="image">
										<img src="resources/img/studio.jpg" alt=""/>
									</span> 
								 	<a href="#"></a>
									<span>
										<div class="locationName">
											<h3>Kh정보교육원</h3>
										</div>
										<div class="location">
											<span> 
												<img src="resources/img/location.svg"> 서울시 중구
											</span>
										</div>
										<div class="tags">
											<span>#파티룸 #회의실 #중구</span>
										</div>
										<div class="price">
											<strong>10,000</strong> <span>원/시간</span>
										</div>
										<div class="reviewHeart">
											<span> 
												<img src="resources/img/comment.svg"> <span>10</span>&nbsp;&nbsp;&nbsp;
											</span> 
											<span> 
												<img src="resources/img/heart.svg"> <span>10</span>
											</span>
										</div>
									</span> 
								</article>
					      	</div>
				      	<div class="swiper-slide hostSpace">
				      	<article>
						<span class="image">
							<img src="resources/img/studio.jpg" alt=""/>
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
				      </div>

				    </div>
				  </div>
				  
				</section>
	</div><!-- wrapper -->
	</div><!--main  -->
	</div><!-- inner -->
				
				
				
	<jsp:include page="../common/bottom.jsp"/>
	<script src="${contextPath }/resources/js/heartscript.js"></script>		
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