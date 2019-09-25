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
	<noscript><link rel="stylesheet" href="${contextPath }/resources/css/noscript.css" /></noscript>
	<!-- js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- css -->	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
	<script>
		//scroll to top
		$(window).scroll(function(){
			if ($(this).scrollTop() > 100) {
				$('.scrollup').fadeIn();
				} else {
				$('.scrollup').fadeOut();
			}
		});
		$('.scrollup').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 1000);
				return false;
		});
	</script>

	<!-- Menu -->
	<nav id="menu">
		<c:if test="${!empty sessionScope.loginUser}">
		<c:url var="logout" value="logout.sp"/>
		<section>
			<div class="row" id="alram">
				<div class="col-9">
					<a href="${logout}">로그아웃</a>
				</div>
				<div class="col-3 align-right">
					<button id="bell"><i class="fa fa-bell"></i></button>
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
				<c:url var="pwdCheckForm" value="pwdCheckForm.sp"/>
				<c:url var="hostApplyForm" value="hostApplyForm.sp" />
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
								<button class="button primary small" onclick="location.href='${pwdCheckForm}'">회원</button>
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
	
	<!-- header끝------------------------------------------------ -->
</body>
</html>