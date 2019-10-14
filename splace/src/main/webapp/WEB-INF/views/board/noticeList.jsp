<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
<link rel="stylesheet" href="${contextPath}/resources/css/noticeList.css">
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
		<%@ include file="../../../WEB-INF/views/common/top.jsp"%>
		<div id="main">
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
				<section>
					<div class="row titleBox bookDetailTitleBox" id="titleBox1">
						<h1 id="title">공지사항</h1>
						<span>total: ${pi.listCount }</span>
					</div>
					
					<div class="row">
						<c:url var="bookList" value="bookList.sp" />
						<table class="table-wrapper">
							<c:if test="${empty bList}">
								<tr><td colspan="3">공지사항이 없습니다.</td></tr>
							</c:if>
							<tr class="accordion" id="accordionExample">
								<c:forEach items="${bList }" var="notice">
									<td class="card">
										<div class="card-header" id="header${notice.boardId }">
											<span class="col-6">${notice.boardTitle }</span>
											<button class="button primary small buttonToggle col-4" type="button" data-toggle="collapse" data-target="#content${notice.boardId }" aria-expanded="false" aria-controls="content${notice.boardId }">.</button>										
										</div>
										<div class="collapse" id="content${notice.boardId }" aria-labelledby="header${notice.boardId }" data-parent="#accordionExample">
											<div class="card card-body">
												<span class="noticeDate">
													<fmt:formatDate value="${notice.boardEnroll }" pattern="yyyy.MM.dd (E)"/>
												</span>
												<div class="noticeContent">
													${notice.boardContent }
												</div>
											</div>
										</div>
									</td>
								</c:forEach>
							</tr>
						</table>
						<nav class="pagination-container">
							<div class="pagination">
								<!-- [이전] -->
								<c:url var="startPage" value="noticeList.sp">
									<c:param name="page" value="${ pi.startPage }"/>
								</c:url>
								<a class="pagination-newest" href="${startPage }"><<</a>
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pagination-newer" href="#"><</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="noticeList.sp">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a class="pagination-newer" href="${ before }"><</a>
								</c:if>					
								<span class="pagination-inner">
									<!-- 페이지 -->
									<c:if test="${empty bList}">
										<a class="pagination-active" href="#">1</a>
									</c:if>
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<a class="pagination-active" href="#">${ p }</a>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="noticeList.sp">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a>
										</c:if>
									</c:forEach>
								</span>
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<a class="pagination-older" href="#">></a>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="noticeList.sp">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<a class="pagination-older" href="${ after }">></a>
								</c:if>
								<c:url var="endPage" value="noticeList.sp">
									<c:param name="page" value="${ pi.endPage }"/>
								</c:url>
								<a class="pagination-oldest" href="${endPage }">>></a>
							</div>
						</nav>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>