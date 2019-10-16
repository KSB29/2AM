<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<title>호스트 정보</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section id="hostSection">
					<c:set var="hostId" value="${ host.hostId }"/>
					<c:set var="hostStatus" value="${ host.statusId }"/>
					<c:set var="grade" value="${ loginUser.grade }"/>
					<h1 class="align-center">호스트 정보</h1>
					<c:if test="${ hostStatus == 0 }">
						<div class="col-12 align-center"><h2 class="noticeColor">정보가 등록되었습니다. 호스트 승인 신청하세요.</h2></div>
					</c:if>
					<c:if test="${ hostStatus == 1 }">
						<div class="col-12 align-center"><h2 class="noticeColor">호스트 신청 검토 중입니다.</h2></div>
					</c:if>
					<c:if test="${ hostStatus == 3 }">
						<div class="col-12 align-center"><h2 class="noticeColor">호스트 신청이 반려되었습니다. 수정 후 재신청하세요.</h2></div>
					</c:if>
					<c:choose>
						<c:when test="${ hostId == null }">
							<c:url var="hostUrl" value="hjoinInsert.sp"/>
						</c:when>
						<c:otherwise>
							<c:if test="${ grade == '1' }">
							<c:url var="hostUrl" value="hjoinUpdate.sp"/>
							</c:if>
							<c:if test="${ grade == '2' }">
							<c:url var="hostUrl" value="hostUpdate.sp"/>
							</c:if>
						</c:otherwise>
					</c:choose>
				<!-- Form -->
					<form method="post" action="${ hostUrl }">
						<c:if test="${ !empty host }">
							<input type="hidden" name="hostId" id="hostId" value="${ hostId }">
							<input type="hidden" name="statusId" id="statusId" value="${ hostStatus }">
						</c:if>
						<input type="hidden" name="memberId" value="${ loginUser.memberId }">
						<h2>1. 기본정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-3 col-12-xsmall">
								<label for="hostNo">* 사업자등록번호</label>
								<c:if test="${ hostStatus != 2 }">
								<input type="text" name="hostNo" id="hostNo" value="${ host.hostNo }" maxlength="12" placeholder="사업자등록번호" required autocomplete="off">
								</c:if>
								<c:if test="${ hostStatus == 2 }">
								<span>${ host.hostNo }</span>
								</c:if>
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="hostName">* 대표자명</label>
								<c:if test="${ hostStatus != 2 }">
								<input type="text" name="hostName" id="hostName" value="${ host.hostName }" placeholder="대표자명" required autocomplete="off">
								</c:if>
								<c:if test="${ hostStatus == 2 }">
								<span>${ host.hostName }</span>
								</c:if>
							</div>
							<div class="col-5 col-12-xsmall">
								<label for="storeName">* 상호명(개인/법인)</label>
								<c:if test="${ hostStatus != 2 }">
								<input type="text" name="storeName" id="storeName" value="${ host.storeName }" placeholder="상호명(개인/법인)" required autocomplete="off">
								</c:if>
								<c:if test="${ hostStatus == 2 }">
								<span>${ host.storeName }</span>
								</c:if>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="regCheck1">
								<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
							</div>
							<c:if test="${ hostStatus != 2 }">
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">관리자 승인 이후에는 사업자등록번호, 대표자명, 상호명 변경이 불가능합니다. 정확한 정보인지 확인해주세요.</span>
							</div>
							</c:if>
							<div class="col-6 col-12-xsmall">
								<label for="hostEmail">* 이메일</label>
								<input type="email" name="hostEmail" id="hostEmail" value="${ host.hostEmail }" placeholder="이메일" required>
							</div>
							<div class="col-6 col-12-xsmall">
								<label for="hostPhone">* 전화번호</label>
								<input type="text" name="hostPhone" id="hostPhone" value="${ host.hostPhone }" required>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="regCheck2">
								<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv" id="regCheck3">
								<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">월별 정산 자료를 해당 메일로 보내드립니다.</span>
							</div>
						</div>
						<br><br>
						<h2>2. 정산정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-3">
								<label for="hostEmail">* 은행명</label>
								<input type="text" name="hostBank" id="hostBank" value="${ host.hostBank }" placeholder="은행명" required>
							</div>
							<div class="col-3">
								<label for="hostEmail">* 예금주</label>
								<input type="text" name="hostBname" id="hostBname" value="${ host.hostBname }" placeholder="예금주" required>
							</div>
							<div class="col-6">
								<label for="hostEmail">* 계좌번호</label>
								<input type="text" name="hostAccount" id="hostAccount" value="${ host.hostAccount }" placeholder="계좌번호" required>
							</div>
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">SPLACE를 통해 결제된 금액을 정산 받으실 사업장 통장 계좌를 입력해주세요.</span>
							</div>
						</div>
						<br><br>
						<div class="row">
							<div class="col-4"></div>
							<c:choose>
								<c:when test="${ hostStatus == null }">
									<div class="col-4">
										<input type="submit" id="inserBtn" class="button primary fit" value="등록">
									</div>
								</c:when>
								<c:when test="${ hostStatus == 0 || hostStatus == 3 }">
									<div class="col-2">
										<input type="submit" id="inserBtn" class="button primary fit" value="등록">
									</div>
									<div class="col-2">
										<c:url var="hjoinApply" value="hjoinApply.sp"/>
										<input type="button" class="button primary fit" onclick="location.href='${ hjoinApply }'" value="신청">
									</div>
								</c:when>
								<c:otherwise>
									<!-- 등록, 반려, 승인 상태 -->
									<div class="col-4">
										<input type="submit" id="updateBtn" class="button primary fit" value="수정">
									</div>
								</c:otherwise>
							</c:choose>
							<div class="col-4"></div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/hostInfo.js"></script>
</body>
</html>