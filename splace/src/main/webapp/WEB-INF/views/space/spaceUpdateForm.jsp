<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>공간 수정</title>
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
					<c:set var="spaceStatus" value="${ space.statusId }"/>
					<h1 class="align-center">공간 수정</h1>
					<c:if test="${ spaceStatus == 1 }">
					<div class="col-12 align-center"><h2 class="noticeColor">공간 신청 검토 중입니다.</h2></div>
					</c:if>
					<c:if test="${ spaceStatus == 3 }">
					<div class="col-12 align-center"><h2 class="noticeColor">공간 신청이 반려되었습니다. 수정 후 재신청하세요.</h2></div>
					</c:if>
					<form method="post" action="spaceUpdate.sp" enctype="multipart/form-data">
						<h2>1. 기본정보</h2>
						<input type="hidden" name="spaceId" id="spaceId" value="${ space.spaceId }">
						<input type="hidden" name="statusId" id="statusId" value="${ spaceStatus }">
						<div class="row gtr-uniform borderTop">
							<c:if test="${ spaceStatus == 0 || spaceStatus == 3 }">
							<div class="col-12 col-12-xsmall">
								<label for="spaceName">* 공간이름 <span id="nameLength"></span></label>
								<input type="text" name="spaceName" id="spaceName" placeholder="공간이름" maxlength="100" required value="${ space.spaceName }">
							</div>
							<div class="col-12 col-12-small"><label>* 공간유형</label></div>
							<div class="col-12 col-12-small">
								<div class="row gtr-uniform">
									<c:forEach var="tList" items="${ tList }">
									<div class="col-2 col-12-small">
										<c:if test="${ space.typeId eq tList.typeId }">
										<input type="radio" id="typeId${ tList.typeId }" name="typeId" value="${ tList.typeId }" checked>
										</c:if>
										<c:if test="${ space.typeId ne tList.typeId }">
										<input type="radio" id="typeId${ tList.typeId }" name="typeId" value="${ tList.typeId }">
										</c:if>
										<label for="typeId${ tList.typeId }">${ tList.typeName }</label>
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-6 col-12-xsmall">
								<label for="hostPhone">* 전화번호</label>
								<input type="text" name="spacePhone" id="spacePhone" value="${ space.spacePhone }" required>
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
								<input type="text" name="spaceAddress" id="spaceAddress" placeholder="주소찾기 버튼을 클릭하세요." class="postcodify_address" value="${ space.spaceAddress }" readonly>
							</div>
							<div class="col-1 col-12-xsmall"></div>
							<div class="col-7 col-12-xsmall">
								<input type="text" name="address" placeholder="상세주소" class="postcodify_extra_info" value="${ address }">
							</div>
							<div class="col-4 col-12-xsmall">
								<input type="text" name="post" placeholder="우편번호" class="postcodify_postcode5" value="${ post }" size="6" readonly>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">관리자 승인 이후에는 공간이름, 공간유형, 주소 변경이 불가능합니다. 정확한 정보인지 확인해주세요.</span>
							</div>
							</c:if>
							<c:if test="${ spaceStatus == 1 || spaceStatus == 2 }">
								<div class="col-2 col-12-xsmall">
									<label>* 공간유형</label><span>${ space.typeName }</span>
								</div>
								<div class="col-10 col-12-small">
									<label>* 공간이름</label><span>${ space.spaceName }</span>
								</div>
								<div class="col-12 col-12-xsmall">
									<label>* 주소</label><span>${ post } ${ space.spaceAddress } ${ address }</span>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="hostPhone">* 전화번호</label>
									<input type="text" name="spacePhone" id="spacePhone" value="${ space.spacePhone }" required>
								</div>
								<div class="col-6 col-12-xsmall">
								</div>
								<div class="col-12 col-12-xsmall noticeDiv" id="regCheck1">
									<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
								</div>
							</c:if>
						</div>
						<br><br>
						<h2>2. 공간정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<label for="spaceComment">* 한줄소개 <span id="commentLength"></span></label>
								<input type="text" name="spaceComment" id="spaceComment" placeholder="한줄소개" maxlength="100" value="${ space.spaceComment }" required>
							</div>
							<div class="col-12">
								<label for="spaceDetail">* 상세소개 <span id="detailLength"></span></label>
								<c:set var="spaceDetail" value="${fn:replace(space.spaceDetail,'<br>','') }"/>
								<textarea name="spaceDetail" id="spaceDetail" placeholder="상세소개" rows="6" maxlength="10000" required>${ spaceDetail }</textarea>
							</div>
							<div class="col-10 col-12-xsmall">
								<label for="tag">* 태그 <span id="tagLength"></span></label>
								<input type="text" id="tag" placeholder="태그">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addTagBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="tagList"></div>
							<input type="hidden" name="spaceTag" id="spaceTag" maxlength="150" value="${ space.spaceTag }">
							<div class="col-12 col-12-xsmall">
								<label>* 세부옵션</label>
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
							<input type="hidden" name="spaceOption" id="spaceOption" value="${ space.spaceOption }">
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">구비된 편의시설을 선택해주세요.</span>
							</div>
							<div class="col-10 col-12-xsmall">
								<label for="">* 주의사항 <span id="noticeLength"></span></label>
								<input type="text" id="notice" placeholder="주의사항">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addNoticeBtn" value="추가">
							</div>
							<div class="col-10 col-12-xsmall noticeDiv" id="noticeList"></div>
							<div class="col-2 col-12-xsmall"></div>
							<input type="hidden" name="spaceNotice" id="spaceNotice" maxlength="1000" value="${ space.spaceNotice }">
						</div>
						<br><br>
						
						<h2>3. 이용정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-4 col-12-xsmall">
								<label for="spaceOpenTime">* 운영시작시간(0 ~ 24)</label>
								<input type="number" name="spaceOpenTime" id="spaceOpenTime" min="0" max="24" value="${ space.spaceOpenTime }">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceCloseTime">* 이용종료시간(0 ~ 24)</label>
								<input type="number" name="spaceCloseTime" id="spaceCloseTime" min="1" max="24" value="${ space.spaceCloseTime }">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceTime">* 최소예약시간(시간)</label>
								<input type="number" name="spaceTime" id="spaceTime" min="1" max="24" value="${ space.spaceTime }">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMinPer">* 최소예약인원(명)</label>
								<input type="number" name="spaceMinPer" id="spaceMinPer" min="1" value="${ space.spaceMinPer }">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMaxPer">* 최대수용인원(명)</label>
								<input type="number" name="spaceMaxPer" id="spaceMaxPer" min="1" value="${ space.spaceMaxPer }">
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
									<input type="file" name="uploadFile" id="mainFile" value="등록" onchange="loadImg(this,1);">
									<img id="mainImg" class="image fit" src="${ contextPath }/resources/spaceImg/${ space.spaceAttChange }" accept="image/gif,image/jpeg,image/png">
									<input type="hidden" name="spaceAttChange" value="${ space.spaceAttChange }">
									<span>${ space.spaceAttOrigin }</span>
								</div>
								<c:forEach var="attList" items="${ attList }" varStatus="vs">
								<div class="col-2">
									<label for="subFile${ vs.index + 1 }" class="button small">이미지${ vs.index + 1 } 등록</label>
									<input type="file" name="files" id="subFile${ vs.index + 1 }" value="등록" multiple onchange="loadImg(this,${ vs.index + 1 });" accept="image/gif,image/jpeg,image/png">
									<img id="subImg${ vs.index + 1 }" class="image fit" src="${ contextPath }/resources/spaceImg/${ attList.spaceAttChange }">
									<input type="hidden" name="spaceAttChanges" id="attName${ vs.index + 1 }" value="${ attList.spaceAttChange }">
									<i class="material-icons imgClear warningColor">cancel</i>
									<span>${ attList.spaceAttOrigin }</span>
								</div>
								</c:forEach>
								<c:set var="length" value="${ fn:length(attList) }"/>
								<input type="hidden" name="filesIndex" value="${ length }">
								<c:if test="${ length < 5 }">
								<c:forEach var="i" begin="${ length + 1 }" end="5">
								<div class="col-2">
									<label for="subFile${ i }" class="button small">이미지${ i } 등록</label>
									<input type="file" name="files" id="subFile${ i }" value="등록" multiple onchange="loadImg(this,${ i });" accept="image/gif,image/jpeg,image/png">
									<img id="subImg${ i }" class="image fit">
									<input type="hidden" name="spaceAttChanges" value="">
								</div>
								</c:forEach>
								</c:if>
							</div>
						<!-- </div> -->
						<br><br>
						<div class="row">
							<div class="col-3"></div>
							<div class="col-3">
								<c:if test="${ spaceStatus == 1 }">
								<input type="submit" class="button primary fit" value="수정" disabled>
								</c:if>
								<c:if test="${ spaceStatus != 1 }">
								<input type="submit" id="submitBtn" class="button primary fit" value="수정">
								</c:if>
							</div>
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