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
					<div class="row">
						<div class="titleBox bookDetailTitleBox" id="titleBox2">
							<h1 id="title">FAQ </h1>
							<span class="listCount">total: ${pi.listCount }</span>
						</div>
						<div class="col-12 bookListTop">
							<div class="filterContainer">
								<div class="default-select" id="default-select">
									<select name="filter" id="filter">
						                <option value="100" <c:if test="${filter==100 }">selected</c:if>>전체</option>
						                <option value="0" <c:if test="${filter==0 }">selected</c:if>>회원</option>
						                <option value="1" <c:if test="${filter==1 }">selected</c:if>>예약 및 결제</option>
						                <option value="2" <c:if test="${filter==2 }">selected</c:if>>취소 및 환불</option>
						                <option value="3" <c:if test="${filter==3 }">selected</c:if>>공간이용 및 후기</option>
						                <option value="4" <c:if test="${filter==4 }">selected</c:if>>기타</option>
									</select>
								</div>
							</div>
						</div>
						<script>
							$("#filter").on("change", function() {
								location.href = "${contextPath}/faqList.sp?page="+${pi.startPage}+"&filter="+$(this).val();
							});
						</script>
						<table class="table-wrapper">
							<c:if test="${empty bList}">
								<tr><td colspan="3">FAQ가 없습니다.</td></tr>
							</c:if>
							<tr class="accordion" id="accordionExample">
								<c:forEach items="${bList }" var="notice">
									<td class="card">
										<div class="card-header" id="header${notice.boardId }">
						                      <c:choose>
						                      	<c:when test="${notice.boardType == 0}">
						                      		<div class="type">회원</div>
						                      	</c:when>
						                      	<c:when test="${notice.boardType == 1}">
						                      		<div class="type">예약 및 결제</div>
						                      	</c:when>
						                      	<c:when test="${notice.boardType == 2}">
						                      		<div class="type">취소 및 환불</div>
						                      	</c:when>
						                      	<c:when test="${notice.boardType == 3}">
						                      		<div class="type">공간이용 및 후기</div>
						                      	</c:when>
						                      	<c:when test="${notice.boardType == 4}">
						                      		<div class="type">기타</div>
						                      	</c:when>
						                      </c:choose>
											<div class="boardTitle">${notice.boardTitle }</div>
											<button class="button primary small buttonToggle" type="button" data-toggle="collapse" data-target="#content${notice.boardId }" aria-expanded="false" aria-controls="content${notice.boardId }">.</button>										
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
								<c:url var="startPage" value="faqList.sp">
									<c:param name="page" value="${ pi.startPage }"/>
									<c:param name="filter" value="${filter}"/>
								</c:url>
								<a class="pagination-newest" href="${startPage }"><<</a>
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pagination-newer" href="#"><</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="faqList.sp">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
										<c:param name="filter" value="${filter}"/>
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
											<c:url var="pagination" value="faqList.sp">
												<c:param name="page" value="${ p }"/>
												<c:param name="filter" value="${filter}"/>
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
									<c:url var="after" value="faqList.sp">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
										<c:param name="filter" value="${filter}"/>
									</c:url> 
									<a class="pagination-older" href="${ after }">></a>
								</c:if>
								<c:url var="endPage" value="faqList.sp">
									<c:param name="page" value="${ pi.endPage }"/>
									<c:param name="filter" value="${filter}"/>
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