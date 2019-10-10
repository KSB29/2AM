<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<form action="">
						<div class="row gtr-uniform">
							<div class="col-6"></div>
							<div class="col-3">
									<select name="spaceId" id="spaceId">
										<option value="">- 공간 -</option>
										<c:forEach var="sList" items="${ sList }">
										<option value="${ sList.spaceId }">${ sList.spaceName }</option>
										</c:forEach>
									</select>
							</div>
							<div class="col-3">
								<!-- <div class="default-select" id="default-select"> -->
									<select name="spaceStatus" id="spaceStatus">
										<option value="">- 예약상태 -</option>
										<option value="0">등록</option>
										<option value="1">대기</option>
										<option value="2">승인</option>
										<option value="3">반려</option>
									</select>
								<!-- </div> -->
							</div>
						</div>
					</form>
				</section>
				<section>		
					<div class="table-wrapper">
						<table id="bookArea">
							<thead>
								<tr>
									<th>공간</th>
									<th>회원</th>
									<th>예약신청일</th>
									<th>이용날짜</th>
									<th>이용시간</th>
									<th>인원</th>
									<th>금액</th>
									<th>상태</th>
									<th>예약취소일</th>
									<th>호스트승인일</th>
									<th><input type="checkbox" id="checkAll"><label for="checkAll"></label></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bList" items="${ bList }" varStatus="vs">
								<tr class="list">
									<td>${ bList.spaceName }</td>
									<td>${ bList.memberName }</td>
									<td>${ bList.bookEnroll }</td>
									<td>${ bList.bookDate }</td>
									<td>${ bList.bookStartTime } ~ ${ bList.bookEndTime } 시</td>
									<td>${ bList.bookPer } 명</td>
									<td class=".align-right"><fmt:formatNumber value="${ bList.bookPrice }" groupingUsed="true"/></td>
									<td>${ bList.statusName }</td>
									<td>${ bList.bookCancel }</td>
									<td>${ bList.approvalDate }</td>
									<th class="checkList">
										<c:if test="${ bList.statusId == 100}"><input type="checkbox" id="check${vs.index}"></c:if>
										<c:if test="${ bList.statusId != 100 }"><input type="checkbox" id="check${vs.index}" disabled></c:if>
										<label for="check${vs.index}"></label>
									</th>
								</tr>
								<tr class="detail">
									<td class="bookId">${ bList.bookId }</td>
									<td colspan="10"> ${ bList.booker } / ${ bList.bookerPhone } / ${ bList.bookerEmail } / ${ bList.bookRequest }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="bookList.sp">
								<c:param name="page" value="${ pageInfo.startPage }"/>
								<c:param name="filter" value="${filter}"/>
							</c:url>
							<a class="pagination-newest" href="${startPage }"><<</a>
							<c:if test="${ pageInfo.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pageInfo.currentPage > 1 }">
								<c:url var="before" value="bookList.sp">
									<c:param name="page" value="${ pageInfo.currentPage - 1 }"/>
									<c:param name="filter" value="${filter}"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${empty bList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:forEach var="p" begin="${ pageInfo.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pageInfo.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pageInfo.currentPage }">
										<c:url var="pagination" value="bookList.sp">
											<c:param name="page" value="${ p }"/>
											<c:param name="filter" value="${filter}"/>
										</c:url>
										<a href="${ pagination }">${ p }</a>
									</c:if>
								</c:forEach>
							</span>
							<!-- [다음] -->
							<c:if test="${ pageInfo.currentPage >= pageInfo.maxPage }">
								<a class="pagination-older" href="#">></a>
							</c:if>
							<c:if test="${ pageInfo.currentPage < pageInfo.maxPage }">
								<c:url var="after" value="bookList.sp">
									<c:param name="page" value="${ pageInfo.currentPage + 1 }"/>
									<c:param name="filter" value="${filter}"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="bookList.sp">
								<c:param name="page" value="${ pageInfo.endPage }"/>
								<c:param name="filter" value="${filter}"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage }">>></a>
						</div>
					</nav>
					
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