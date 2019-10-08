<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
	<link rel="stylesheet" href="${contextPath }/resources/css/spaceDetail.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/swiper.css" type="text/css">

	<!-- 달력 -->
	<!-- <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'> -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto"/>
	<link rel='stylesheet' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
	<link rel="stylesheet" href="${contextPath }/resources/css/calstyle.css" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">

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
					<!-- 찜 -->
			
					<div class="col-1" id="wishBody">
				
						
						<img src="${contextPath }/resources/img/dislike.png" id="dislike" style="display:none">
						<img src="${contextPath }/resources/img/like.png" id="like" style="display:none">
						
					</div>
			
					<script>
					var spaceId = ${space.spaceId};
					// 찜 하기
						$("#dislike").click(function(){
						var spaceId = ${space.spaceId};
							$.ajax({
								url:"wishList.sp",
								data:{spaceId: spaceId},
								type:"post",
								success:function(result){
									if(result=="success")
										alert("찜 했음!");
										checkWish();
										}
								});
							});
						 
					$(function(){
						checkWish();
					});
					
					// 찜 여부 조회
					function checkWish(){
						$.ajax({
							url:"wishSelect.sp",
							data:{spaceId:spaceId},
							type:"post",
							success:function(result){
								if(result=="success"){
									$("#dislike").css("display","block");
									$("#like").css("display","none");
								}else{
									$("#dislike").css("display","none");
									$("#like").css("display","block");
									}
								}
							});
						}
						// 찜 취소
						$("#like").click(function(){
							var spaceId = ${space.spaceId};
							
							$.ajax({
								url:"wishDelete.sp",
								data:{spaceId:spaceId},
								type:"post",
								success:function(result){
									if(result=="success")
									alert("찜취소");
									checkWish();
								}
									
							});
						});
					</script>
			
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
								<c:forEach items="${spaceAttImg }" var="images">
	                           		<div class="carousel-item w-100 h-100 active" data-interval="10000">
	                              		<img src="${contextPath }/resources/spaceImg/${images}" class="d-block w-100 height26" alt="...">
	                          		 </div>
	                           </c:forEach>
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
							<div class="col-4 spaceClose fontStyle">
								<h2>수용인원</h2>
								<p></p>
								<h4>[ 최소 ${space.spaceMinPer}명, 최대 ${space.spaceMaxPer}명 ]</h4>
							</div>
						</div>
						
						<!-- 공간 세부 옵션 -->
						<div class="spaceIntro fontStyle">
							<h2>공간 세부 옵션</h2>
							<p></p>
							<ol class="optionOl">
								<c:forEach items="${spaceO}" var="option">
									<li><h4>
										<c:if test="${option.optionId < 'I'}">
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
						<!-- 공간 세부 옵션  끝-->
	
						<!-- 주의 사항 -->
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
						<!-- 주의 사항 끝  -->
						<!-- 환불 규정 -->
						<div class="spaceIntro fontStyle">
							<h2>환불 규정 안내</h2>
							<p></p>
							<h4>이용 2일전 총 금액의 <b>100% 환불</b></h4>
							<h4>이용 전날 총 금액의 <b>50% 환불</b></h4>
							<h4>이용 당일 <b>환불 불가</b></h4>
						</div>
						<!-- 환불 규정 끝 -->
					
						<!-- 지도  -->
						<div class="spaceIntro fontStyle">
							<h2>찾아오시는길</h2>
							<p></p>
							<h3>${space.spaceName }</h3>
							<h4>전화번호</h4>
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
												content: '<div style="width:190px;text-align:center;padding:6px 0;">${space.spaceName}</div>'
											});
											infowindow.open(map, marker);
									
											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										} 
									}); 
								</script>
						</div>
						<!-- 지도 끝 -->

				   <!------- QnA ------->
                  <div class="spaceIntro">
                     <div class="write fontStyle">
                        <h2>Q & A</h2>
                        <p></p>
                     </div>
                     <!-- 글쓰기 버튼 -->
                     <c:if test="${!empty loginUser}">
                        <div class="writeBtn">
                           <button type="button" class="fa fa-edit" data-toggle="modal" data-target="#exampleModalCenter" data-backdrop="static"></button>
                        </div>
                     </c:if>
                     <!-- Modal -->
                     <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="exampleModalCenterTitle">Q&A작성</h5>
                              </div>
                              <div>
                                 <h5>작성자  ${ loginUser.memberId }</h5>
                              
                              </div>
                              <%-- <form action="insertQnA.sp?spaceId=${space.spaceId}" method="post"> --%>
                                 <div class="modal-body">
                                    <textarea class="qContent" maxlength="300" name="qContent"></textarea>
                                    <!-- 글자수 세기 -->
                                    <div class="textCount">
                                       <p class="counter"></p>
                                    </div>
                                 </div>

                                 <div class="modal-footer">
                                    <button class="button primary cancel" data-dismiss="modal">취소</button>
                                    <button class="button submitQnA" id="submitQnA" data-dismiss="modal">등록</button>
                                 </div>
                              <!-- </form> -->
                           </div>
                        </div>
                     </div>
                     <!--Modal끝  -->

                     <!-- QnA list 출력 -->
                     <div class="QnAList">
                     
                           <!-- <div class="QDelete">
                              <button>[삭제]</button>
                           </div> -->
                        <div class="QnA_QA">
                        
                        
                           
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
		                     <i class="material-icons">today</i>
		                     <input type="text" data-type="date" id="date-input" />
		                     <div id="material-header-holder" style="display: none"></div>
		                  </div>
               			<script>
               				$(function(){
               					$("#data-input").onchange(function(){
               						$(".timeHeader")
               					})
               					
               				})
               			</script>
		                  <div class="timeHeader" style="display:hidden;">
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
							<c:forEach items="${hostSpace}" var="host">
								<div class="swiper-slide hostSpace">
									<article>
										<span class="image"> 
											<img src="${contextPath }/resources/spaceImg/${host.spaceAttChange}" alt="" />
										</span> 
											<a href="${sDetail}"></a> 
											<span>
											<div class="locationName">
												<h3>${host.spaceName }</h3>
											</div>
											<div class="location">
												<span> <img src="resources/img/location.svg">
													서울시 중구 <c:forTokens var="addr" items="${host.spaceAddress}"
														delims="," varStatus="status">
														<c:if test="${status.index eq 1}">
														${addr}
													</c:if>
													</c:forTokens>
												</span>
											</div>
											<div class="tags">
												<span>${host.spaceTag }</span>
											</div>
											<div class="price">
												<strong>10,000</strong> <span>원/시간</span>
											</div>
										</span>
									</article>
								</div>
							</c:forEach>

						</div>
					</div>

				</section>
			</div>
			<!-- wrapper -->
	</div>
	<!--main  -->
	</div>
	<!-- inner -->
				
				
				
	<jsp:include page="../common/bottom.jsp"/>
	
	
	<script src="${contextPath }/resources/js/spaceDetail.js"></script> 
 	<script src="${contextPath }/resources/js/calscript.js"></script> 
	
	<!-- 시간, 호스트 다른 공간 슬라이드 -->
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

	<!-- 달력 -->
     <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script> 
 	<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.js'></script>  
	
	<!--  ajax  -->
	   <script>
	   
	   // 질문 등록 
	    $("#submitQnA").on("click",function(){
	       var qContent = $(".qContent").val();
	       var spaceId = ${space.spaceId};
	       
	       $.ajax({
	          url : "insertQnA.sp",
	          data:{qContent:qContent,spaceId :spaceId },
	          type:"POST",
	          success: function(check){
	             console.log(check);
	             if(check=="success"){
	                $(".qContent").val("");
	                QnAList();
	                /* console.log("됐냐"); */
	             }
	          }
	       });
	    });
	    
	    QnAList();
	    
	    // 질문 리스트 출력 
	    function QnAList(){
	       var spaceId = ${space.spaceId};
	       
	       $.ajax({
	          url:"selectQnA.sp",
	          data: {spaceId:spaceId },
	          dataType:"JSON",
	          success: function(qList){
	             
	             var $QnA_QA=$(".QnA_QA");
	             var $QnAList=$(".QnAList");
	             
	             
	              $QnAList.html("");
	
	             
	             if(qList.length>0){
	                $.each(qList,function(i){
	              console.log("${loginUser.memberId}");
	                    
	                    
	                   var result = "";
	                   if("${loginUser.memberId}" == qList[i].qMemberId){
	                      result += '<div class= "QnA_QA">'
	                            + '<div class="QDelete"><button onclick="QADelete(' 
	                            +qList[i].qnaId
	                            +');">[삭제]</button></div>';
	                   }
	                  result += '<h6 style="display:none"> 답변 글 번호'
	                        + qList[i].qnaId
	                        + '</h6>'
	                        +'<h4> 작성자 [ '
	                         + qList[i].qMemberId 
	                         +" ]</h4>"
	                         +'<h5> 내용 [ '
	                         + qList[i].qContent 
	                         +" ]</h5>"
	                         +'<h6> 작성일 [ ' 
	                         + qList[i].qDate
	                         + " ]</h6>"
	                        + '<h5 class="AName"> 호스트 이름 [ '
	                         + qList[i].aMemberId 
	                         + " ]</h5>"
	                         +'<h4 class="AName"> 답변 내용 [ '
	                         + qList[i].aContent 
	                         +" ]</h4>"
	                         +'<h6 class="AName"> 답변 날짜 [ '
	                         + qList[i].aDate 
	                         +" ]</h6>"
	                         +'</div>';
	   
	    /*                      $QnA_QA.append(result); */ 
	                        $QnAList.append(result);
	                });
	             }
	          }, 
	          error :function(){
	             console.log("error");
	          }
	       });
	       
	    }
	    
	    // 질문 삭제 
	    function QADelete(qnaId){
	       console.log(qnaId);
	       $.ajax({
	          url :"deleteQnA.sp",
	          data:{qnaId:qnaId},
	          type:"POST",
	          success:function(check2){
	             if(check2=="ok"){
	                alert("등록된 질문이 삭제 되었습니다.");
	                QnAList();
	             }
	          }
	       });
	    }
</script>
</body>
</html>