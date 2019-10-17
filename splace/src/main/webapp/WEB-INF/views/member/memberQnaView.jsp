<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1문의</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/memberQna.css" />
</head>
<body class="is-preload">
		
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- header -->
		<jsp:include page="../common/top.jsp"/>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<jsp:include page="memberMenu.jsp"/>
                <section>
                	
                        <h1 class="center">1:1문의 </h1>
                        <%-- <form action="memberQna.sp" style="overflow-x:inherit !important;">
                        <article class="row"> 
                            <div class="col-12">
                         	   <div class="filterContainer">
                         	   		<div class="default-select" id="default-select">
                                   	<select name="qStatus" id="qStatus">
                                       <option value="A" <c:if test="${ search.qStatus == 'A' }">selected</c:if>>전체검색</option>
                                       <option value="Y" <c:if test="${ search.qStatus == 'Y' }">selected</c:if>>답변 완료</option>
                                       <option value="N" <c:if test="${ search.qStatus == 'N' }">selected</c:if>>답변 대기</option>
                                   </select>
                                 	</div>
                                </div>
                            </div>
                        </article>
                        </form> --%>
                     <div class="row">
				<table class="table-wrapper">
					<c:if test="${empty qnaList}">
					<tr><td colspan="3">1:1문의가 없습니다.</td></tr>
					</c:if>
					<tr class="accordion" id="accordionExample">
					<c:forEach items="${qnaList }" var="qna">
						<td class="card">
							<div class="card-header" id="header${qna.qnaId }">
								<span class="col-6">${qna.qContent }</span>
								<button class="button primary small buttonToggle col-4" type="button" data-toggle="collapse" data-target="#content${qna.qnaId }" aria-expanded="false" aria-controls="content${qna.qnaId }">.</button>										
							</div>
							<div class="collapse" id="content${qna.qnaId }" aria-labelledby="header${qna.qnaId }" data-parent="#accordionExample">
								<div class="card card-body">
									<span class="qnaDate">
										<fmt:formatDate value="${qna.aDate}" pattern="yyyy.MM.dd (E)"/>
									</span>
									<div class="qnaContent">
										${qna.aContent }
									</div>
								</div>
							</div>
						</td>
						</c:forEach>
					</tr>
				</table>
             </div>
		</section>
			<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="memberQna.sp">
								<c:param name="page" value="${ pi.startPage }"/>
							</c:url>
							<a class="pagination-newest" href="${startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="memberQna.sp">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty qnaList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty qnaList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="memberQna.sp">
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
								<c:url var="after" value="memberQna.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="memberQna.sp">
								<c:param name="page" value="${ pi.endPage }"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage }">>></a>
						</div>
					</nav>
					</div>
				<br><br>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4">
						<input type="button" class="button primary fit" onclick="location.href='memberQnaForm.sp'" value="문의 등록">
					</div>
					<div class="col-4"></div>
				</div>	
			</div>
		</div>
	</div>
			
	<!-- Footer -->
	<jsp:include page="../common/bottom.jsp"/>
</body>
</html>