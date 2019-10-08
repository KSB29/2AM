<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>공간 리스트</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section id="spaceArea">
					<h1 class="align-center">공간 리스트</h1>
					<div class="row gtr-uniform">
						<c:forEach var="list" items="${ sList }">
							<div class="col-4">
								<div class="image fit bgImage" style="background-image:url('${contextPath }/resources/spaceImg/space1.PNG');">
									<c:if test="${ list.statusId != 2 || list.spaceOperStatus == 'N' }"><span class="bgBlur"><em>비공개 중입니다.</em></span></c:if>
								</div>
								<h2 class="marginClear">${ list.spaceName }</h2>
								<div class="marginClear">
									<span>등록일 : ${ list.spaceEnroll }</span>
									<span>&nbsp;&nbsp;&nbsp;</span>
									<label class="switch">
							            <c:if test="${ list.spaceOperStatus == 'Y' }">
							            <c:set var="operValue" value="운영"/>
							            <c:set var="operColor" value="noticeColor"/>
							            <input type="checkbox" class="operStatus" checked>
							            </c:if>
							            <c:if test="${ list.spaceOperStatus == 'N' }">
							            <c:set var="operValue" value="운영중지"/>
							            <c:set var="operColor" value="warningColor"/>
							            <input type="checkbox" class="operStatus">
							            </c:if>
							            <span class="slider round"></span>
							        </label>
							        <span class="switchText ${ operColor }">${ operValue }</span>
						        </div>
								<div class="image fit marginClear">
									<c:url var="spaceUpdateForm" value="spaceUpdateForm.sp">
										<c:param name="spaceId" value="${ list.spaceId }"/>
									</c:url>
									<c:set var="priceFlag" value="${ list.priceFlag }"/>
									<c:url var="spacePrice" value="spacePrice.sp">
										<c:param name="spaceId" value="${ list.spaceId }"/>
										<c:param name="priceFlag" value="${ priceFlag }"/>
									</c:url>
									<c:url var="spaceDayoff" value="spaceDayoff.sp">
										<c:param name="spaceId" value="${ list.spaceId }"/>
									</c:url>
									<a class="button primary small" href="${ spaceUpdateForm }">수정</a>
									<a class="button primary small" href="${ spacePrice }">가격 정보</a>
									<a class="button primary small" href="${ spaceDayoff }">휴일 정보</a>
								</div>
								<div class="image fit marginClear">
									<c:if test="${ list.statusId == 0 || list.statusId == 3}">
									<c:if test="${ priceFlag == 'Y' }">
										<input type="button" class="button small" onClick="spaceApply(${ list.spaceId });" value="신청">
									</c:if>
									<c:if test="${ priceFlag == null }">
										<input type="button" class="button small" value="신청" disabled>
									</c:if>
									</c:if>
									<c:if test="${ list.statusId != 2 }">
									<input type="button" class="button small" onClick="spaceDelete(${ list.spaceId });" value="삭제">
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
					<c:if test="${ loginUser.grade == '2' }">
					<br><br>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="button" class="button primary fit" onclick="location.href='spaceInsertForm.sp'" value="공간 등록">
						</div>
						<div class="col-4"></div>
					</div>
					</c:if>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/spaceList.js"></script>
</body>
</html>