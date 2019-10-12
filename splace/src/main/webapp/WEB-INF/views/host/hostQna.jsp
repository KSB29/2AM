<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>Q&A 리스트</title>
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
					<h1 class="align-center">Q&A 리스트</h1>
					<form action="hostQna.sp" method="get">
						<div class="row gtr-uniform">
							<div class="col-8"></div>
							<div class="col-2">
								<select name="spaceId" id="spaceId">
									<option value="">- 공간 -</option>
									<c:forEach var="sList" items="${ sList }">
									<option value="${ sList.spaceId }" <c:if test="${ search.spaceId == sList.spaceId }">selected</c:if>>${ sList.spaceName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-2">
								<select name="statusId" id="statusId">
									<option value="">- 답변상태 -</option>
									<option value="0" <c:if test="${ search.statusId == '0' }">selected</c:if>>미등록</option>
									<option value="1" <c:if test="${ search.statusId == '1' }">selected</c:if>>완료</option>
								</select>
							</div>
						</div>
					</form>
				</section>
				<section>
					<h3 class="listCount">total: ${pi.listCount }</h3>
					<div class="row gtr-uniform" id="qnaArea">
						<div class="col-5">
							<!-- 문의내용 문의작성날짜 답변내용 답변작성날짜 상태(Y: 정상, N:삭제) 회원아이디 -->
							<table id="qArea">
								<thead>
									<tr>
										<th>공간</th>
										<th>회원</th>
										<th>문의날짜</th>
										<th>답변날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty qList}">
									<tr><td colspan="4" class="align-center">문의 내역이 없습니다.</td></tr>
									</c:if>
									<c:forEach var="qList" items="${ qList }">
									<tr>
										<td>${ qList.spaceName }</td>
										<td>${ qList.qMemberName }</td>
										<td>${ qList.qDate }</td>
										<td>${ qList.aDate }</td>
										<input type="hidden" class="qContent" value="${ qList.qContent }">
										<input type="hidden" class="aContent" value="${ qList.aContent }">
										<input type="hidden" class="qnaId" value="${ qList.qnaId }">
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-7">
							<div class="row gtr-uniform" id="aArea">
								<div class="col-12 col-12-xsmall">
									<label for="qContent">문의</label>
									<textarea name="qContent" id="qContent" rows="3" readonly></textarea>
								</div>
								<div class="col-10 col-12-xsmall">
									<label for="aContent">답변</label>
									<textarea name="aContent" id="aContent" placeholder="답변" rows="3"></textarea>
								</div>
								<div class="col-2 col-12-xsmall">
									<label>&nbsp;</label>
									<input type="hidden" name="qnaId" id="qnaId">
									<input type="button" class="button primary fit" value="등록" onclick="answer();">
								</div>
							</div>
							<br><br>
						</div>
					</div>
					<div class="row">
					<nav class="pagination-container">
						<div class="pagination">
							<!-- [이전] -->
							<c:url var="startPage" value="hostQna.sp">
								<c:param name="page" value="${ pi.startPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
							</c:url>
							<a class="pagination-newest" href="${ startPage }"><<</a>
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="pagination-newer" href="#"><</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="hostQna.sp">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
								</c:url>
								<a class="pagination-newer" href="${ before }"><</a>
							</c:if>					
							<span class="pagination-inner">
								<!-- 페이지 -->
								<c:if test="${ empty qList}">
									<a class="pagination-active" href="#">1</a>
								</c:if>
								<c:if test="${ !empty qList}">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<a class="pagination-active" href="#">${ p }</a>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="hostQna.sp">
											<c:param name="page" value="${ p }"/>
											<c:param name="spaceId" value="${ search.spaceId }"/>
											<c:param name="statusId" value="${ search.statusId }"/>
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
								<c:url var="after" value="hostQna.sp">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="spaceId" value="${ search.spaceId }"/>
									<c:param name="statusId" value="${ search.statusId }"/>
								</c:url> 
								<a class="pagination-older" href="${ after }">></a>
							</c:if>
							<c:url var="endPage" value="hostQna.sp">
								<c:param name="page" value="${ pi.endPage }"/>
								<c:param name="spaceId" value="${ search.spaceId }"/>
								<c:param name="statusId" value="${ search.statusId }"/>
							</c:url>
							<a class="pagination-oldest" href="${ endPage }">>></a>
						</div>
					</nav>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/hostQna.js"></script>
</body>
</html>