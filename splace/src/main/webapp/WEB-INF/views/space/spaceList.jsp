<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bgBlur {
  background: inherit;
  z-index:-100;
  /* filter: brightness(50%); */
}
.bgImage {
	background-size:cover;
	margin-bottom: 10px !important;
}
.btnList {
	margin-bottom: 0 !important;
}
.bgBlur {
	background: rgba(0,0,0,.6);
	display: table;
	width: 100%;
	border-radius: 1%;
	
}
.bgBlur span {
	color: #fff;
	display: table;
	text-align: center;
}
</style>
<title>공간 리스트</title>
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
					<h1 class="align-center">공간 리스트</h1>
					<div class="row gtr-uniform">
						<c:forEach var="i" begin="1" end="3">
							<div class="col-4">
								<div class="image fit bgImage" style="background-image:url('${contextPath }/resources/spaceImg/space${i}.PNG');">
									<span class="bgBlur"><br><br><br><br><br><br><br><span>비공개 중입니다.</span></span>
								</div>
								<span>공간명${i}</span>
								<div class="image fit btnList">
									<a class="button primary small" href="spaceUpdateForm.sp">수정</a>
									<a class="button primary small" href="spacePrice.sp">가격 등록</a>
									<a class="button primary small" href="spaceDayoff.sp">휴일 등록</a>
								</div>
								<c:if test="${i==1 }">
								<div class="image fit btnList">
									<a class="button small" href="">신청</a>
									<a class="button small" href="">삭제</a>
								</div>
								</c:if>
							</div>
						</c:forEach>
						<c:forEach var="i" begin="4" end="7">
							<div class="col-4">
								<div class="image fit bgImage" style="background-image:url('${contextPath }/resources/spaceImg/space${i}.PNG');">
									<br><br><br><br><br><br><br>
								</div>
								<span>공간명${i}</span>
								<div class="image fit btnList">
									<a class="button primary small" href="spaceUpdateForm.sp">수정</a>
									<a class="button primary small" href="spacePrice.sp">가격 등록</a>
									<a class="button primary small" href="spaceDayoff.sp">휴일 등록</a>
								</div>
								<c:if test="${i==1 }">
								<div class="image fit btnList">
									<a class="button small" href="">신청</a>
									<a class="button small" href="">삭제</a>
								</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<script>
						$(document).ready(function(){
							;
						});
					</script>
					<br><br>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="button" class="button primary fit" onclick="location.href='spaceInsertForm.sp'" value="공간 등록">
						</div>
						<div class="col-4"></div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>