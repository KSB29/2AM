<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
               <div class="row" id="optionRow">
                 <button class="searchOption buttonToggle" id="searchOption" onclick="locationOpen();">지역</button>
                 <button class="searchOption buttonToggle" id="searchOption" onclick="typeOpen();">유형</button>
                 <button class="searchOption buttonToggle" id="searchOption" onclick="optionOpen();">옵션</button>
                 <button id="searchOption" class="button primary ">search</button>
               </div>
            </section>
            
            <!-- 지역 창 구역 -->
				<section>
					<div class="row" id="locationField"
						style="border: 1px solid black;  display: none;">
						<ul>
							<li><input type="checkbox" id="location1" value="1"> <label
								for="location1"> 강남구 </label></li>
							<li><input type="checkbox" id="location2" value="2"> <label
								for="location2"> 강동구 </label></li>
							<li><input type="checkbox" id="location3" value="3"> <label
								for="location3"> 강북구 </label></li>
							<li><input type="checkbox" id="location4" value="4"> <label
								for="location4"> 강서구 </label></li>
							<li><input type="checkbox" id="location5" value="5"> <label
								for="location5"> 구로구 </label></li>
							<li><input type="checkbox" id="location6" value="6"> <label
								for="location6"> 금천구 </label></li>
							<li><input type="checkbox" id="location7" value="7"> <label
								for="location7"> 광진구 </label></li>
							<li><input type="checkbox" id="location8" value="8"> <label
								for="location8"> 관악구 </label></li>
							<li><input type="checkbox" id="location9" value="9"> <label
								for="location9"> 노원구 </label></li>
							<li><input type="checkbox" id="location10" value="10"> <label
								for="location10"> 도봉구 </label></li>
							<li><input type="checkbox" id="location11" value="11"> <label
								for="location11"> 동대문구 </label></li>
							<li><input type="checkbox" id="location12" value="12"> <label
								for="location12"> 동작구 </label></li>
							<li><input type="checkbox" id="location13" value="13"> <label
								for="location13"> 마포구 </label></li>
							<li><input type="checkbox" id="location14" value="14"> <label
								for="location14"> 서대문구 </label></li>
							<li><input type="checkbox" id="location15" value="15"> <label
								for="location15"> 서초구 </label></li>
							<li><input type="checkbox" id="location16" value="16"> <label
								for="location16"> 성북구 </label></li>
							<li><input type="checkbox" id="location17" value="17"> <label
								for="location17"> 송파구 </label></li>
							<li><input type="checkbox" id="location18" value="18"> <label
								for="location18"> 양천구 </label></li>
							<li><input type="checkbox" id="location19" value="19"> <label
								for="location19"> 영등포구 </label></li>
							<li><input type="checkbox" id="location20" value="20"> <label
								for="location20"> 용산구 </label></li>
							<li><input type="checkbox" id="location21" value="21"> <label
								for="location21"> 은평구 </label></li>
							<li><input type="checkbox" id="location22" value="22"> <label
								for="location22"> 종로구 </label></li>
							<li><input type="checkbox" id="location23" value="23"> <label
								for="location23"> 중구 </label></li>
							<li><input type="checkbox" id="location24" value="24"> <label
								for="location24"> 중랑구 </label></li>
							<li><input type="checkbox" id="location25" value="25"> <label
								for="location25"> 송파구 </label></li>
						</ul>
					</div>
				</section>
				
				<!-- 유형 창 구역 -->
				 <section>
               <div class="row" id="typeField" style="border:1px solid black; display: none;">
                  <ul>
                     <li>
                        <input type="checkbox" id="type1" value="cafe">
                        <label for="type1">
                   		    <i class="fas fa-coffee"></i>
              		         카페
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="type2" value="partyRoom">
                        <label for="type2">
                         <i class="material-icons">
							cake
						</i>
                  		         파티룸
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="type3" value="meetingRoom">
                        <label for="type3">
                           <i class="material-icons">
							business
							</i>
               	  	                  회의실
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="type4" value="studyRoom">
                        <label for="type4">
                          <i class="material-icons">
							menu_book
							</i>
                	   	        스터디룸
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="type5" value="studio">
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
                        <input type="checkbox" id="option1" value="food">
                        <label for="option1">
                           <i class="material-icons">fastfood</i>
              		             음식물반입가능
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option2" value="parking">
                        <label for="option2">
                           <i class="material-icons">local_parking</i>
                  		         주차가능
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option3" value="mic">
                        <label for="option3">
                           <i class="material-icons">mic</i>
               	  	          음향/마이크
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option4" value="wifi">
                        <label for="option4">
                           <i class="material-icons">wifi</i>
                	   	        인터넷/와이파이
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option5" value="pet">
                        <label for="option5">
                        <i class="material-icons">pets</i>
                          	 반려동물동반가능
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option6" value="nonsmoke">
                        <label for="option6">
                           <i class="material-icons">smoke_free</i>
                        	   금연
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option7" value="tv">
                        <label for="option7">
                           <i class="material-icons">live_tv</i>
                     	      TV/프로젝터
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option8" value="drink">
                        <label for="option8">
                           <i class="material-icons">local_bar</i>
                   		        주류반입가능
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option9" value="copy">
                        <label for="option9">
                           <i class="material-icons">local_printshop</i>
                      	        복사/인쇄기
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option10" value="toilet">
                        <label for="option10">
                           <i class='fas fa-restroom'></i>
                                                             화장실
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option11" value="board">
                        <label for="option11">
                           <i class='fas fa-chalkboard'></i>
                                                                 화이트보드
                        </label>
                     </li>
                   <li>
                        <input type="checkbox" id="option12" value="heater">
                        <label for="option12">
                           <i class='fab fa-hotjar'></i>
                          	    난방기
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option13" value="air">
                        <label for="option13">
                           <i class='fas fa-wind'></i>
                           	   에어컨
                        </label>
                     </li>
                        <li>
                        <input type="checkbox" id="option14" value="cctv">
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
                           <span> <img src="resources/img/location.svg"> 서울시 중구
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
   </script>
</body>
</html>