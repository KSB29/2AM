<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
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
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->

				<!-- Menu -->

				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left welcome_bg col-5 center">
											<form action="#" method="POST">
												<article class="welcome_box col-12">
													<h2>환영합니다.</h2>
													<p>SPLACE의 다양한 혜택을 만나보세요~</p>
												</article>
											</form>
									</section>
									<section class="wrapper_right col-7 change_bg">
									<form action="#" method="POST">
										<article class="join_Form">
													<div class="gjoin_box_1 col-12 center">
														<h2>KAKAO 회원가입</h2> 
													</div>																						
													<div class="join_Form_box row">
															<div class="gjoin_box_2 col-12">
																<input type="text" name="memberName" placeholder="닉네임을 입력하세요." required>
															</div>
															<div class="gjoin_box_3 col-12">
																<input type="email" name="memberId" readonly>
															</div>
													</div>													
													<div class="join_policy_box">
														<div>
															<input type="checkbox" class="policy_ck" id="policy1" name="policy_ck" required>
															<label for="policy1">아래 약관에 모두 동의합니다.</label>
														</div>
														<hr>
														<div>
															<input type="checkbox" class="policy_ck" id="policy2" name="policy_ck" required>
															<label for="policy2">서비스 이용약관(필수)</label>
														</div>
														<div>
															<input type="checkbox" class="policy_ck" id="policy5" name="policy_ck">
															<label for="policy5">이벤트 등 프로모션 알림 메일 수신(선택)</label>
														</div>
													</div>
													   <!-- 클릭 시 이용약관 모달 창 추가 -->
										</article>
									</form>									

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