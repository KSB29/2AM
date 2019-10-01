<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>회원 가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/join.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
 		<jsp:include page="../common/top.jsp"/>
 
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">
								<div class="join_form row">
										<section class="join_left col-5 center">
											<div>
												<h2 class="col-12">환영합니다!</h2>
												<p class="col-12">SPLACE의 다양한 혜택을 만나보세요~</p>
											</div>
										</section>
										<section class="join_right col-7">
											<form action="join.sp" method="POST">
												<article class="join_box_1">
													<div class="join_form_box fileds center">
													
														<h2>Join</h2>
														<div class="form_box filed">
															<input type="email" name="memberId" placeholder="이메일" required>
														</div>
														<div class="form_box filed">
															<input type="text" name="memberPwd" placeholder="이메일 인증번호" required>
														</div>
														<div class="form_box filed">
															<input type="text" name="memberName" placeholder="이름" required>
														</div>
														<div class="form_box filed">
															<input type="text" name="memberPhone" placeholder="전화번호 입력" required>
														</div>                                
														<div class="form_box filed">
															<input type="password" name="memberPwd" placeholder="비밀번호" required>
														</div>
														<div class="form_box filed">
															<input type="password" name="memberPwd2" placeholder="비밀번호 확인" required>
														</div>
													</div>
												</article>
												<article class="join_box_2">
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
														<input type="checkbox" class="policy_ck" id="policy3" name="policy_ck" required>
														<label for="policy3">개인정보처리 방침</label>
													</div>
													<div>
														<input type="checkbox" class="policy_ck" id="policy5" name="policy_ck">
														<label for="policy5">이벤트 등 프로모션 알림 메일 수신(선택)</label>
													</div>
												</article>
												<article class="join_box_3 center">
													<button class="button fit">회원가입</button>
												</article>
												   <!-- 클릭 시 이용약관 모달 창 추가 -->
											</form>
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