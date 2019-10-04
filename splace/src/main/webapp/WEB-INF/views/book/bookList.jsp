<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bookList.css">
</head>
<body>
	<c:if test="${empty sessionScope.loginUser}">
		<c:set var="msg" value="로그인 해주세요!" scope="session" />
		<c:redirect url="/"/>
	</c:if>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
		<jsp:include page="../../../WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
				<jsp:include page="../member/memberMenu.jsp"/>
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
				<section>
					<div class="row">
						<div class="col-12">
							<div class="filterContainer">
								<div class="default-select" id="default-select">
									<select name="filter" id="filter">
										<option value="0">전체</option>
										<option value="100">승인대기</option>
										<option value="101">결제대기</option>
										<option value="103">예약완료</option>
										<option value="102">취소/환불</option>
										<option value="104">이용완료</option>
									</select>
								</div>
							</div>
						</div>
						<table class="table-wrapper">
							<tr>
								<td><img src="${contextPath}/resources/img/back03.jpg" alt="공간대표사진"></td>
								<td>
									<div class="col-12">승인대기</div>
									<div class="col-12"><h2>더빅스터디</h2></div>
									<div class="col-12"><span>2019.09.20(금) 18시~20시, 2시간</span></div>
									<div class="col-12"><p>17,400원</p></div>
								</td>
								<td>
									<c:url var="bookDetail" value="bookDetail.sp">
										<c:param name="bookId" value="${bookId }" />
									</c:url>
									<div>
										<button class="button primary" onclick="location.href='${bookDetail}'">상세보기</button>
										<button class="button">후기작성</button>
									</div>
								</td>
							</tr>
						</table>
						<nav class="pagination-container">
							<div class="pagination">
								<a class="pagination-newest" href="#"><<</a>
								<a class="pagination-newer" href="#"><</a>
								<span class="pagination-inner">
									<a class="pagination-active" href="#">1</a>
									<a href="#">2</a>
									<a href="#">3</a>
									<a href="#">4</a>
									<a href="#">5</a>
								</span>
								<a class="pagination-older" href="#">></a>
								<a class="pagination-oldest" href="#">>></a>
							</div>
						</nav>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/bookList.js"></script>
</body>
</html>