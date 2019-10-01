<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
		<link rel="stylesheet" href="${contextPath }/resources/css/usage.css" type="text/css">
		
		
	</head>
	<!-- Header -->
	<jsp:include page="../common/top.jsp"/>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">


				<!-- Menu -->


				<!-- Main -->
					<div id="main">
						<div class="inner">
						<jsp:include page="memberMenu.jsp"/>
							<header>
								<h1>이용내역</h1>
							</header>
							<body>
								<div class="border">
									<section class="photoframe">
										<article class="row">
												<div class="image info col-4">
													<img src="${contextPath}/resources/img/pic01.jpg" alt="" />
												</div>																		
												<div class="contents col-6">
													<h3 class="line_height">방이름</h3>
													<div class="content_box">
														<ul class="content col-6">
															<li>이용 날짜 : &nbsp; 2019.08.08</li>
															<li>예약 번호 : &nbsp; ABCDEFG </li>
															<li>위치 : &nbsp; 종로구 남대문로 </li>
															<li>총 결제 금액 : &nbsp; 100,000</li>
														</ul>

													</div>
												</div>
												<div class="info col-2">
													<a class="button primary fit review_btn">후기 작성</a>
												</div>
										</article>
									</section>
								</div> 	
								
							</body>		

						</div>
					</div>
				</div>

	
			
				



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
		<!-- Footer -->
		<jsp:include page="../common/bottom.jsp"/>
	
</html>