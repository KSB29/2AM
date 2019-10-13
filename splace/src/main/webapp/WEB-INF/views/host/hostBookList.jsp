<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>예약 리스트</title>
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
					<h1 class="align-center">예약 리스트</h1>
					<form action="hostBookList.sp" method="get">
						<div class="row gtr-uniform" id="bookSearchArea">
							<div class="col-6"></div>
							<div class="col-3">
									<select name="spaceId" id="spaceId">
										<option value="">- 공간 -</option>
										<c:forEach var="sList" items="${ sList }">
										<option value="${ sList.spaceId }" <c:if test="${ search.spaceId == sList.spaceId }">selected</c:if>>${ sList.spaceName }</option>
										</c:forEach>
									</select>
							</div>
							<div class="col-3">
								<!-- <div class="default-select" id="default-select"> -->
									<select name="statusId" id="statusId">
										<option value="">- 예약상태 -</option>
										<c:forEach var="stList" items="${ stList }">
										<option value="${ stList.statusId }" <c:if test="${ search.statusId == stList.statusId }">selected</c:if>>${ stList.statusName }</option>
										</c:forEach>
									</select>
								<!-- </div> -->
							</div>
						</div>
					</form>
				</section>
				<section>
					<h3 class="listCount">total: ${pi.listCount }</h3>
					<div class="table-wrapper">
						<table id="bookArea">
							<thead>
								<tr>
									<th>공간</th>
									<th>예약 내역</th>
									<th>예약자 정보</th>
									<th>예약 상태</th>
									<th><input type="checkbox" id="checkAll"><label for="checkAll"></label></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty bList}">
								<tr><td colspan="5" class="align-center">예약 내역이 없습니다.</td></tr>
								</c:if>
								<c:forEach var="bList" items="${ bList }" varStatus="vs">
								<tr class="list">
									<td>
										<div class="col-12 boldText">${ bList.spaceName }</div>
										<div class="col-12"><span id="bookId${vs.index}">${ bList.bookId }</span></div>
									</td>
									<td>
										
										<div class="col-12 boldText">
											<span>
												<fmt:formatDate value="${bList.bookDate }" pattern="yyyy.MM.dd(E)"/>
												${bList.bookStartTime }시 ~ ${bList.bookEndTime }시, ${ bList.bookPer }명
											</span>
										</div>
										<div class="col-12 boldText">
											<fmt:formatNumber value="${bList.bookPrice }" type="currency"/>
										</div>
										<div class="col-12"><fmt:formatDate value="${bList.bookEnroll }" pattern="yyyy.MM.dd(E)"/> ${ bList.memberName }</div>
									</td>
									<td>
										<div class="col-12 boldText">${ bList.booker }</div>
										<div class="col-12">${ bList.bookerPhone }, ${ bList.bookerEmail }</div>
										<div class="col-12">${ bList.bookRequest }</div>
									</td>
									<td>
										<c:choose>
										<c:when test="${ bList.statusId == 101 }">
										<div class="col-12 approval">${ bList.statusName }</div>
										<div class="col-12">${ bList.approvalDate }</div>
										</c:when>
										<c:when test="${ bList.statusId == 102 }">
										<div class="col-12 cancel">${ bList.statusName }</div>
										<div class="col-12">${ bList.bookCancel }</div>
										</c:when>
										<c:otherwise>
										<div class="col-12">${ bList.statusName }</div>
										</c:otherwise>
										</c:choose>
									</td>
									<th class="checkList">
										<c:if test="${ bList.statusId == 100 }"><input type="checkbox" id="check${vs.index}"></c:if>
										<c:if test="${ bList.statusId != 100 }"><input type="checkbox" id="check${vs.index}" disabled></c:if>
										<label for="check${vs.index}"></label>
									</th>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="hostBookList.sp">
								<c:param name="page" value="${ pi.startPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
							</c:url>
							<a class="pagination-newest" href="${ startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="hostBookList.sp">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty bList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty bList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="hostBookList.sp">
											<c:param name="page" value="${ p }"/>
											<c:param name="spaceId" value="${ search.spaceId }"/>
											<c:param name="statusId" value="${ search.statusId }"/>
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
								<c:url var="after" value="hostBookList.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="spaceId" value="${ search.spaceId }"/>
									<c:param name="statusId" value="${ search.statusId }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="hostBookList.sp">
								<c:param name="page" value="${ pi.endPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage }">>></a>
						</div>
					</nav>
					</div>
					<br>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-3">
							<input type="button" class="button primary fit" value="승인" onclick="submit();">
						</div>
						<div class="col-3">
							<input type="button" class="button fit" value="반려" onclick="reject();">
						</div>
						<div class="col-3"></div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/hostBookList.js"></script>
</body>
</html>