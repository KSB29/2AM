<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>비밀번호 변경</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/changePw.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		<noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
		
	</head>
	<body class="is-preload" >
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
	

				<!-- Menu -->


				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left col-7 center">
											<form action="#" method="POST">
												<article class="changeForm_wrapper col-12">
													<div class="center">
														<h2>비밀번호 변경</h2>
													</div>
													<div class="changeForm_1 fields row">
														<div class="field changePw_box1 col-12">
															<input type="password" name="currentPwd" id="currentPwd" placeholder="현재 비밀번호" required>
														</div>
														<div class="field changePw_box2 col-12">
																<input type="password"name="newPwd"id="newPwd"placeholder="변경할  비밀번호" required>
														</div>
														<div class="field changePw_box2 col-12">						
																<input type="password" name="newPwd2" id="newPwd2" placeholder="변경할 비밀번호 재입력" required>				
														</div>
													</div>
													<div class="changeForm_2 row">
														<div class="col-6">
															<input class="button fit" type="submit" value="변경하기">
														</div>
														<div class="col-6">
															<input class="button primary fit" type="reset" value="취소">
														</div>
													</div>
												</article>
											</form>
									</section>
									<section class="wrapper_right col-5 center change_bg">
									</section>
								</div>
							</div>
						</div>
					</div>		


				<!-- Footer -->



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>