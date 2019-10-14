<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>휴일 리스트</title>
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
					<h1 class="align-center">휴일 리스트</h1>
					<form action="spaceDayoff.sp" id="dayoffSearchForm" method="get">
						<div class="row gtr-uniform" id="dayoffSearchArea">
							<div class="col-9"></div>
							<div class="col-3">
								<div class="default-select" id="default-select">
									<select name="spaceId" id="spaceId">
										<option value="">- 공간 -</option>
										<c:forEach var="sList" items="${ sList }">
										<option value="${ sList.spaceId }" <c:if test="${ search.spaceId == sList.spaceId }">selected</c:if>>${ sList.spaceName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</form>
				</section>
				<section>
					<h3 class="listCount">total: ${pi.listCount }</h3>
					<div class="row gtr-uniform">
						<div class="col-6">
							<table id="offArea">
								<thead>
									<tr>
										<th>공간</th>
										<th>휴일</th>
										<th><input type="checkbox" id="checkAll"><label for="checkAll"></label></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${ empty dList }">
									<tr><td colspan="5" class="align-center">휴일 내역이 없습니다</td></tr>
									</c:if>
									<c:forEach var="dList" items="${ dList }" varStatus="vs">
									<tr class="checkList">
										<input type="hidden" value="${ dList.dayOffId }">
										<td>${ dList.spaceName }</td>
										<td>${ dList.dayOffStart }</td>
										<th><input type="checkbox" id="check${ vs.index }"><label for="check${ vs.index }"></label></th>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-6">
							<div class="row gtr-uniform">
								<div class="col-5 col-2-xsmall">
									<label for="offStart">시작일</label>
									<input type="date" id="offStart">
								</div>
								<div class="col-5 col-2-xsmall">
									<label for="offEnd">종료일</label>
									<input type="date" id="offEnd">
								</div>
								<div class="col-2">
									<label>&nbsp;</label>
									<input type="button" class="button primary small" id="checkBtn" value="확인">
								</div>
								<div class="col-12 col-12-xsmall noticeDiv" id="bookCheck">
									<i class="fas fa-exclamation-circle warningColor"></i> <span class="warningColor"></span>
								</div>
								<div class="col-12 col-12-xsmall noticeDiv">
									<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">기간 내에 이용 예정인 예약이 있을 경우 휴일 등록에서 제외됩니다.</span>
								</div>
								<div class="col-12 col-12-xsmall noticeDiv">
									<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">목록에서 휴일 선택 후 삭제해주세요.</span>
								</div>
								<div class="col-3"></div>
								<div class="col-3">
									<input type="button" class="button primary fit" id="insertBtn" value="저장">
								</div>
								<div class="col-3">
									<input type="button" class="button fit" id="deleteBtn" value="삭제">
								</div>
								<div class="col-3"></div>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="spaceDayoff.sp">
								<c:param name="page" value="${ pi.startPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
							</c:url>
							<a class="pagination-newest" href="${startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="spaceDayoff.sp">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty dList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty dList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="spaceDayoff.sp">
											<c:param name="page" value="${ p }"/>
											<c:param name="spaceId" value="${ search.spaceId }"/>
										</c:url>
										<a href="${ pagination }">${ p }</a>
									</c:if>
								</c:forEach>
								</c:if>
							</span>
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="pagination-older" href="#">></a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="spaceDayoff.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="spaceId" value="${ search.spaceId }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="spaceDayoff.sp">
								<c:param name="page" value="${ pi.endPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage }">>></a>
						</div>
					</nav>
					</div>
				</section>
				
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/spaceDayoff.js"></script>
</body>
</html>