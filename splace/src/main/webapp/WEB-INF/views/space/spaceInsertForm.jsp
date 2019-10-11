<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<input type="hidden" name="hostId" value="${ sessionScope.hostId }">
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<label for="spaceName">* 공간이름 <span id="nameLength"></span></label>
								<input type="text" name="spaceName" id="spaceName" placeholder="공간이름" maxlength="100" required>
							</div>
							<div class="col-12 col-12-small"><label>* 공간유형</label></div>
							<div class="col-12 col-12-small">
								<div class="row gtr-uniform">
									<c:forEach var="tList" items="${ tList }">
									<div class="col-2 col-12-small">
										<input type="radio" id="typeId${ tList.typeId }" name="typeId" value="${ tList.typeId }">
										<label for="typeId${ tList.typeId }">${ tList.typeName }</label>
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-6 col-12-xsmall">
								<label for="hostPhone">* 전화번호</label>
								<input type="text" name="spacePhone" id="spacePhone" required>
							</div>
							<div class="col-6 col-12-xsmall">
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="regCheck1">
								<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
							</div>
							<div class="col-1 col-12-xsmall">
								<label>* 주소</label>
								<input type="button" id="addressBtn" class="button primary small" value="주소찾기">
							</div>
							<div class="col-11 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="text" name="spaceAddress" id="spaceAddress" placeholder="주소찾기 버튼을 클릭하세요." class="postcodify_address" value="" readonly>
							</div>
							<div class="col-1 col-12-xsmall"></div>
							<div class="col-7 col-12-xsmall">
								<input type="text" name="address" placeholder="상세주소" class="postcodify_extra_info" value="">
							</div>
							<div class="col-4 col-12-xsmall">
								<input type="text" name="post" placeholder="우편번호" class="postcodify_postcode5" value="" size="6" readonly>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">관리자 승인 이후에는 공간이름, 공간유형, 주소 변경이 불가능합니다. 정확한 정보인지 확인해주세요.</span>
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
							<div class="col-12 col-12-xsmall noticeDiv" id="tagList"></div>
							<input type="hidden" name="spaceTag" id="spaceTag" maxlength="150">
							<!-- <input type="text" name="spaceTag" id="spaceTag" maxlength="150"> -->
							<div class="col-12 col-12-xsmall">
								<label>세부옵션</label>
								<div class="row" id="optionField">
									<ul>
										<c:forEach var="oList" items="${ oList }">
										<li>
											<input type="checkbox" id="option${ oList.optionId }" class="option" value="${ oList.optionId }">
											<label for="option${ oList.optionId }">
												<c:if test="${ oList.optionId <= 'I' }"><i class="material-icons">${ oList.optionIcon }</i> ${ oList.optionName }</c:if>
												<c:if test="${ oList.optionId > 'I' }"><i class="${ oList.optionIcon }"></i> ${ oList.optionName }</c:if>
											</label>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<input type="hidden" name="spaceOption" id="spaceOption">
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">구비된 편의시설을 선택해주세요.</span>
							</div>
							<div class="col-10 col-12-xsmall">
								<label for="">주의사항 <span id="noticeLength"></span></label>
								<input type="text" id="notice" placeholder="주의사항">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addNoticeBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="noticeList"></div>
							<input type="hidden" name="spaceNotice" id="spaceNotice" maxlength="1000">
							<!-- <input type="text" name="spaceNotice" id="spaceNotice" maxlength="1000"> -->
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
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">실제로 공간 공유가 가능한 시간을 입력해주세요.</span>
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
									<label for="mainFile" class="button primary small">대표 이미지 등록</label>
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