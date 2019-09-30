<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<div class="row gtr-uniform">
			<div class="col-2 align-center">
				<c:url var="profileView" value="profileView.sp">
					<c:param name="memberId" value="${ loginUser.memberId }"/>
				</c:url>
				<h2><a href="${profileView}">마이페이지</a></h2>
			</div>
			
			<c:url var="wishListView" value="wishListView.sp"/>
			<c:url var="usageView" value="usageView.sp"/>
			<div class="col-2 align-center">
				<h2><a href="${wishListView}">위시리스트</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceBookList.sp">예약관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceReviewList.sp">후기관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="${usageView}">이용내역</a></h2>
			</div>
		</div>
		<hr>
	</section>
</body>
</html>