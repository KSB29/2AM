<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>SPLACE - 구글 로그인</title>
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
	<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/gJoin.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/join.css" type="text/css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
	</head>
	
	<body class="is-preload">
		<!-- Wrapper -->
			
			<jsp:include page="../common/top.jsp"/>
			<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->

				<!-- Menu -->

				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left welcome_bg col-5 center">
												<article class="welcome_box col-12">
													<h2>환영합니다.</h2>
													<p>SPLACE의 다양한 혜택을 만나보세요</p>
												</article>
									</section>
									<section class="wrapper_right col-7 change_bg">
										<form action="gjoin.sp" method="POST">
											<article class="join_Form">
												<div class="gjoin_box_1 col-12 center">
													<h2>GOOGLE 회원가입</h2> 
												</div>																						
												<div class="join_Form_box row">
													<div class="gjoin_box col-12">
														<input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요" required>
													</div>				
													<div class="gjoin_box col-12">
														<input type="email" id="memberId" name="memberId" value="${memberId}" readonly>
														<input type="hidden" id="memberPwd" name="memberPwd" value="google123" >
														<input type="hidden" id="memberSocial" name="memberSocial" value="구글" >						
													</div>
													
													<div class="gjoin_box col-12">
														<input type="text" id="memberPhone" name="memberPhone" required> 
														<span class="guide"></span>
													</div>
												</div>													
												<div class="join_policy_box">
													<div>
														<input type="checkbox" class="policy_ck" id="policy2" name="policy_ck" disabled >
														<label for="policy2"> <a id="policy_modal" href="#exampleModalCenter" data-toggle="modal" >서비스 이용약관(필수)</a></label>
													</div>
													<div>
														<input type="checkbox" class="policy_ck" id="memberAgree" name="memberAgree" value="N" >
														<label for="memberAgree"> 이벤트 등 프로모션 알림 메일 수신 동의(선택)</label>
													</div>
												</div>
												<div>
													<button type="submit" id="join_btn" class="button fit">회원가입</button>
												</div> 
											</article>
										</form>									
									</section>
									
								   <!-- Modal-->
									<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header modal_title">
												<h2 class="modal-title center" id="exampleModalCenterTitle" >서비스 이용 약관 동의</h2>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
									<div class="col-12 titleBox">
									<div>
										<span>
											<input type="checkbox" id="all">
											<label for="all">전체 동의</label>
										</span>
									</div>
								</div>									
							<article id="article6">
									<table class="table-wrapper">
										<tr>
											<td>
												<input type="checkbox" id="check1">
												<label for="check1">위 공간의 예약조건 확인 및 결제진행 동의 <span class="warning">(필수)</span></label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" id="check2">
												<label for="check2">개인정보 제3자 제공 동의 <span class="warning">(필수)</span></label>
												<button class="button primary small buttonToggle" type="button" data-toggle="collapse" data-target="#check1Content" aria-expanded="false" aria-controls="check1Content">.</button>
												<div class="collapse" id="check1Content">
													<div class="card card-body">
														<textarea class="checkTerm" rows="5" readonly>
															1. 개인정보를 제공받는 자: 해당 공간의 호스트
															2. 제공하는 개인정보 항목
															- 필수항목: 네이버 아이디, 이름, 연락처, 결제정보(결제방식 및 결제금액)
															- 선택항목: 이메일 주소
															3. 개인정보의 제공목적: 공간예약 및 이용 서비스 제공, 환불처리
															4. 개인정보의 제공기간: 서비스 제공기간(단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우에는 해당 기간 동안 보관합니다.)
															5. 개인정보의 제공을 거부할 권리: 개인정보 주체는 개인정보의 제공을 거부할 권리가 있으나, 공간 예약을 위해 반드시 필요한 개인정보의 제공으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.
														</textarea>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" id="check3">
												<label for="check3">개인정보 수집 및 이용 동의 <span class="warning">(필수)</span></label>
												<button class="button primary small buttonToggle" type="button" data-toggle="collapse" data-target="#check2Content" aria-expanded="false" aria-controls="check2Content">.</button>
												<div class="collapse" id="check2Content">
													<div class="card card-body">
														<textarea class="checkTerm" rows="5" readonly>
															1. 수집하는 개인정보의 항목
															- 예약정보(성명, 이메일주소, 휴대전화번호), 결제정보(신용카드 번호 및 은행계좌정보 일부 등)
															
															2. 개인정보의 이용목적
															- 공간 예약 및 이용
															
															3. 개인정보의 보관기간
															- 예약 완료 후 관련 법령에 따라 5년간 개인정보를 보관합니다.
															
															4. 개인정보의 수집 및 이용을 거부할 권리
															- 개인정보 주체는 개인정보의 수집 및 이용을 거부할 권리가 있으나, 공간 예약을 위한 최소한의 개인정보 수집으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.
														</textarea>
													</div>
												</div>
											</td>
										</tr>
									</table>
									<span id="warning" class="warning" ></span>
								</article>															
											</div>
											<div class="modal_btn_box center">
												<div class="modal_btn">
													<button type="button" id="agree" class="button small fit" data-dismiss="modal" >동의</button>
												</div>
												<div class="modal_btn">
													<button type="button" class="button small fit primary" data-dismiss="modal">취소</button>											
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>									
				</div>

				<!-- scirpt -->
				<script src="${contextPath}/resources/js/joinForm.js" ></script>


				<!-- Footer -->
				<jsp:include page="../common/bottom.jsp"/>
			


	</body>
</html>