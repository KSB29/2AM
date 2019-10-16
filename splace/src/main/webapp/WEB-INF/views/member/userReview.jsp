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
<link rel="stylesheet" href="${contextPath}/resources/css/userReview.css" type="text/css">
<title>후기 리스트</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Member Menu -->
				<jsp:include page="/WEB-INF/views/member/memberMenu.jsp"/>
			<!-- Content -->
				<section>
					<h1 class="align-center">후기 리스트</h1>

				</section>
				<section>
					<h3 class="listCount">total:${pi.listCount }</h3>
					<div class="table-wrapper">
						<table id="reviewArea" class="table_center">
							<colgroup>
								<col width="15%">							
								<col width="20%">							
								<col width="40%">							
								<col width="10%">							
								<col width="15%">							
							</colgroup>		
							<thead>
								<tr>
									<th>공간 사진</th>
									<th>공간 이름</th>
									<th>후기 내용</th>
									<th>날짜</th>
									<th>평점</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty reviewList}">
									<tr><td colspan="5" class="align-center">후기 내역이 없습니다</td></tr>
								</c:if>
								<input type="hidden" id="img" value="${ contextPath }"> 
								<c:forEach var="rList" items="${reviewList}" varStatus="vs">
								<tr class="list table_center">
									<td>
										<div class="col-12 boldText center"> <img src="/splace/resources/spaceImg/${rList.spaceAttChange}"></div> 
									</td>
									<td>
										<div class="col-12">${rList.spaceName}</div>
									</td>		
									<td>
										<div class="col-12">${rList.reviewContent}</div>
									</td>
									<td>
										<div class="col-12"><fmt:formatDate value="${rList.reviewEnroll}" pattern="yyyy.MM.dd(E)"/></div>
									</td>
									<td>
										<div class="col-12">
											<c:forEach var="i" begin="1" end="${rList.reviewScore}">
												<i class="fas fa-star noticeColor"></i>
											</c:forEach>
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
							<c:url var="startPage" value="userReviewList.sp">
								<c:param name="page" value="${ pi.startPage }"/>
							</c:url>
							<a class="pagination-newest" href="${startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="userReviewList.sp">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
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
										<c:url var="pagination" value="userReviewList.sp">
											<c:param name="page" value="${ p }"/>
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
								<c:url var="after" value="userReviewList.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="userReviewList.sp">
								<c:param name="page" value="${ pi.endPage}"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage}">>></a>
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