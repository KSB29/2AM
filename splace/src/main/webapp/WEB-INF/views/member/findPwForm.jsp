<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/findPw.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		<noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
	</head>
	<body class="is-preload">
	
	<jsp:include page="../common/top.jsp"/> 
		<!-- Wrapper -->
			<div id="wrapper">
			
				<!-- Header -->
	
				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left col-7 center">
										<article class="find_form_1">
											<form action="findPw.sp" method="POST">
													<div class="center">
														<h3>비밀번호를 잊어버리셨군요</h3>
														<p>Splace가 금방 도와드릴게요 :)</p>
													</div>
													<div>
														<div class="find_box_1">
															<input type="text" placeholder="가입 시 입력한 이메일">
														</div>
														<div class="find_box_2">
															<button class="button primary find_btn" type="button" onclick="" >임시비번 받기</button>
														</div>
													</div>
													<div class="input_box col-12">
														<c:url var="loginForm" value="loginForm.sp"/>
														<a class="button fit" href="${loginForm}">로그인 하러 가기</a>
													</div>
											</form>
										</article>
									</section>
									<section class="wrapper_right col-5 center find_bg">
										<article class="find_form_2">
											<div>
												<h3>주의하세요! </h3>
											</div>
											<div >
												<p>
													*네이버, 구글, 카카오로 가입한 계정은
													비밀번호를 찾을 수 없습니다!
												</p>
												<p>
													*임시번호로 로그인 후에는
													반드시 비밀번호 변경하는것 잊지마세요!
												</p>
											</div>
										</article>
									</section>
								</div>
						</div>
					</div>		
		<!-- Footer -->
				
		</div>
		<jsp:include page="../common/bottom.jsp"/>



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>