<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
   
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/memberQna.css" />
		
	</head>
	
	
	<body class="is-preload">
		
		<!-- header -->
		
		<jsp:include page="../common/top.jsp"/>
		<!-- Wrapper -->
			<div id="wrapper">
		

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<jsp:include page="memberMenu.jsp"/>
                            <section>
                            </section>
                                <section>
                                        <h1 class="center">1:1문의 </h1>
                                        <article class="row"> 
                                            <div class="col-12 bookListTop">
                                         	   <div class="filterContainer">
                                         	   		<div class="default-select" id="default-select">
		                                                <select name="filter" id="filter">
		                                                    <option value="">전체검색</option>
		                                                    <option value="1">답변 완료</option>
		                                                    <option value="1">답변 대기</option>
		                                                </select>
	                                                </div>
                                                </div>
                                            </div>
                                        </article>
                                        <div class=>
                                        
                                        	
                                            <table>
												<colgroup>
													<col width="20%">							
													<col width="60%">							
													<col width="10%">							
													<col width="10%">							
												</colgroup>
                                                <thead>
                                                    <tr class="center">
                                                        <th>글번호</th>
                                                        <th>제목</th>
                                                        <th>등록일</th>
                                                        <th>처리상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:if test="${empty qnaList}">
														<tr><td colspan="5" class="align-center">문의 내역이 없습니다</td></tr>
													</c:if>
                                            		<c:forEach var="q" items="${qnaList}" varStatus="vs">
                                             		
                                                    <tr>
                                                        <td>${q.qnaId}</td>
                                                        <td>${q.qContent}</td>
                                                        <td>
		               										<div><fmt:formatDate value="${q.qDate}" pattern="yyyy.MM.dd(E)"/></div>
                                                        </td>   
                                                        
                                                  		<td class="centser">
                                                  		<input type="checkbox" id="qcheck" name="" value="" checked disabled>
                                                  		<label for="qcheck"></label>
                                                  		</td>
                                                   		<%-- <c:if test="${empty q.aContent}">                                             
                                                       		 <td> <input type="radio" checked></td>
                                                        </c:if>
                                                   		<c:if test="${!empty q.aContent}">     
                                                      		 <td> <input type="radio" readonly></td>                                               		           	                           
                                                        </c:if> --%>
                                                    </tr>                                                                                                           
                                                    </c:forEach>
                                                </tbody>

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
								<c:if test="${ empty rList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty rList}">
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
								<c:param name="page" value="${ pi.endPage}"/>
							</c:url>
							<a class="pagination-oldest" href="${endPage}">>></a>
						</div>
					</nav>
					</div>							
							
						</div>
					</div>
			</div>
			
			<!-- Footer -->
			<jsp:include page="../common/bottom.jsp"/>
			



	</body>
</html>