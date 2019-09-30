<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<title>SPLACE</title>
</head>
<body>
	<section>
		<div class="row gtr-uniform">
			<div class="col-2 align-center">
				<c:url var="hostApplyForm" value="hostApplyForm.sp">
					<c:param name="memberId" value="${ loginUser.memberId }"/>
				</c:url>
				<h2><a href="${ hostApplyForm }">마이페이지</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceList.sp">공간관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceBook.sp">예약관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceQna.sp">Q&A관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="spaceReview.sp">후기관리</a></h2>
			</div>
			<div class="col-2 align-center">
				<h2><a href="hostAccount.sp">정산내역</a></h2>
			</div>
		</div>
		<hr>
	</section>
</body>
</html>