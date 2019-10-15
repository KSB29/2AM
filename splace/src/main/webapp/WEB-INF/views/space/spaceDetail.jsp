<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<img src="${contextPath }/resources/img/dislike.png" id="dislike"
							style="display: none"> <img
							src="${contextPath }/resources/img/like.png" id="like"
							style="display: none">
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
								success:function(status){
									if(status=="success")
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
										<div class="carousel-item w-100 h-100 active"
											data-interval="10000">
											<img src="${contextPath }/resources/spaceImg/${images}"
												class="d-block w-100 height26" alt="...">
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
							<h4>${space.spaceDetail}</h4>
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
							<div class="col-4 spaceClose fontStyle">
								<h2>예약시간</h2>
								<p></p>
								<h4>[ 최소 ${space.spaceTime}시간 이상]</h4>
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
												<i class="material-icons"> <c:out
														value="${option.optionIcon }" />
												</i>
											</c:if>
											<c:if test="${option.optionId >= 'I'}">
												<i class='<c:out value="${option.optionIcon }"/>'></i>
											</c:if>
											<c:out value="${option.optionName }" />
											&nbsp;
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
								<c:forEach items="${spaceNotice }" var="no">
									<li><h4>
											<c:out value="${no }" />
										</h4></li>
								</c:forEach>
							</ol>
						</div>
						<!-- 주의 사항 끝  -->
						<!-- 환불 규정 -->
						<div class="spaceIntro fontStyle">
							<h2>환불 규정 안내</h2>
							<p></p>
							<h4>
								이용 2일전 총 금액의 <b>100% 환불</b>
							</h4>
							<h4>
								이용 전날 총 금액의 <b>50% 환불</b>
							</h4>
							<h4>
								이용 당일 <b>환불 불가</b>
							</h4>
						</div>
						<!-- 환불 규정 끝 -->

						<!-- 지도  -->
						<div class="spaceIntro fontStyle">
							<h2>찾아오시는길</h2>
							<p></p>
							<h3>${space.spaceName }</h3>
							<h4><i class="fas fa-phone-alt phoneIcon"></i>${space.spacePhone }</h4>
							<h4>${space.spaceAddress}</h4>
							<div id="map"
								style="width: 100%; height: 400px; border: 1px solid #585858"></div>
							<!-- 지도 연동 -->
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=703f39fd6324ec678abee0446f28eee5&libraries=services"></script>
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
                  <!-- 공간에 대한 문의 리스트  -->
                        <div class="QnA_QA">

                        </div>
                       
                     </div>
                     
                     <!-- Q&A 페이징 처리 -->
                     <div class="QnAPaging">

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
												<div class="wrapFile">
													<input type="file" name="file" id="reviewFile3"
														class="reviewFile col-3" /> <label for="reviewFile3">
														<i class="far fa-image"></i>
													</label> <input type="file" name="file" class="reviewFile col-3" />
													<input type="file" name="file" class="reviewFile col-3" />
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
					<c:url var="book" value="bookForm.sp">
					<c:param name="spaceId" value="${space.spaceId }" />
					</c:url>
					<div class="detailRight">
					<form action="${book}" method="post">
						<div class="reservation leftfontStyle">
							<h2>예약하기</h2>
							<p></p>
						</div>
						<!-- 날짜 선택 -->
						<div class="calender">
							<h3>날짜 선택</h3>
							<a id="calIcon"></a> 
							<p></p>
							<input type="text" id="datepicker">
						</div>
						<!-- 날짜 선택  끝-->

						<!-- 시간 선택 -->
						<div class="timeHeader" style="display: none;">
							<h3>시간 선택</h3>
							<h3 class="start"></h3><h3 class="bar"></h3><h3 class="end"></h3>
							<p></p>
							<div class="time_select_wrap" style="display: block;">
								<!-- Swiper -->
								<ui class="time_slot"> 
								</ui>
							</div>
								<i class="fas fa-square" style="color:#585858"></i>
								예약 불가 
								<p class="warning">
								<i class="fas fa-exclamation-circle"></i>
								해당 금액은 1인 기준입니다.
								초과시 추가 금액  ${space.spaceAdd }원이 발생합니다.
								</p>
						</div>
						<!-- 시간 선택 끝 -->
						
						<!-- 예약 일시 -->
						<div class="BookingData" style="display:block;">
							<h3>예약일시</h3>
							<p></p>
							<h4 class="BookingDate"></h4>
							<h4 class="start4"></h4><h4 class="bar4"></h4><h4 class="end4"></h4>
						</div>
						<!-- 예약 일시 끝-->

						<!-- 인원수 선택 -->
						<div class="selectPeople">
							<h3>예약인원</h3>
							<h4>[ 최소 ${space.spaceMinPer}명, 최대 ${space.spaceMaxPer}명 ]</h4>
							<p></p>
							<div class="partyBoxWrap">
								<div class="minBtn personBtn">
									<a class="btn_minus partyBtn"> 
									<i class="material-icons" id="min" style="padding-top: 10px;">maximize</i>
									</a>
								</div>
								<div class="personCkeck">
									<input type="tel" value="${space.spaceMinPer}" id="partyInput">
								</div>
								<div class="maxBtn personBtn">
									<a class="btn_plus partyBtn"> 
									<i class="material-icons"id="plu">add</i>
									</a>
								</div>
							</div>
						</div>
						<!-- 인원수 선택  끝-->
						
						<!-- 공간 사용료 -->
						<div class="totalCount">
							<div class="totalCountD">
							<h3 class="finalTotal1">공간사용료</h3>
							<h3 class="finalTotal2"></h3>
							</div>
							<h3 class="totalPrice"></h3><h3 class="totalPrice2"></h3>
							<h3 class="addPrice"></h3><h3 class="totalPrice3"></h3>
							
						</div>
						<!-- 공간 사용료 끝 -->
						<button type="submit" class="button primary fit" id="reserveBtn" onclick="return rDataCheck();"> 바로 예약하기</button>
					</form>
					</div>
					<!-- detailRight끝 -->
					</section>
					<!-- section Row 끝 -->
					
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
								<c:url var="sDetail" value="detailSpace.sp">
									<c:param name="spaceId" value="${host.spaceId }"></c:param>
								</c:url>
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
					<!-- inner -->
			</div>
				<!--main  -->


			</div>
			<!-- wrapper -->
				
	<jsp:include page="../common/bottom.jsp"/>
	
	
	<script src="${contextPath }/resources/js/spaceDetail.js"></script> 
	
	<!-- 시간, 호스트 다른 공간 슬라이드 -->
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

	<!-- 달력 -->
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>  
 	<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.js'></script>
	
	<!--  ajax  -->
	      <script>
	 
	      function rDataCheck(){
	    	 var regExpCheck= true;
	   	    		if($("#datepicker").val()==""){
	   	      			console.log()
	   	      			alert("예약일을 선택해주세요!");
	   	      			$("#datepicker").focus();
	   	      			
	   	      			regExpCheck=false;
	   	    		}
	   	  
	   	  			if($("input:checkbox[name=timeClick]:checked").length< ${space.spaceTime}){
	   	      			alert("최소 예약시간을 확인해주세요!");
	   	      			$(".timeHeader").focus();
	   	      			regExpCheck=false;
	   	      		}
	   	    	return regExpCheck;
	    	};
	      
			
		$(function() {
			// 휴무일 
				var dayArr = "${dayArr}";
				var disabledDays=[];
				<c:forTokens var="day" items="${dayArr}"
					delims=", " varStatus="status">
					disabledDays.push("${day}");
				</c:forTokens>
				var headerHtml = $("#material-header-holder .ui-datepicker-material-header");
			
				var changeMaterialHeader = function(header, date) {
				var year   = date.format('YYYY');
				var month  = date.format('MM');
				var dayNum = date.format('DD');
				var isoDay = date.isoWeekday();
								
				var weekday = new Array(7);
				weekday[1] = "Monday";
				weekday[2] = "Tuesday";
				weekday[3] = "Wednesday";
				weekday[4] = "Thursday";
				weekday[5] = "Friday";
				weekday[6] = "Saturday";
				weekday[7]=  "Sunday";
		
				$('.ui-datepicker-material-day', header).text(weekday[isoDay]);
				$('.ui-datepicker-material-year', header).text(year);
				$('.ui-datepicker-material-month', header).text(month);
				$('.ui-datepicker-material-day-num', header).text(dayNum);
			};
			
			$("#datepicker").datepicker({
			dateFormat: 'yy-mm-dd D',
	        showOn: "both",
	        showButtonPanel: true,
	        buttonImage: "${contextPath}/resources/img/calendar.png",
	        buttonImageOnly: true,
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			minDate: 1,
			maxDate: "+1M",
			closeText: 'OK',
			beforeShowDay: disableAllTheseDays
		});
			
		// 특정일 선택막기 
		function disableAllTheseDays(date) { 
		   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
		   for (i = 0; i < disabledDays.length; i++) { 
		       if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) { 
		           return [false]; 
		       } 
		   } 
		   return [true]; 
		}
			});
	   
	
	    
	 // 달력 선택 시 시간 div 표출
		$(function(){
			$("#datepicker").change(function(){
				var bookDate = $("#datepicker").val();
				$(".timeHeader").css("display","block"); 
				var spaceId = ${space.spaceId};
				console.log(bookDate); 	
				
				$.ajax({
					url:"timeList.sp",
					data:{bookDate:bookDate, spaceId:spaceId},
					type:"POST",
					async:false, 
					dataType:"json",
					success:function(timeList){
						console.log(timeList);
						var $body = $(".time_slot");
						var $bookB = $(".BookingDate");
						$body.html("");
						$bookB.text("");
						if(timeList.length>0){
							$.each(timeList, function(index, item) {
								$.each(item, function(key, value){
								   
								    var result="";
								    result+='<li data-num="'
								    	   +index
								    	   +'" id="timeSlotLi">'
								    	   +'<input type="checkbox" class="temp" id="'
								    	   +(index+1)
								    	   +'" value="'
								    	   +value
								    	   +'" name="timeClick">'
								    	   +'<label for="'
								    	   +(index+1)
								    	   +'" class="'
								    	   +key
								    	   +'">'
								    	   +key
								    	   +'시 <br>'
								    	   +value
								    	   +'</label></li>';
			                              
								    	   $body.append(result);
								});
							});
							$bookB.append(bookDate);
							
							
						}
					bookTime();
					}
				});
				
			});
		
			
			
			var tot = 0;
			var total =0;
			// 시간 선택 묶음 
			function check(){
				var length = ($(".time_slot li:last-child input")).attr("id");
				var total=parseInt($(".totalPrice3").text());
				tot = 0;
				for (var i = 1; i <= length; i++) {
					$("#"+i).prop("checked",false);
				}
				for(var i = min; i <= max; i++){
					$("#"+i).prop("checked",true);
					tot += parseInt($("#"+i).val());
					$(".totalPrice").html('&#8361;'); 
					$(".totalPrice2").text(tot);
					if($(".totalPrice3").text()==""){
						$(".finalTotal2").html('&#8361;').text(tot);
					}else{
					$(".finalTotal2").html('&#8361;').text((tot+total));
					}
					
				}
				
			};
			
			
			
			
			var min = 100;
			var max = -1;
		    var startTime ="";;
		    var startPrice =0;
		    var endTime="";
		    var priceArr=[];
		    
			$(document).on("click",".temp",function(){
				priceArr = [];
				
				if($(this).is(":checked")){
					
					var idval = parseInt(($(this).attr("id")));
					var label = $(this).parent().children("label").text().split(" ")[0];
					var price=$(this).parent().children("label").text().split(" ")[1];
					
					if(min > idval) {
						min = idval;
						startTime = label;
						startPrice = price;
						$(".start").text(startTime);
						$(".start4").text(startTime);
						if(max==-1) max=min;
					}
					else{
						max = idval;
						endTime=label;
						$(".bar").text("-");
						$(".end").text(endTime);
						$(".bar4").text("-");
						$(".end4").text(endTime);

						if(min==100) min=max;
					}
					
					
					
				}else{
					var idval2 = parseInt(($(this).attr("id")));
					var label2 = $(this).parent().children("label").text().split(" ")[0];
					var centerval = (min+max)/2;
					if(min==max){
						$(this).prop("checked",false);
						min = 100;
						max = -1;
					}
					else if(idval2==max){
						max = min;
					}
					else if(idval2 < centerval && idval2!=min){
						min = idval2;
						startTime=label2;
						$(".start").text(startTime);
						$(".start4").text(startTime);
					}
					else if(idval2 >= centerval && idval2!=max){
						max = idval2;
						endTime=label2;
						$(".bar").text("-");
						$(".end").text(endTime);
						$(".bar4").text("-");
						$(".end4").text(endTime);
						
					}
					else{
						min = max;
					}
				}
				check();
				
			});
		});
	    
	    
	    // 해당 일자의 예약 시간 disabled로 막기 
		 function bookTime(){
			var bookDate = $("#datepicker").val();
			var spaceId = ${space.spaceId};
			console.log("bookDate: "+bookDate);
			$.ajax({
				url: "timeListBook.sp",
				data:{bookDate:bookDate, spaceId:spaceId},
				type:"POST",
				async:false,
				success: function(bookTimeArrr){
					$.each(bookTimeArrr, function(i) {
						var Start = bookTimeArrr[i].bookStartTime;
						var End = bookTimeArrr[i].bookEndTime;
						$("."+Start).prev().attr('disabled', true);
						$("."+End).prev().attr('disabled', true);
						
						$("."+Start).parent().nextUntil($("."+End).parent()).children("input").attr('disabled', true);
					});
				},
				error: function(){
					console.log("에러에러");
				}
			});
			
		} 
		 
	    
	    // 인원 수 클릭 (마이너스 )
	    $("#min").click(function(){
	    	var min=${space.spaceMinPer};
	    	var n = $("#min").index(this);
	    	var num = $("#partyInput:eq("+n+")").val();
	    	var addPrice =  ${space.spaceAdd };
	    	var per=$('input[id="partyInput"]').val()-2;
	    	var total=0;
	    	var tot=parseInt($(".totalPrice2").text());
	    	
	    	if(num>min){
	    		num= $("#partyInput:eq("+n+")").val(num*1-1);
	    		//공간 사용료 값 바꾸기 
	    		total=(addPrice*per);
	    		
	    		$(".addPrice").html('추가 &#8361;');
	    		if((addPrice*per)==0){
	    			$(".totalPrice3").text("");
	    			$(".addPrice").html('');
	    			$(".finalTotal2").text("");
	    		}else{
	    			if($(".totalPrice2").text()==""){
		    			$(".finalTotal2").html('&#8361;').text(total);
		    			$(".totalPrice3").text((addPrice*per));
	    			}else{
	    				$(".finalTotal2").html('&#8361;').text(total+tot);
	    				$(".totalPrice3").text((addPrice*per));
	    				}
	    		}
		    
	    	}else{
		    		alert("최소 인원을 확인해주세요.");
		    	}
	    });
	    
	    // 인원 수 클릭 (플러스)
	    $("#plu").click(function(){
	    	var max = ${space.spaceMaxPer}
	    	var n = $("#plu").index(this);
	    	var num = $("#partyInput:eq("+n+")").val();
	    	var addPrice =${space.spaceAdd};
	    	var per=$('input[id="partyInput"]').val();
	    	var total=0;
	    	var tot=parseInt($(".totalPrice2").text());
	    	if(num<max){
	    	num= $("#partyInput:eq("+n+")").val(num*1+1);
	    	// 공간 사용료 값 바꾸기 
	    	total=(addPrice*per);
	    	$(".addPrice").html('추가금액&nbsp; &#8361;');
	    	$(".totalPrice3").text(total);
	    	if($(".totalPrice2").text()==""){
	    		$(".finalTotal2").html('&#8361;').text(total);
	    	}else{
	    		
	    		$(".finalTotal2").html('&#8361;').text(total+tot);
	    	}
	    	}else{
	    		alert("최대 인원을 초과하였습니다.");
	    	}
	    	
	    });
	    
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
	                   QnANextList();
	                   /* console.log("됐냐"); */
	                }
	             }
	          });
	       });
	       
	       QnANextList();
	       
	       
	       
	       // 페이지 이동 시 질문 리스트 출력 
	        
	       function QnANextList(p){
	          var spaceId = ${space.spaceId};
	          console.log("p: "+p);
	          
	          $.ajax({
	             url:"selectQnA.sp",
	             data: {spaceId:spaceId,page:p},
	             dataType:"JSON",
	             success: function(qList){
	                
	                var $QnA_QA=$(".QnA_QA");
	                var $QnAList=$(".QnAList");
	                var $QnAPaging =$(".QnAPaging");
	                
	                 $QnAList.html("");
	                 $QnAPaging.html("");
	                
	                if(qList.length>0){
	                   $.each(qList,function(i){
	                    console.log("${loginUser.memberId}");
	                       
	                       
	                      var result = "";
	                      
	                      result += '<div class= "QnA_QA">';
	                      if("${loginUser.memberId}" == qList[i].qMemberId){
	                         result += '<div class="QDelete"><button onclick="QADelete(' 
	                               +qList[i].qnaId
	                               +');">[삭제]</button></div>';
	                      }
	                     result += '<h6 style="display:none"> 답변 글 번호'+ qList[i].qnaId + '</h6>'
	                            +'<h4> 작성자 [ ' + qList[i].qMemberId +" ]</h4>"
	                            +'<h5> 내용 [ '+ qList[i].qContent +" ]</h5>"
	                            +'<h6> 작성일 [ ' + qList[i].qDate+ " ]</h6>";
	                            
	                           if(qList[i].aMemberId != null){
	                           result +='<h5 class="AName"> 호스트 이름 [ '+ qList[i].aMemberId + " ]</h5>"
	                               +'<h4 class="AName"> 답변 내용 [ '+ qList[i].aContent +" ]</h4>"
	                               +'<h6 class="AName"> 답변 날짜 [ '+ qList[i].aDate +" ]</h6>"
	                               +'</div>';
	                           } else{
	                              result += '<h3 class="AName">등록된 호스트의 답변이 없습니다 .</h3>'
	                           }
	                            
	                           $QnAList.append(result);
	       
	               }); /*each  끝*/
	               
	               
	               /* 페이징 처리 - 페이지 넘김 */
	               $.ajax({
	                  url:"qnaPaging.sp",
	                  data:{spaceId:"${space.spaceId}",page:p},
	                   dataType:"JSON",
	                      success: function(pInf){
	                         console.log("성공");
	                         console.log(pInf);
	                        

	                            var Paging="";

	                        Paging +=    '<nav class="pagination-container">'
	                              +    '<div class="pagination">'
	                        /* 이전 */
	                              + '<a class="pagination-newest" onclick="QnANextList(1)"><<</a>';
	                        if(pInf.currentPage <= 1) {
	                           Paging += '<a class="pagination-newer"><</a>';
	                        } else {
	                           Paging +='<a class="pagination-newer" onclick="QnANextList('
	                           +(pInf.currentPage-1)
	                           +')"><</a>';
	                        }
	                        Paging += '<span class="pagination-inner">';
	                        
	                        for(var p = pInf.startPage; p <= pInf.endPage; p++) {
	                           if(p == pInf.currentPage) {
	                           console.log("스타트"+pInf.startPage);
	                           console.log("ㅐ"+p);
	                              Paging += '<a class="pagination-active">'
	                                    +p
	                                    +'</a>';
	                           } else {
	                              Paging += '<a onclick="QnANextList('+p+')">'+p+'</a>';
	                           }
	                        }
	                        /* 다음 */
	                        if(pInf.currentPage >= pInf.maxPage) {
	                           Paging += '<a class="pagination-older">></a>';
	                        } else {
	                           Paging += '<a class="pagination-older" onclick="QnANextList('+(pInf.currentPage+1)+')">></a>';
	                        }
	                        Paging += '<a class="pagination-oldest" onclick="QnANextList('+pInf.endPage+')">>></a>';
	                              
	                           
	                       $QnAPaging.append(Paging);
	                         
	                         
	                         
	                      } /* 페이징 처리 success 끝 */
	               
	               });
	               
	            }/* success if */
	            
	         }/*success 끝  */
	         
	      }); /* ajax 끝 */
	      
	   } /* QnANextList()끝 */    
	       

	       
	       // 질문 리스트 처음 출력 
	       function QnAList(){
	          var spaceId = ${space.spaceId};
	          
	          $.ajax({
	             url:"selectQnA.sp",
	             data: {spaceId:spaceId},
	             dataType:"JSON",
	             success: function(qList){
	                
	                var $QnA_QA=$(".QnA_QA");
	                var $QnAList=$(".QnAList");
	                var $QnAPaging =$(".QnAPaging");
	                
	                 $QnAList.html("");
	                
	                if(qList.length>0){
	                   $.each(qList,function(i){
	                    console.log("${loginUser.memberId}");
	                       
	                       
	                      var result = "";
	                      
	                      result += '<div class= "QnA_QA">';
	                      if("${loginUser.memberId}" == qList[i].qMemberId){
	                         result += '<div class="QDelete"><button onclick="QADelete(' 
	                               +qList[i].qnaId
	                               +');">[삭제]</button></div>';
	                      }
	                     result += '<h6 style="display:none"> 답변 글 번호'+ qList[i].qnaId + '</h6>'
	                            +'<h4> 작성자 [ ' + qList[i].qMemberId +" ]</h4>"
	                            +'<h5> 내용 [ '+ qList[i].qContent +" ]</h5>"
	                            +'<h6> 작성일 [ ' + qList[i].qDate+ " ]</h6>";
	                            
	                           if(qList[i].aMemberId != null){
	                           result +='<h5 class="AName"> 호스트 이름 [ '+ qList[i].aMemberId + " ]</h5>"
	                               +'<h4 class="AName"> 답변 내용 [ '+ qList[i].aContent +" ]</h4>"
	                               +'<h6 class="AName"> 답변 날짜 [ '+ qList[i].aDate +" ]</h6>"
	                               +'</div>';
	                           } else{
	                              result += '<h3 class="AName">등록된 호스트의 답변이 없습니다 .</h3>'
	                           }
	                            
	                           $QnAList.append(result);
	       
	               }); /*each  끝*/
	               
	               
	               /* 페이징 처리 - 처음 조회 */
	               $.ajax({
	                  url:"qnaPaging.sp",
	                  data:{spaceId:"${space.spaceId}"},
	                   dataType:"JSON",
	                      success: function(pInf){
	                         console.log("성공");
	                         console.log(pInf);
	                        

	                         var Paging="";

	                           Paging +=    '<nav class="pagination-container">'
	                                 +    '<div class="pagination">'
	                           /* 이전 */
	                                 + '<a class="pagination-newest" onclick="QnANextList(1)"><<</a>';
	                           if(pInf.currentPage <= 1) {
	                              Paging += '<a class="pagination-newer"><</a>';
	                           } else {
	                              Paging +='<a class="pagination-newer" onclick="QnANextList('
	                              +(pInf.currentPage-1)
	                              +')"><</a>';
	                           }
	                           Paging += '<span class="pagination-inner">';
	                           
	                           for(var p = pInf.startPage; p <= pInf.endPage; p++) {
	                              if(p == pInf.currentPage) {
	                                 Paging += '<a class="pagination-active">'+p+'</a>';
	                              } else {
	                                 Paging += '<a onclick="QnANextList('+p+')">'+p+'</a>';
	                              }
	                           }
	                           /* 다음 */
	                           if(pInf.currentPage >= pInf.maxPage) {
	                              Paging += '<a class="pagination-older">></a>';
	                           } else {
	                              Paging += '<a class="pagination-older" onclick="QnANextList('+(pInf.currentPage+1)+')">></a>';
	                           }
	                           Paging += '<a class="pagination-oldest" onclick="QnANextList('+pInf.endPage+')">>></a>';
	                                 
	                              
	                          $QnAPaging.append(Paging);
	                            
	                            
	                            
	                         } /* 페이징 처리 success 끝 */
	               
	               });
	               
	            }/* success if */
	            
	         }/*success 끝  */
	         
	      }); /* ajax 끝 */
	      
	   } /* QnAList()끝 */             
	                
	                
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
	                QnANextList();
	             }
	          }
	       });
	    }

</script>
</body>
</html>