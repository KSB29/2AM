<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="${contextPath}/resources/css/memberMenu.css" type="text/css">
<body>
	<section>
		<div class="row gtr-uniform">
		
			<div class="menu_col align-center">
				<c:url var="wishListView" value="wishListView.sp"/>
				<c:url var="usageView" value="usageView.sp"/>
				<c:url var="bookList" value="bookList.sp" />	
				<c:url var="userReviewList" value="userReviewList.sp"/>
				<c:url var="memberQna" value="memberQna.sp"/>
				<c:url var="profileView" value="profileView.sp">
					<c:param name="memberId" value="${ loginUser.memberId }"/>
				</c:url>
				<h2><a href="${profileView}">마이페이지</a></h2>
			</div>

			<div class="menu_col align-center">
				<h2><a href="${wishListView}">위시리스트</a></h2>
			</div>
			<div class="menu_col align-center">
				<h2><a href="${bookList}">예약관리</a></h2>
			</div>
			<div class="menu_col align-center">
				<h2><a href="${userReviewList}">후기관리</a></h2>
			</div>
			<div class="menu_col align-center">
				<h2><a href="${memberQna}">1:1문의</a></h2>
			</div>
			

		</div>
		<hr>
	</section>
</body>
</html>