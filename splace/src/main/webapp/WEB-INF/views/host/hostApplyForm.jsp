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
							<c:url var="hostUrl" value="hostInsert.sp"/>
						</c:when>
						<c:otherwise>
							<c:url var="hostUrl" value="hostUpdate.sp"/>
						</c:otherwise>
					</c:choose>
				<!-- Form -->
					<form method="post" action="${ hostUrl }">
						<c:if test="${ !empty host }">
							<input type="hidden" name="hostId" id="hostId" value="${ hostId }">
							<input type="hidden" name="hostSatus" id="hostStatus" value="${ hostStatus }">
						</c:if>
						<input type="hidden" name="memberId" value="${ loginUser.memberId }">
						<h2>1. 기본정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-3 col-12-xsmall">
								<label for="hostName">* 대표자명</label>
								<input type="text" name="hostName" id="hostName" value="${ host.hostName }" placeholder="2글자 이상 5글자 이내 한글로 입력해주세요." required autocomplete="off">
							</div>
							<div class="col-5 col-12-xsmall">
								<label for="storeName">* 상호명(개인/법인)</label>
								<input type="text" name="storeName" id="storeName" value="${ host.storeName }" placeholder="상호명(개인/법인)" required autocomplete="off">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="hostNo">* 사업자등록번호</label>
								<input type="text" name="hostNo" id="hostNo" value="${ host.hostNo }" placeholder="사업자등록번호" required autocomplete="off">
							</div>
							<div class="col-12 col-12-xsmall">
								<span id="regCheck1" class="warningColor"></span>
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">관리자 승인 이후에는 대표자명, 상호명, 사업자등록번호 변경이 불가능합니다. 정확한 정보인지 확인해주세요.</span>
							</div>
							<div class="col-2 col-12-xsmall">
								<label for="hostPhone">* 전화번호</label>
								<input type="text" name="hostPhone1" id="hostPhone1" value="${ host.hostPhone }" required>
							</div>
							<div class="col-2 col-12-xsmall">
								<label for="hostPhone">&nbsp;</label>
								<input type="text" name="hostPhone2" id="hostPhone2" size="4" maxlength="4" value="${ host.hostPhone }" required>
							</div>
							<div class="col-2 col-12-xsmall">
								<label for="hostPhone">&nbsp;</label>
								<input type="text" name="hostPhone3" id="hostPhone3" size="4" maxlength="4" value="${ host.hostPhone }" required>
							</div>
							<div class="col-6 col-12-xsmall">
								<label for="hostEmail">* 이메일</label>
								<input type="email" name="hostEmail" id="hostEmail" value="${ host.hostEmail }" placeholder="이메일" required>
							</div>
							<span id="regCheck1" class="warningColor"></span>
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
						</div>
						<br><br>
						<div class="row">
							<div class="col-4"></div>
							<c:choose>
								<c:when test="${ hostStatus == null }">
									<div class="col-4">
										<input type="submit" class="button primary fit" value="등록">
									</div>
								</c:when>
								<c:when test="${ hostStatus == 0 || hostStatus == 3 }">
									<div class="col-2">
										<input type="submit" class="button primary fit" value="등록">
									</div>
									<div class="col-2">
										<c:url var="hostApply" value="hostApply.sp">
											<c:param name="hostId" value="${ hostId }"/>
											<c:param name="memberId" value="${ loginUser.memberId }"/>
										</c:url>
										<input type="button" class="button primary fit" onclick="location.href='${ hostApply }'" value="신청">
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