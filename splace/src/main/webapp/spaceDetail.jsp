<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
	<script type = "text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="${contextPath }/resources/css/spaceDetail.css" type="text/css">
	<script src="${contextPath }/resources/js/spaceDetail.js"></script>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'>   
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
							<div class="spaceTime fontStyle"> 
								<h2>영업 시간</h2>
								<p></p>
								<h4>[ 10시 ~ 22시 ]</h4>
								
							</div>
							<div class="spaceClose fontStyle">
								<h2>휴무일</h2>
								<p></p>
								<h4>[ 공휴일, 매주 일요일 ]</h4>
							</div>
							<div class="spaceClose fontStyle">
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
							<img class = "mapImg" src="${contextPath }/resources/img/map.png"alt="...">
						</div>
						
						
						<!------- QnA ------->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>Q & A </h2>
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
						                    <h5 class="modal-title" id="exampleModalCenterTitle">Q&A 작성</h5>
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
						                        <button type="reset" class="button primary cancel" data-dismiss="modal">취소</button>
						                        <button type="button" class="button">등록</button>
						                    </div>
						                </form>
						            </div>
						        </div>
						    </div><!--Modal끝  -->
					
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
						</div><!-- QnA끝 -->
						
						<!-------리뷰 -------->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>이용 후기</h2>
								<p></p>
							</div>
							<!-- 글쓰기 버튼 -->
							<div class="writeBtn">
								<button type="button" class="fa fa-edit" data-toggle="modal" data-target="#exampleModalCenter2" data-backdrop="static"></button>
							</div>
							<!-- Modal -->
           					<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						        <div class="modal-dialog modal-dialog-centered" role="document">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <h5 class="modal-title" id="exampleModalCenterTitle">이용 후기 작성</h5>
						                </div>
						                
						                <form action="">
						                    <div class="modal-body">
						                    	<div class = "starArea">
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
						                        <input multiple="multiple" class ="fileMult" type="file" name="filename[]" />
						                    </div>
						                    
						                    <div class="modal-footer">
						                        <button type="reset" class="button primary cancel" data-dismiss="modal">취소</button>
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
						</div><!-- review끝 -->
						
						<!-- 호스트의 다른 공간 -->
						<div class="spaceIntro">
							<div class="write fontStyle">
								<h2>호스트의 다른 공간</h2>
								<p></p>
							</div>
						</div>
						
					</div><!-- detailLeft 끝-->
					
					
					
					
					
					
					<!-- 오른쪽 부분 : 공간 예약관련  -->
					<div class="detailRight">
						<div class="reservation">
							<h2>예약하기</h2>
						</div>
					</div><!-- detailRight끝 -->
					
				</section>
			</div><!-- inner 끝 -->
		</div><!-- main끝 -->
		<jsp:include page="WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>