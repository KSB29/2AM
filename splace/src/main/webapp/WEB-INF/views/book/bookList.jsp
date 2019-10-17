<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookList.css">
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
				<jsp:include page="../member/memberMenu.jsp"/>
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
				
				<section>
					<div class="row" id="bookListRow">
						<div class="col-12 bookListTop">
							<div class="listCount">total: ${pi.listCount }</div>
							<div class="filterContainer">
								<div class="default-select" id="default-select">
									<select name="filter" id="filter">
										<option value="0" <c:if test="${filter == '0' }">selected</c:if> >전체</option>
										<option value="100" <c:if test="${filter == '100' }">selected</c:if> >승인대기</option>
										<option value="101" <c:if test="${filter == '101' }">selected</c:if> >결제대기</option>
										<option value="103" <c:if test="${filter == '103' }">selected</c:if> >예약완료</option>
										<option value="102" <c:if test="${filter == '102' }">selected</c:if> >취소/환불</option>
										<option value="104" <c:if test="${filter == '104' }">selected</c:if> >이용완료</option>
									</select>
								</div>
							</div>
						</div>
						<c:url var="bookList" value="bookList.sp" />
						<script>
							$("#filter").on("change", function() {
								location.href = "${contextPath}/${bookList}?page="+${pi.startPage}+"&filter="+$(this).val();
							});
						</script>
						<table class="table-wrapper">
							<c:if test="${empty bList}">
								<tr><td colspan="3">예약 내역이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${bList }" var="book">
								<tr>
									<td><img src="${contextPath}/resources/spaceImg/${book.spaceAttChange}" alt="공간대표사진"></td>
									<td>
										<c:choose>
											<c:when test="${book.statusId == 100 }">
												<div class="col-12">승인대기</div>												
											</c:when>
											<c:when test="${book.statusId == 101 }">
												<div class="col-12">결제대기</div>			
											</c:when>
											<c:when test="${book.statusId == 102 && book.pStatusId == 102 }">
												<div class="col-12">취소/환불</div>
											</c:when>
											<c:when test="${book.statusId == 102 }">
												<div class="col-12">취소/환불</div>
											</c:when>
											<c:when test="${book.statusId == 103 && book.pStatusId == 103 }">
												<!-- 예약완료 && 결제완료 -->
												<div class="col-12">예약완료</div>		
											</c:when>
											<c:when test="${book.statusId == 103 && book.pStatusId == 104 }">
												<div class="col-12">이용완료</div>		
											</c:when>
										</c:choose>
										<div class="col-12"><h2>${book.spaceName }</h2></div>
										<div class="col-12"><span>
											<fmt:formatDate value="${book.bookDate }" pattern="yyyy.MM.dd(E)"/>
											${book.bookStartTime }시~${book.bookEndTime }시, ${book.bookEndTime-book.bookStartTime }시간
										</span></div>
										<div class="col-12"><p><fmt:formatNumber value="${book.bookPrice }" type="currency"/></p></div>
									</td>
									<td>
										<c:url var="bookDetail" value="bookDetail.sp"/>
										<div>
											<button class="button fit primary" onclick="location.href='${bookDetail}?bookId=${book.bookId }'">상세보기</button>
											<c:if test="${book.pStatusId == 104 && book.statusId == 103 }">
												<c:if test="${book.reviewId != null }">
													<button class="button fit" onclick="location.href='detailSpace.sp?spaceId=${book.spaceId}'">후기수정</button>
												</c:if>
												<c:if test="${book.reviewId == null}">
													<button class="button fit" onclick="location.href='detailSpace.sp?spaceId=${book.spaceId}'">후기작성</button>																						
												</c:if>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
						<nav class="pagination-container">
							<div class="pagination">
								<!-- [이전] -->
								<c:url var="startPage" value="bookList.sp">
									<c:param name="page" value="${ pi.startPage }"/>
									<c:param name="filter" value="${filter}"/>
								</c:url>
								<a class="pagination-newest" href="${startPage }"><<</a>
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="pagination-newer" href="#"><</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="bookList.sp">
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
											<c:url var="pagination" value="bookList.sp">
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
									<c:url var="after" value="bookList.sp">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
										<c:param name="filter" value="${filter}"/>
									</c:url> 
									<a class="pagination-older" href="${ after }">></a>
								</c:if>
								<c:url var="endPage" value="bookList.sp">
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