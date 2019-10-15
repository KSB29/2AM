<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>후기 리스트</title>
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
					<h1 class="align-center">후기 리스트</h1>
					<form action="hostReview.sp" id="reviewSearchForm" method="get">
						<div class="row gtr-uniform" id="reviewSearchArea">
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
					<div class="table-wrapper">
						<table id="reviewArea">
							<thead>
								<tr>
									<th>공간</th>
									<th>후기 등록 정보</th>
									<th>후기 내용</th>
									<th>후기 사진</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty rList}">
								<tr><td colspan="5" class="align-center">후기 내역이 없습니다.</td></tr>
								</c:if>
								<input type="hidden" id="img" value="${ contextPath }">
								<c:forEach var="rList" items="${ rList }" varStatus="vs">
								<tr class="list">
									<td>
										<div class="col-12 boldText">${ rList.spaceName }</div>
										<div class="col-12">${ rList.bookId }</div>
									</td>
									<td>
										<div class="col-12"><fmt:formatDate value="${rList.reviewEnroll }" pattern="yyyy.MM.dd(E)"/></div>
										<div class="col-12">${ rList.memberName }</div>
									</td>
									<td>
										<div class="col-12">
											<c:forEach var="i" begin="1" end="${ rList.reviewScore }">
												<i class="fas fa-star noticeColor"></i>
											</c:forEach>
										</div>
										<div class="col-12">${ rList.reviewContent }</div>
									</td>
									<td class="attTd">
										<div class="col-12">
										<input type="hidden" class="attInfo" id="attInfo${ vs.index }" value="${ rList.attInfo }">
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="hostReview.sp">
								<c:param name="page" value="${ pi.startPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
							</c:url>
							<a class="pagination-newest" href="${startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="hostReview.sp">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty rList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty rList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="hostReview.sp">
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
								<c:url var="after" value="hostReview.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="spaceId" value="${ search.spaceId }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="hostReview.sp">
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
	<script src="${contextPath}/resources/js/hostReview.js"></script>
</body>
</html>