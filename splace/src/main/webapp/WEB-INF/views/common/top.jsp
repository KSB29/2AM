<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- template -->
	<noscript><link rel="stylesheet" href="${contextPath }/resources/css/noscript.css"></noscript>
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- css -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/resources/css/fontawesome-all.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
</head>
<body class="is-preload">
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	
	<!-- Header -->
	<header id="header">
		<!-- Nav -->
		<nav>
			<!-- Logo -->
			<ul>
				<li>
					<a href="${contextPath }" class="logo">
						<img src="${contextPath }/resources/img/logo.png" alt="logo" />
					</a>
				</li>
			</ul>
			<!-- MenuIcon -->
			<ul>
				<li><a href="#menu"></a></li>
			</ul>
			<!-- Search -->
			<ul>
				<li>
					<form action="." id="searchForm">
						<input type="text" name="searchBox" id="searchBox" placeholder="공간을 검색해보세요!">
						<button id="searchBtn"><i class="fa fa-search"></i></button>
					</form>
				</li>
			</ul>
		</nav>
	</header>
	
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<!-- Menu -->
	<nav id="menu">
		<c:if test="${!empty sessionScope.loginUser}">
		<c:url var="logout" value="logout.sp"/>
		<section>
			<div class="row" id="alram">
				<div class="col-9">
					<a href="${logout}">로그아웃</a>
				</div>
				<!-- 알림 벨  -->
				<div class="col-3 align-right">
					<button id="bell" onclick="myFunction()"><i class="fa fa-bell"></i></button>
				</div>
				<!-- 알림 리스트 -->
                <div class=" row notification-container" id="bellList" style="display: none">
                  <h3>알림</h3>
				  <div id="notificationDiv">
						<input class="checkbox" type="checkbox" id="size_1" value="small" checked />
						<label class="notification" for="size_1"><em>1</em>호스트가 예약을 승인했습니다.<br>12시간 이내 결제를 완료해주세요.<i class="material-icons dp48 right">clear</i></label>
					
						<input class="checkbox" type="checkbox" id="size_2" value="small" checked />
						<label class="notification" for="size_2"><em>2</em>호스트가 예약을 승인했습니다.<br>12시간 이내 결제를 완료해주세요.<i class="material-icons dp48 right">clear</i></label>
						
						<input class="checkbox" type="checkbox" id="size_3" value="small" checked />
						<label class="notification" for="size_3"><em>3</em>호스트가 예약을 승인했습니다.<br>12시간 이내 결제를 완료해주세요.<i class="material-icons dp48 right">clear</i></label>
					
						<input class="checkbox" type="checkbox" id="size_4" value="small" checked />
						<label class="notification" for="size_4"><em>4</em>호스트가 예약을 승인했습니다.<br>12시간 이내 결제를 완료해주세요.<i class="material-icons dp48 right">clear</i></label>
					 
						<input class="checkbox" type="checkbox" id="size_5" value="small" checked />
						<label class="notification" for="size_5"><em>5</em>호스트가 예약을 승인했습니다.<br>12시간 이내 결제를 완료해주세요.<i class="material-icons dp48 right">clear</i></label>
				  </div>
                </div>
			</div>
			<div class="row" id="section1row">
				<div class="col-12">
					<span>${loginUser.memberName}님 안녕하세요</span>
				</div>
			</div>
		</section>
		</c:if>
		<section>
			<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<c:url var="loginForm" value="loginForm.sp"/>
				<c:url var="signupForm" value="signupForm.sp"/>
				<div class="row" id="section2row">
					<div class="col-6">
						<button class="button primary small" onclick="location.href='${loginForm}'">로그인</button>
					</div>
					<div class="col-6">
						<button class="button primary small" onclick="location.href='${signupForm}'">회원가입</button>
					</div>
				</div>
			</c:when>
			<c:when test="${!empty sessionScope.loginUser}">
				<c:url var="profileView" value="profileView.sp"/>
				<c:url var="hostApplyForm" value="hostApplyForm.sp">
					<c:param name="memberId" value="${loginUser.memberId}"/>
				</c:url>
				<c:url var="hostInfoForm" value="hostInfoForm.sp"/>
				<c:url var="adminHome" value="adminHome.sp"/>
				<div class="row" id="section2row">
					<c:choose>
						<c:when test="${loginUser.grade eq '0'}">
							<div class="col-12">
								<button class="button primary small" onclick="location.href='${adminHome}'">관리자 페이지</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-6">
								<button class="button primary small" onclick="location.href='${profileView}'">회원</button>
							</div>
							<div class="col-6">
								<c:choose>
									<c:when test="${loginUser.grade eq '1'}">				
										<button class="button primary small" onclick="location.href='${hostApplyForm}'">호스트</button>
									</c:when>
									<c:when test="${loginUser.grade eq '2'}">
										<button class="button primary small" onclick="location.href='${hostInfoForm}'">호스트</button>
									</c:when>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			</c:choose>
		</section>
		<c:url var="noticeList" value="noticeList.sp"/>
		<c:url var="faqList" value="faqList.sp" />
		<c:url var="qnaList" value="qnaList.sp"></c:url>
		<ul>
			<li><a href="${contextPath }">홈</a></li>
			<li><a href="${noticeList}">공지사항</a></li>
			<li><a href="${faqList}">FAQ</a></li>
			<li><a href="${qnaList}">1:1문의</a></li>
		</ul>
	</nav>

	<!-- Scripts -->
	<script src="${contextPath }/resources/js/browser.min.js"></script>
	<script src="${contextPath }/resources/js/breakpoints.min.js"></script>
	<script src="${contextPath }/resources/js/util.js"></script>
	<script src="${contextPath }/resources/js/main.js"></script>
	<!-- splaceScript -->
	<script src="${contextPath}/resources/js/splace.js"></script>
	<!-- selectBox -->
	<script src="${contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath }/resources/js/jquery.magnific-popup.js"></script>
	<script src="${contextPath }/resources/js/gijgo.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- header끝------------------------------------- -->
</body>
</html>