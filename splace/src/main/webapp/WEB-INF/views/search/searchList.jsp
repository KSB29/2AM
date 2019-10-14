<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="${contextPath}/resources/css/searchList.css" type="text/css">
<title>SPLACE</title>
</head>
<body>
   <!-- 이 형식을 꼭 지켜주세요! 
      top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
      main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
   -->
   <div id="wrapper">
   
      <jsp:include page="../common/top.jsp"/>
      <div id="main">
         <div class="inner">
            <!-- 여기에만 씁시다.(다른 부분은 고정!)
               section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
            -->
            <section>
               <div class="row">
                  <p> "${search.searchBox}" 입니다</p>
               </div> 
            </section>
            
            <section> 
               <div class="row">
                  <span>상세검색</span> 
               </div>
            </section>
            <!-- 상세 검색 리스트 구역 -->
           <c:url var="searchDetail" value="detailSpace.sp"/>
            <form action="${searchDetail }" method="get">
            <input type="hidden" value="${search.searchBox}" name="searchBox">
	       	 <section class="optionSection">
	          <div class="row" id="optionRow">
		               <button type="button" class="searchOption buttonToggle lBtn" id="searchOption" onclick="locationOpen();">지역</button>
		               <button type="button" class="searchOption buttonToggle" id="searchOption" onclick="typeOpen();">유형</button>
		               <button type="button" class="searchOption buttonToggle" id="searchOption" onclick="optionOpen();">옵션</button>
		               <button id="searchOption" class="button primary searchBtn ">search</button>
	               </div>
	            </section>
	            
	          
	            <!-- 지역 창 구역 -->
					<section>
						<div class="row" id="locationField"
							style="border: 1px solid black;  display: none;">
							<ul>
								<li><input type="radio" id="location1" class="locationSelect"  name ="locationSelect" value="강남구"> <label
									for="location1"> 강남구 </label></li>
								<li><input type="radio" id="location2" class="locationSelect"  name ="locationSelect" value="강동구"> <label
									for="location2"> 강동구 </label></li>
								<li><input type="radio" id="location3" class="locationSelect"  name ="locationSelect" value="강북구"> <label
									for="location3"> 강북구 </label></li>
								<li><input type="radio" id="location4" class="locationSelect"  name ="locationSelect" value="강서구"> <label
									for="location4"> 강서구 </label></li>
								<li><input type="radio" id="location5" class="locationSelect"  name ="locationSelect" value="구로구"> <label
									for="location5"> 구로구 </label></li>
								<li><input type="radio" id="location6" class="locationSelect"  name ="locationSelect" value="금천구"> <label
									for="location6"> 금천구 </label></li>
								<li><input type="radio" id="location7" class="locationSelect"  name ="locationSelect" value="광진구"> <label
									for="location7"> 광진구 </label></li>
								<li><input type="radio" id="location8" class="locationSelect"  name ="locationSelect" value="관악구"> <label
									for="location8"> 관악구 </label></li>
								<li><input type="radio" id="location9" class="locationSelect"  name ="locationSelect" value="노원구"> <label
									for="location9"> 노원구 </label></li>
								<li><input type="radio" id="location10" class="locationSelect"  name ="locationSelect" value="도봉구"> <label
									for="location10"> 도봉구 </label></li>
								<li><input type="radio" id="location11" class="locationSelect" name ="locationSelect" value="동대문구"> <label
									for="location11"> 동대문구 </label></li>
								<li><input type="radio" id="location12" class="locationSelect" name ="locationSelect" value="동작구"> <label
									for="location12"> 동작구 </label></li>
								<li><input type="radio" id="location13" class="locationSelect" name ="locationSelect" value="마포구"> <label
									for="location13"> 마포구 </label></li>
								<li><input type="radio" id="location14" class="locationSelect"  name ="locationSelect"value="서대문구"> <label
									for="location14"> 서대문구 </label></li>
								<li><input type="radio" id="location15" class="locationSelect"  name ="locationSelect"value="서초구"> <label
									for="location15"> 서초구 </label></li>
								<li><input type="radio" id="location16" class="locationSelect" name ="locationSelect" value="성북구"> <label
									for="location16"> 성북구 </label></li>
								<li><input type="radio" id="location17" class="locationSelect" name ="locationSelect" value="송파구"> <label
									for="location17"> 송파구 </label></li>
								<li><input type="radio" id="location18" class="locationSelect" name ="locationSelect" value="양천구"> <label
									for="location18"> 양천구 </label></li>
								<li><input type="radio" id="location19" class="locationSelect" name ="locationSelect" value="영등포구"> <label
									for="location19"> 영등포구 </label></li>
								<li><input type="radio" id="location20" class="locationSelect" name ="locationSelect" value="용산구"> <label
									for="location20"> 용산구 </label></li>
								<li><input type="radio" id="location21" class="locationSelect" name ="locationSelect" value="은평구"> <label
									for="location21"> 은평구 </label></li>
								<li><input type="radio" id="location22" class="locationSelect" name ="locationSelect" value="종로구"> <label
									for="location22"> 종로구 </label></li>
								<li><input type="radio" id="location23" class="locationSelect" name ="locationSelect" value="중구"> <label
									for="location23"> 중구 </label></li>
								<li><input type="radio" id="location24" class="locationSelect" name ="locationSelect" value="중랑구"> <label
									for="location24"> 중랑구 </label></li>
								<li><input type="radio" id="location25" class="locationSelect" name ="locationSelect" value="송파구"> <label
									for="location25"> 송파구 </label></li>
							</ul>
						</div>
					</section>
					<!-- 유형 창 구역 -->
					 <section>
	               <div class="row" id="typeField" style="border:1px solid black; display: none;">
	                  <ul>
	                     <li>
	                        <input type="checkbox" id="type1" class="typeSelect"  name="typeSelect" value="0">
	                        <label for="type1">
	                   		    <i class="fas fa-coffee"></i>
	              		         카페
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="type2"  class="typeSelect" value="1">
	                        <label for="type2">
	                         <i class="material-icons">
								cake
							</i>
	                  		         파티룸
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="type3" class="typeSelect" name="typeSelect" value="2">
	                        <label for="type3">
	                           <i class="material-icons">
								business
								</i>
	               	  	                  회의실
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="type4" class="typeSelect"  name="typeSelect" value="3">
	                        <label for="type4">
	                          <i class="material-icons">
								menu_book
								</i>
	                	   	        스터디룸
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="type5" class="typeSelect" name="typeSelect" value="4">
	                        <label for="type5">
	                        <i class="fas fa-camera"></i>
	                          	스튜디오
	                        </label>
	                     </li>
	               </ul>
	            </div>
	            </section>
	            
					<!-- 옵션 창 구역  -->
	            <section>
	               <div class="row" id="optionField" style="border:1px solid black; display: none;">
	                  <ul>
	                     <li>
	                        <input type="checkbox" id="option1" class="optionSelect"  name ="optionSelect" value="A">
	                        <label for="option1">
	                           <i class="material-icons">fastfood</i>
	              		             음식물반입가능
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option2" class="optionSelect" name ="optionSelect" value="B">
	                        <label for="option2">
	                           <i class="material-icons">local_parking</i>
	                  		         주차가능
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option3" class="optionSelect" name ="optionSelect" value="C">
	                        <label for="option3">
	                           <i class="material-icons">mic</i>
	               	  	          음향/마이크
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option4" class="optionSelect" name ="optionSelect" value="D">
	                        <label for="option4">
	                           <i class="material-icons">wifi</i>
	                	   	        인터넷/와이파이
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option5" class="optionSelect" name ="optionSelect" value="E">
	                        <label for="option5">
	                        <i class="material-icons">pets</i>
	                          	 반려동물동반가능
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option6" class="optionSelect" name ="optionSelect" value="F">
	                        <label for="option6">
	                           <i class="material-icons">smoke_free</i>
	                        	   금연
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option7" class="optionSelect" name ="optionSelect" value="G">
	                        <label for="option7">
	                           <i class="material-icons">live_tv</i>
	                     	      TV/프로젝터
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option8" class="optionSelect" name ="optionSelect" value="H">
	                        <label for="option8">
	                           <i class="material-icons">local_bar</i>
	                   		        주류반입가능
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option9" class="optionSelect" name ="optionSelect" value="I">
	                        <label for="option9">
	                           <i class="material-icons">local_printshop</i>
	                      	        복사/인쇄기
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option10" class="optionSelect" name ="optionSelect" value="J">
	                        <label for="option10">
	                           <i class='fas fa-restroom'></i>
	                                                             화장실
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option11" class="optionSelect" name ="optionSelect" value="K">
	                        <label for="option11">
	                           <i class='fas fa-chalkboard'></i>
	                                                                 화이트보드
	                        </label>
	                     </li>
	                   <li>
	                        <input type="checkbox" id="option12" class="optionSelect" name ="optionSelect" value="L">
	                        <label for="option12">
	                           <i class='fab fa-hotjar'></i>
	                          	    난방기
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option13" class="optionSelect" name ="optionSelect" value="M">
	                        <label for="option13">
	                           <i class='fas fa-wind'></i>
	                           	   에어컨
	                        </label>
	                     </li>
	                        <li>
	                        <input type="checkbox" id="option14" class="optionSelect" name ="optionSelect" value="N">
	                        <label for="option14">
	                           <i class='fas fa-video'></i>
	                           CCTV
	                        </label>
	                     </li>
	               </ul>
	            </div>
	           </section>
           </form>
            
		<!-- 검색 결과 공간 리스트  -->
           <c:if test="${ !empty searchList}"> 
	           <section class="tiles">
		       	<div class="row">
		           	<c:forEach var="s" items="${searchList}">
		           		<c:url var="sDetail" value="detailSpace.sp">
		           			<c:param name="spaceId" value="${s.spaceId}"></c:param>
		           		</c:url>
						<article>
								
								<!-- 공간 이미지 -->
									<span class="image"> 
										<img src="${contextPath }/resources/img/conference.jpg" alt=""/>
										<%-- <img src="${contextPath }/resources/spaceImg/${s.spaceAttChange}" alt="" /> --%>
									</span> 
										<a href="${sDetail }"></a> 
											
										<!-- 공간 이름 -->
											<div class="locationName">
												<h3>${s.spaceName }</h3>
											</div>
											
										<!-- 주소 -->
										<div class="location">
											<span> <img src="resources/img/location.svg">
												<c:forTokens var="addr" items="${s.spaceAddress}" delims="," varStatus="status">
													<c:if test="${status.index eq 1}">
														${addr}
													</c:if>
												</c:forTokens>
												
												</span>
											</div>
										<!-- 태그  -->
										<div class="tags">
											<span>${s.spaceTag }</span>
										</div>
										
										<!-- 가격 -->
											<div class="price">
												<strong>10,000</strong> <span>원/시간</span>
											</div>
											
										<!-- 리뷰 -->	
									<!-- 	 <div class="reviewHeart">
											<span> 
												<img src="resources/img/comment.svg"> 
												<span>10</span>&nbsp;&nbsp;&nbsp;
											</span>
											
											찜 
											<span> 
												<img src="resources/img/heart.svg"> 
											<span>10</span>
										</span>
									</div> -->
								</article>
							</c:forEach>
	             	  </div>
	            </section>
            </c:if>
            
            <!-- 검색 결과 없을 경우 -->
            <c:if test="${ empty searchList}">
	            <section>
			       	<div>
			     		<h2 style="text-align: center">검색 결과가 없습니다</h2>  	
			       	</div>
			     </section>
            </c:if>
      
</div>      
</div>
   <jsp:include page="../common/bottom.jsp" />
   </div>
   
   <!-- Scripts -->
   
   <script>
				/* 옵션창 오픈클로즈 */
				function optionOpen() {
					var x = document.getElementById("optionField");
					var y = document.getElementById("locationField");
					var z = document.getElementById("typeField");
					if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}
					y.style.display = "none";
					z.style.display = "none";

				}
				/* 지역창 오픈 클로즈 */
				function locationOpen() {
					var x = document.getElementById("optionField");
					var y = document.getElementById("locationField");
					var z = document.getElementById("typeField");
					if (y.style.display === "none") {
						y.style.display = "block";
					} else {
						y.style.display = "none";
					}
					x.style.display = "none";
					z.style.display = "none";
				}
				/* 유형창 오픈클로즈 */
				function typeOpen() {
					var x = document.getElementById("optionField");
					var y = document.getElementById("locationField");
					var z = document.getElementById("typeField");
					if (z.style.display === "none") {
						z.style.display = "block";
					} else {
						z.style.display = "none";
					}
					x.style.display = "none";
					y.style.display = "none";
				}
				
				// 지역 옵션 선택 시 값 바꾸기 
				$(".locationSelect").change(function(){
					$(".lBtn").text($('input:radio[name="locationSelect"]:checked').val());
				});

			</script>
</body>
</html>