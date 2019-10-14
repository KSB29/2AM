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
						<a href="javascript:history.back();">
							<%-- <div class="listCount">total: ${pi.listCount }</div> --%>
						</a>
					</div>
					
					<div class="row">
						<c:url var="bookList" value="bookList.sp" />
						<table class="table-wrapper">
							<c:if test="${empty bList}">
								<tr><td colspan="3">공지사항이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${bList }" var="notice">
								<tr class="accordion" id="accordionExample">
								<td class="card">
									<div class="card-header" id="headingOne">
								      <h2 class="mb-0">
								        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								          Collapsible Group Item #1
								        </button>
								      </h2>
								    </div>
								    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
								      <div class="card-body">
								        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
								      </div>
								    </div>
								  </td>
									<%-- <td class="card">
										<div class="card-header" id="header${notice.boardId }">
											<span>${notice.boardTitle }</span>
											<button class="button primary small buttonToggle" type="button" data-toggle="collapse" data-target="#content${notice.boardId }" aria-expanded="false" aria-controls="check2Content">.</button>										
										</div>
										<div class="collapse" id="content${notice.boardId }" aria-labelledby="header${notice.boardId }" data-parent="#accordionExample">
											<div class="card card-body">
												<div class="noticeContent">
													${notice.boardContent }
												</div>
											</div>
										</div>
									</td> --%>
								</tr>
							</c:forEach>
						</table>
						<%-- <nav class="pagination-container">
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
						</nav> --%>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>