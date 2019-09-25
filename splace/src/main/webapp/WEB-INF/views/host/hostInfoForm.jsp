<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>호스트 메인</title>
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- List -->
				<section>
					<h1 class="align-center">호스트 페이지</h1>
					<div class="row">
						<c:if test="${host.status_id == 1 }">
							<div class="col-12 align-center"><h2>호스트 등록 검토 중입니다.</h2></div>
						</c:if>
						<div class="col-4"></div>
						<div class="col-4">
							<a href="hostApplyForm.sp" class="button primary fit">호스트 정보</a>
							<a href="hostApplyForm.sp" class="button primary fit">호스트 수정</a>
							<a href="hostApplyForm.sp" class="button primary fit">호스트 신청</a>
						</div>
						<div class="col-4"></div>
					</div>
				</section>
				

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath }/resources/js/alram.js"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js'></script>
</body>
</html>