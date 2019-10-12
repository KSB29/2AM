<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 리스트</title>
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
					<h1 class="align-center">정산 리스트</h1>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>기간</th>
									<th>결제금액</th>
									<th>수수료</th>
									<th>정산금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="aList" items="${ aList }">
								<tr>
									<td><fmt:formatDate value="${ aList.accountStart }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ aList.accountEnd }" pattern="yyyy.MM.dd"/></td>
									<td><fmt:formatNumber value="${ aList.accountTotal }" type="currency"/></td>
									<td><fmt:formatNumber value="${ aList.accountFee }" type="currency"/></td>
									<td><fmt:formatNumber value="${ aList.accountPrice }" type="currency"/></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="hostAccount.sp">
								<c:param name="page" value="${ pi.startPage }"/>
							</c:url>
							<a class="pagination-newest" href="${ startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="hostAccount.sp">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty aList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty aList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="hostAccount.sp">
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
								<c:url var="after" value="hostAccount.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="hostAccount.sp">
								<c:param name="page" value="${ pi.endPage }"/>
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
</body>
</html>