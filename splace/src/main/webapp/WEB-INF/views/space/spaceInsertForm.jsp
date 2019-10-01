<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>공간 등록</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section>
					<h1 class="align-center">공간 등록</h1>	
					<form method="post" action="spaceInsert.sp" enctype="multipart/form-data">
						<h2>1. 기본정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<p>관리자 승인 이후에는 공간이름, 공간유형, 주소 변경이 불가능합니다.</p>
							</div>
							<div class="col-12 col-12-xsmall">
								<label for="spaceName">* 공간이름 <span id="nameLength"></span></label>
								<input type="text" name="spaceName" id="spaceName" placeholder="공간이름" maxlength="100" required>
							</div>
							<div class="col-12 col-12-small"><label>* 공간유형</label></div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId1" name="typeId" value="1">
								<label for="typeId1">스터디룸</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId2" name="typeId" value="2">
								<label for="typeId2">파티룸</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId3" name="typeId" value="3">
								<label for="typeId3">스튜디오</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId4" name="typeId" value="4">
								<label for="typeId4">회의실</label>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="typeId5" name="typeId" value="5">
								<label for="typeId5">카페</label>
							</div>
							<div class="col-1 col-12-xsmall">
								<label>* 주소</label>
								<input type="button" id="addressBtn" class="button primary small" value="주소찾기">
							</div>
							<div class="col-11 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="text" name="spaceAddress" id="spaceAddress" placeholder="주소찾기 버튼을 클릭하세요" class="postcodify_address" value="" readonly>
							</div>
							<div class="col-1 col-12-xsmall"></div>
							<div class="col-7 col-12-xsmall">
								<input type="text" name="address" placeholder="상세주소" class="postcodify_extra_info" value="">
							</div>
							<div class="col-4 col-12-xsmall">
								<input type="text" name="post" placeholder="우편번호" class="postcodify_postcode5" value="" size="6" readonly>
							</div>
						</div>
						<br><br>
						<h2>2. 공간정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<label for="spaceComment">* 한줄소개 <span id="commentLength"></span></label>
								<input type="text" name="spaceComment" id="spaceComment" placeholder="한줄소개" maxlength="100" required>
							</div>
							<div class="col-12">
								<label for="spaceDetail">* 상세소개 <span id="detailLength"></span></label>
								<textarea name="spaceDetail" id="spaceDetail" placeholder="상세소개" rows="6" maxlength="10000" required></textarea>
							</div>
							
							<div class="col-10 col-12-xsmall">
								<label for="tag">태그 <span id="tagLength"></span></label>
								<input type="text" id="tag" placeholder="태그">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addTagBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall" id="tagList"></div>
							<!-- <input type="hidden" name="spaceTag" id="spaceTag" maxlength="150"> -->
							<input type="text" name="spaceTag" id="spaceTag" maxlength="150">
							
							<div class="col-12 col-12-xsmall">
								<label>세부옵션</label>
								<div class="row" id="optionField">
									<ul>
										<li>
											<input type="checkbox" id="option1" class="option" value="1">
											<label for="option1"><i class="material-icons">fastfood</i> 음식물반입가능</label>
										</li>
										<li>
											<input type="checkbox" id="option2" class="option" value="2">
											<label for="option2"><i class="material-icons">local_parking</i> 주차가능</label>
										</li>
										<li>
											<input type="checkbox" id="option3" class="option" value="3">
											<label for="option3"><i class="material-icons">mic</i> 음향/마이크</label>
										</li>
										<li>
											<input type="checkbox" id="option4" class="option" value="4">
											<label for="option4"><i class="material-icons">wifi</i> 인터넷/와이파이</label>
										</li>
										<li>
											<input type="checkbox" id="option5" class="option" value="5">
											<label for="option5"><i class="material-icons">pets</i> 반려동물동반가능</label>
										</li>
										<li>
											<input type="checkbox" id="option6" class="option" value="6">
											<label for="option6"><i class="material-icons">smoke_free</i> 금연</label>
										</li>
										<li>
											<input type="checkbox" id="option7" class="option" value="7">
											<label for="option7"><i class="material-icons">live_tv</i> TV/프로젝터</label>
										</li>
										<li>
											<input type="checkbox" id="option8" class="option" value="8">
											<label for="option8"><i class="material-icons">local_bar</i> 주류반입가능</label>
										</li>
										<li>
											<input type="checkbox" id="option9" class="option" value="9">
											<label for="option9"><i class="material-icons">local_printshop</i> 복사/인쇄기</label>
										</li>
										<li>
											<input type="checkbox" id="option10" class="option" value="10">
											<label for="option10"><i class='fas fa-restroom'></i> 화장실</label>
										</li>
										<li>
											<input type="checkbox" id="option11" class="option" value="11">
											<label for="option11"><i class='fas fa-chalkboard'></i> 화이트보드</label>
										</li>
										<li>
											<input type="checkbox" id="option12" class="option" value="12">
											<label for="option12"><i class='fab fa-hotjar'></i> 난방기</label>
										</li>
										<li>
											<input type="checkbox" id="option13" class="option" value="13">
											<label for="option13"><i class='fas fa-wind'></i> 에어컨</label>
										</li>
										<li>
											<input type="checkbox" id="option14" class="option" value="14">
											<label for="option14"><i class='fas fa-video'></i> CCTV</label>
										</li>
									</ul>
								</div>
							</div>
							
							<div class="col-12 col-12-xsmall">
								<input type="text" name="spaceOption" id="spaceOption" readonly>
							</div>
							
							<div class="col-10 col-12-xsmall">
								<label for="">주의사항 <span id="noticeLength"></span></label>
								<input type="text" id="notice" placeholder="주의사항">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addNoticeBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall" id="noticeList"></div>
							<!-- <input type="hidden" name="spaceNotice" id="spaceNotice" maxlength="1000"> -->
							<input type="text" name="spaceNotice" id="spaceNotice" maxlength="1000">
							
						</div>
						<br><br>
						
						<h2>3. 이용정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-4 col-12-xsmall">
								<label for="spaceOpenTime">* 운영시작시간(0 ~ 24)</label>
								<input type="number" name="spaceOpenTime" id="spaceOpenTime" min="0" max="24">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceCloseTime">* 이용종료시간(0 ~ 24)</label>
								<input type="number" name="spaceCloseTime" id="spaceCloseTime" min="1" max="24">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceTime">* 최소예약시간(시간)</label>
								<input type="number" name="spaceTime" id="spaceTime" min="1" max="24">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMinPer">* 최소예약인원(명)</label>
								<input type="number" name="spaceMinPer" id="spaceMinPer" min="1">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMaxPer">* 최대수용인원(명)</label>
								<input type="number" name="spaceMaxPer" id="spaceMaxPer" min="1">
							</div>
							<div class="col-4 col-12-xsmall">
							</div>
						</div>
						<br><br>
						
						<h2>4. 이미지</h2>
						<!-- <div class="box alt"> -->
							<div class="row gtr-uniform borderTop" id="imageArea">
								<div class="col-2 col-12-xsmall">
									<label for="mainFile" class="button primary small">메인 이미지 등록</label>
									<input type="file" name="uploadFile" id="mainFile" value="등록" onchange="loadImg(this,1);" required>
									<img id="mainImg" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile1" class="button small">이미지1 등록</label>
									<input type="file" name="files" id="subFile1" value="등록" multiple onchange="loadImg(this,1);">
									<img id="subImg1" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile2" class="button small">이미지2 등록</label>
									<input type="file" name="files" id="subFile2" value="등록" multiple onchange="loadImg(this,2);">
									<img id="subImg2" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile3" class="button small">이미지3 등록</label>
									<input type="file" name="files" id="subFile3" value="등록" multiple onchange="loadImg(this,3);">
									<img id="subImg3" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile4" class="button small">이미지4 등록</label>
									<input type="file" name="files" id="subFile4" value="등록" multiple onchange="loadImg(this,4);">
									<img id="subImg4" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile5" class="button small">이미지5 등록</label>
									<input type="file" name="files" id="subFile5" multiple onchange="loadImg(this,5);">
									<img id="subImg5" class="image fit">
								</div>
							</div>
						<!-- </div> -->
						<br><br>
						<div class="row">
							<div class="col-3"></div>
							<div class="col-3"><input type="submit" class="button primary fit" value="등록"></div>
							<div class="col-3"><input type="button" class="button fit" value="취소" onclick="location.href='spaceList.sp'"></div>
							<div class="col-3"></div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<!-- 주소 검색 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script src="${contextPath}/resources/js/spaceInfo.js"></script>
</body>
</html>