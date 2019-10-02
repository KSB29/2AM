<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<!-- template -->
	<noscript><link rel="stylesheet" href="${contextPath}/resources/css/noscript.css"></noscript>
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	<!-- css -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/resources/css/fontawesome-all.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
	<!-- 네이버 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
	</head>
	
	<body class="is-preload">
		<!-- Wrapper -->
			
			<jsp:include page="../common/top.jsp"/>
			<div id="wrapper">

				<!-- Header -->

				<!-- Menu -->

				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left welcome_bg col-5 center">
											<form action="njoinForm.jsp" method="POST">
												<article class="welcome_box col-12">
													<h2>환영합니다.</h2>
													<p>SPLACE의 다양한 혜택을 만나보세요~</p>
												</article> 
											</form>
									</section>
									<section class="wrapper_right col-7 change_bg ">
									<form action="#" method="POST">
										<article class="join_Form">
													<div class="gjoin_box_1 col-12 center">
														<h2>네이버로 회원가입</h2> 
													</div>																						
													<div class="join_Form_box row">
															<div class="gjoin_box_2 col-12">
																<input type="text" name="memberName" placeholder="닉네임을 입력하세요." required>
															</div>
															<div class="gjoin_box_3 col-12">
																<input type="email" name="memberId" placeholder="아이디를 입력하세요" readonly>
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
				<jsp:include page="../common/bottom.jsp"/>
				
				
				<!-- 네이버 로그인 -->
 				<script type="text/javascript">
				  var naver_id_login = new naver_id_login("6M93f_6j07ur8krVEjU9", "http://localhost:8080/splace/njoinForm.sp");
				  // 접근 토큰 값 출력
				  alert(naver_id_login.oauthParams.access_token);
				  // 네이버 사용자 프로필 조회
				  naver_id_login.get_naver_userprofile("naverSignInCallback()");
				  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				  function naverSignInCallback() {
				    alert(naver_id_login.getProfileData('email'));
				    alert(naver_id_login.getProfileData('nickname'));
				    alert(naver_id_login.getProfileData('age'));
				  }
			  	</script>  



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	

	</body>
</html>