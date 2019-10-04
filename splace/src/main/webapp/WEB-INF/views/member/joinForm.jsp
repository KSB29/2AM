<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html> 
	<head>
		<title>회원 가입</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/join.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		<%-- <link rel="stylesheet" href="${contextPath}/resources/css/book.css" type="text/css"> --%>
		
		
		<noscript><link rel="stylesheet" href="assets/css/noscript.css"></noscript>
	</head>
	<body class="is-preload">
 		<jsp:include page="../common/top.jsp"/>
 
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">
								<div class="join_form row">
										<section class="join_left col-5">
											<div class="center">
												<h2 class="col-12">환영합니다!</h2>
												<p class="col-12">SPLACE의 다양한 혜택을 만나보세요~</p>
											</div>
										</section>
										<section class="join_right col-7">
											<form action="join.sp" method="POST">
												<article class="join_box_1">
														<h2 class=center>Join</h2>
													<div class="join_form_box fileds">
													
														<div class="form_box  filed">
															<div class="form_btn ">
																<input type="text" class="" id="memberId" name="memberId" placeholder="이메일" required>
																<input type="hidden" id="dupCheck"  name="dupCheck" value=0>
															</div>
															<div class="form_box form_btn">
																<button type="button" id="checkId" class="button fit" autofocus="autofocus">중복 확인</button>
															</div> 
															<div class="guide"></div>
														</div>	
																								
														<div class="form_box filed">
															<div class="form_btn">											
																<input type="text" name="memberPwd" placeholder="이메일 인증번호" required>
															</div>
															<div class="form_box form_btn">
																<button type="button" class="button fit">인증 번호</button>
															</div>
														</div>
														
														<div class="form_box filed">
															<input type="text" class="" id="memberName" name="memberName" placeholder="이름" required>																						
															<span class="noticeSpan"></span>
														</div>
														<div class="form_box filed">
															<input type="text" class="" id="memberPhone" name="memberPhone" placeholder="전화번호 입력" required>
															<span class ="noticeSpan2"> </span>
														</div>                                
														<div class="form_box filed">
															<input type="password" class="" id="memberPwd" name="memberPwd" placeholder="비밀번호(숫자, 문자 포함 8자리 이상 )" required>
															<span class="noticeSpan4"></span>
														</div>
														<div class="form_box filed">
															<input type="password" class="" id="memberPwd2" name="memberPwd2" placeholder="비밀번호 확인" required>
															<span class="noticeSpan5"></span>
														</div>
													</div>													
												</article>
												<article class="join_box_2">
													<div>
														<input type="checkbox" class="policy_ck" id="policy2" name="policy_ck" >
														<label for="policy2"> <a id="policy_modal" href="#exampleModalCenter" data-toggle="modal">서비스 이용약관(필수)</a></label>
													</div>
													<div>
														<input type="checkbox" class="policy_ck" id="policy3" name="policy_ck" required>
														<label for="policy3"> 이벤트 등 프로모션 알림 메일 수신 동의(선택)</label>
													</div>
												</article>
												<article class="join_box_3 center">
													<button id="join_btn" type="submit" class="button fit">회원가입</button>
												</article>
												   <!-- 클릭 시 이용약관 모달 창 추가 -->
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
													<span class="warning">서비스 이용약관 동의는 필수입니다.</span>
												</article>															
															</div>
															<div class="modal_btn_box center">
																<div class="modal_btn">
																	<button type="button" class="button small fit" onclick="javascript:window.reutrnValue" data-dismiss="modal">동의</button>
																</div>
																<div class="modal_btn">
																	<button type="button" class="button small fit primary" data-dismiss="modal">취소</button>											
																</div>
															</div>
														</div>
														</div>
													</div>
											</form>
										</section>
									</div>
								</div>
							</div>
			<!-- Footer -->
			</div>
			<!-- Scripts -->
			<script src="${contextPath}/resources/js/joinForm.js"></script>
			

			<jsp:include page="../common/bottom.jsp"/>


	</body>
</html>