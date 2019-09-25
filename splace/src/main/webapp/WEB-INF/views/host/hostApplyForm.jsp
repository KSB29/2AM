<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>호스트 등록</title>
<style>
	.hostStatus {
		color: #4C74B9;
	}
</style>
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Form -->
				<section>
					<h1 class="align-center">호스트 정보</h1>
					<c:if test="${ host.statusId == 0 }">
						<div class="col-12 align-center"><h2 class="hostStatus">정보가 등록되었습니다. 호스트 승인 신청하세요.</h2></div>
					</c:if>
					<c:if test="${ host.statusId == 1 }">
						<div class="col-12 align-center"><h2 class="hostStatus">호스트 신청 검토 중입니다.</h2></div>
					</c:if>
					<c:if test="${ host.statusId == 3 }">
						<div class="col-12 align-center"><h2 class="hostStatus">호스트 신청이 반려되었습니다. 수정 후 재신청하세요.</h2></div>
					</c:if>
					
					<c:choose>
						<c:when test="${ host.hostId == null }">
							<c:url var="hostUrl" value="hostInsert.sp"/>
						</c:when>
						<c:otherwise>
							<c:url var="hostUrl" value="hostUpdate.sp"/>
						</c:otherwise>
					</c:choose>

					<form method="post" action="${ hostUrl }">
						<c:if test="${ !empty host }">
							<input type="hidden" name="hostId" value="${ host.hostId }">
						</c:if>
						<input type="hidden" name="memberId" value="${ loginUser.memberId }">
						<h2>1. 기본정보</h2>
						<p>(관리자 승인 이후에는 대표자명, 상호명, 사업자등록번호 변경이 불가능합니다.)</p>
						<div class="row gtr-uniform">
							<div class="col-4 col-12-xsmall">
								<label for="hostName">* 대표자명</label>
								<input type="text" name="hostName" id="hostName" value="${ host.hostName }" placeholder="대표자명" required autocomplete="off">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="storeName">* 상호명(개인/법인)</label>
								<input type="text" name="storeName" id="storeName" value="${ host.storeName }" placeholder="상호명(개인/법인)" required autocomplete="off">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="hostNo">* 사업자등록번호</label>
								<input type="text" name="hostNo" id="hostNo" value="${ host.hostNo }" placeholder="사업자등록번호" required autocomplete="off">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="hostPhone">* 전화번호(-없이)</label>
								<input type="text" name="hostPhone" id="hostPhone" value="${ host.hostPhone }" placeholder="전화번호" required>
							</div>
							<div class="col-8 col-12-xsmall">
								<label for="hostEmail">* 이메일</label>
								<input type="email" name="hostEmail" id="hostEmail" value="${ host.hostEmail }" placeholder="이메일" required>
							</div>
						</div>
						<br><br>
						<h2>2. 정산정보</h2>
						<div class="row gtr-uniform">
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
								<c:when test="${ host.statusId == null }">
									<div class="col-4">
										<input type="submit" class="button primary fit" value="등록">
									</div>
								</c:when>
								<c:when test="${ host.statusId == 0 || host.statusId == 3 }">
									<div class="col-2">
										<input type="submit" class="button primary fit" value="등록">
									</div>
									<div class="col-2">
										<c:url var="hostApply" value="hostApply.sp">
											<c:param name="hostId" value="${ host.hostId }"/>
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
				<script>
					// 승인 대기일 경우 수정버튼 비활성으로 설정
					if (${ host.statusId == 1 }) {
						$("#updateBtn").prop("disabled", true);
					}
					
					// 승인 상태일 경우 대표자명, 상호명, 사업자등록번호 비활성으로 설정
					if (${ host.statusId == 2 }) {
						$("#hostName").prop("disabled", true);
						$("#storeName").prop("disabled", true);
						$("#hostNㅐ").prop("disabled", true);
					}
				</script>
				

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath }/resources/js/alram.js"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js'></script>
</body>
</html>