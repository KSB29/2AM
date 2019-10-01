<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPLACE</title>
<link rel="stylesheet" href="${contextPath}/resources/css/book.css" type="text/css">
</head>
<body>
	<c:if test="${empty sessionScope.loginUser}">
		<c:set var="msg" value="로그인 해주세요!" scope="session" />
		<c:redirect url="/"/>
	</c:if>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<jsp:include page="../../../WEB-INF/views/common/top.jsp"/>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->
				<section>
					<div class="row titleBox" id="titleBox1">
						<h1 id="title">공간 예약</h1>
					</div>
					
					<div class="row">
						<!-- 왼쪽 -->
						<div class="col-8" id="leftCol">

							<div class="col-12 titleBox">
								<h2>예약 공간</h2>
								<div>
									<span>&#8361;12,900</span><span>/시간(인)</span>
								</div>
							</div>
							<article>
								<table class="table-wrapper">
									<tr>
										<td rowspan="4" id="imgBox">
											<img alt="공간대표사진" src="${contextPath }/resources/img/back03.jpg">
										</td>
										<td colspan="2"><h2>더빅스터디, 3층 3번룸</h2></td>
									</tr>
									<tr>
										<td colspan="3">3-6인 스터디룸으로 회의 및 스터디로 쾌적한 공간입니다.</td>
									</tr>
									<tr>
										<td><li>공간유형</li></td>
										<td colspan="2">회의실, 스터디룸</td>
									</tr>
									<tr>
										<td><li>예약인원</li></td>
										<td colspan="2">최소 3명 ~ 최대 6명</td>
									</tr>
									<tr>
										<td colspan="3">
											<span>금연</span>
											<span>화이트보드</span>
											<span>인터넷/WIFI</span>
										</td>
									</tr>
								</table>
							</article>
							
							<div class="col-12 titleBox">
								<h2>예약 정보</h2>
							</div>
							<article id="article2">
								<table class="table-wrapper">
									<tr>
										<td>예약날짜</td>
										<td>2019.10.04 (금) 18시 ~ 21시</td>
									</tr>
									<tr>
										<td>예약인원</td>
										<td>3명</td>
									</tr>
								</table>
								<span><i class="fas fa-exclamation-circle"></i> 호스트 승인 후 결제가 가능합니다.</span>
							</article>

							<div class="col-12 titleBox">
								<h2>예약자 정보</h2>
								<div>
									<span class="warning">*필수입력</span>
								</div>
							</div>
							<article id="article3">
								<table class="table-wrapper">
									<tr>
										<td>예약자*</td>
										<td>
											<input type="text" id="bookerI" placeholder="2글자이상 5글자 이내 한글로 작성해주세요!">
											<span class="noticeSpan"></span>
										</td>
									</tr>
									<tr>
										<td>연락처*</td>
										<td>
											<div class="col-3">
												<div class="default-select" id="default-select">
													<select name="bookerPhone1" id="bookerPhone1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>
												</div>
											</div>
											&nbsp;&nbsp;-&nbsp;&nbsp;
											<div class="col-3">
												<input type="text" id="bookerPhone2" size="4" maxlength="4" required>
											</div>
											&nbsp;&nbsp;-&nbsp;&nbsp;
											<div class="col-3">
												<input type="text" id="bookerPhone3" size="4" maxlength="4" required>
											</div><br>
											<span class="noticeSpan2"></span>
										</td>
									</tr>
									<tr>
										<td>이메일*</td>
										<td>
											<input type="email" id="bookerEmailI">
											<span class="noticeSpan3"></span>
										</td>
									</tr>
									<tr>
										<td>요청사항</td>
										<td>
											<textarea id="bookRequestI" placeholder="요청사항을 적어주세요! (100자 이내)" maxlength="100" rows="3"></textarea>
										</td>
									</tr>
								</table>
								<span><i class="fas fa-exclamation-circle"></i> 예약자 정보로 이메일이 발송됩니다. 정확한 정보인지 확인해주세요.</span>
							</article>

							<div class="col-12 titleBox">
								<h2>호스트 정보</h2>
							</div>
							<article id="article4">
								<table class="table-wrapper">
									<tr>
										<td>공간상호</td>
										<td>더빅스터디</td>
									</tr>
									<tr>
										<td>대표자명</td>
										<td>정주헌</td>
									</tr>
									<tr>
										<td>소재지</td>
										<td>서울특별시 종로구 관철동 7-16 번지 2,3층 더빅스터디</td>
									</tr>
									<tr>
										<td>사업자번호</td>
										<td>0000000000</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>000-0000-0000 / og@namver.com</td>
									</tr>
								</table>
							</article>

							<div class="col-12 titleBox">
								<h2>예약시 주의사항</h2>
							</div>
							<article id="article5">
								<table class="table-wrapper">
									<tr>
										<td>
											<li>요금은 예약된 시간을 기준으로 정산합니다.</li>
										</td>
									</tr>
									<tr>
										<td>
											<li>요금은 예약된 시간을 기준으로 정산합니다.</li>
										</td>
									</tr>
									<tr>
										<td>
											<li>요금은 예약된 시간을 기준으로 정산합니다.</li>
										</td>
									</tr>
									<tr>
										<td>
											<li>요금은 예약된 시간을 기준으로 정산합니다.</li>
										</td>
									</tr>
									<tr>
										<td>
											<li>요금은 예약된 시간을 기준으로 정산합니다.</li>
										</td>
									</tr>
								</table>
							</article>

							<div class="col-12 titleBox">
								<h2>서비스 동의</h2>
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
								<span class="warning"><i class="fas fa-exclamation-circle"></i> 서비스 이용약관 동의는 필수입니다.</span>
							</article>
						</div>

						<!-- 오른쪽 -->
						<div class="col-4" id="rightCol">
							<div id="rightColFloat" class="rightColFloat">
								<div class="col-12 titleBox">
									<h2>결제 예정금액</h2>
									<div>
										<span>&#8361;12,900</span>
									</div>
								</div>
								<article>
									<table class="table-wrapper">
										<tr>
											<td>예약날짜</td>
											<td>2019.10.04 (금)</td>
											<td rowspan="3">&#8361;12,900</td>
										</tr>
										<tr>
											<td>예약시간</td>
											<td>18시 ~ 21시, 3시간</td>
										</tr>
										<tr class="borderBottom2">
											<td>예약인원</td>
											<td>3명</td>
										</tr>
										<tr>
											<td colspan="3">
												<button type="button" class="button fit" onclick="history.back();">취소</button>
												<button type="button" class="button primary fit" id="regExpCheck" data-toggle="modal" data-target="#bookConfirm" onclick="bookerCheck();">예약신청</button>
											</td>
										</tr>
									</table>
								</article>
							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="bookConfirm" tabindex="-1" role="dialog" aria-labelledby="bookConfirmTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="bookConfirmTitle">예약신청</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<c:url var="bookList" value="bookList.sp" />
									<form action="${bookList}" method="post">
										<div class="modal-body">
											<h2>예약 내용을 확인해주세요.</h2>
											<table class="table-wrapper">
												<tr>
													<td>예약공간</td>
													<td><input type="text" name="spaceId" id="spaceId" value="더빅스터디, 3층 3번룸" readonly></td>
												</tr>
												<tr>
													<td>예약날짜</td>
													<td><input type="text" name="bookDate" id="bookDate" value="2019.10.04 (금)" readonly></td>
												</tr>
												<tr>
													<td>예약시간</td>
													<td>
														<input type="text" name="last-child" id="bookStartTime" value="18" readonly> ~ 
														<input type="text" name="bookEndTime" id="bookEndTime" value="21" readonly> 
														, <span>(${21-18}시간)</span>
													</td>
												</tr>
												<tr>
													<td>예약인원</td>
													<td><input type="text" name="bookPer" id="bookPer" value="3" readonly>명</td>
												</tr>
												<tr>
													<td>예약자</td>
													<td><input type="text" name="booker" id="booker" readonly></td>
												</tr>
												<tr>
													<td>연락처</td>
													<td><input type="text" name="bookerPhone" id="bookerPhone" readonly></td>
												</tr>
												<tr>
													<td>이메일</td>
													<td><input type="text" name="bookerEmail" id="bookerEmail" readonly></td>
												</tr>
												<tr>
													<td>요청사항</td>
													<td>
														<textarea name="bookRequest" id="bookRequest" readonly></textarea>
													</td>
												</tr>
												<tr>
													<td>결제예정금액</td>
													<td>&#8361;<input type="text" name="totalPrice" id="totalPrice" readonly></td>
												</tr>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="button small primary" data-dismiss="modal">취소</button>
											<button type="submit" class="button small">예약신청</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
	
	<script src="${contextPath}/resources/js/book.js"></script>
</body>
</html>