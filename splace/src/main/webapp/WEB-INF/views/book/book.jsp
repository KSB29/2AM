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
	<div id="wrapper">
		<jsp:include page="../../../WEB-INF/views/common/top.jsp"/>
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
										<td rowspan="2"></td>
										<td><h2>더빅스터디, 3층 3번룸</h2></td>
									</tr>
									<tr>
										<td>
											3-6인 스터디룸으로 회의 및 스터디로 쾌적한 공간입니다.
										</td>
									</tr>
									<tr>
										<td><li>공간유형</li></td>
										<td>회의실, 스터디룸</td>
									</tr>
									<tr>
										<td><li>예약인원</li></td>
										<td>최소 3명 ~ 최대 6명</td>
									</tr>
									<tr>
										<td colspan="2">
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
								<span>호스트 승인 후 결제가 가능합니다.</span>
							</article>

							<div class="col-12 titleBox">
								<h2>예약자 정보</h2>
								<div>
									<span class="warning">*필수입력</span>
								</div>
							</div>
							<article id="article3">
								<form action="#" method="POST">
									<table class="table-wrapper">
										<tr>
											<td>예약자*</td>
											<td><input type="text" name="" id=""></td>
										</tr>
										<tr>
											<td>연락처*</td>
											<td>
												<div class="col-3">
													<div class="default-select" id="default-select">
														<select>
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
												<input type="text" name="" id="" size="4" maxlength="4">
												</div>
												&nbsp;&nbsp;-&nbsp;&nbsp;
												<div class="col-3">
												<input type="text" name="" id="" size="4" maxlength="4">
												</div>
											</td>
										</tr>
										<tr>
											<td>이메일*</td>
											<td><input type="email" name="" id=""></td>
										</tr>
										<tr>
											<td>요청사항</td>
											<td>
												<textarea name="demo-message" id="demo-message" placeholder="요청사항을 적어주세요!" rows="3"></textarea>
											</td>
										</tr>
									</table>
									<span>예약자 정보로 이메일이 발송됩니다. 정확한 정보인지 확인해주세요.</span>
								</form>
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
								<span>
									<input type="checkbox" id="all">
									<label for="all"></label>
								</span>
							</div>
							<article>
								<table class="table-wrapper">
									<tr>
										<td>
											<input type="checkbox" id="check1">
											<label for="check1">위 공간의 예약조건 확인 및 결제진행 동의<span class="war"></span></label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="check2">
											<label for="check2"></label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" id="check3">
											<label for="check3"></label>
										</td>
									</tr>
								</table>
							</article>
						</div>


						<!-- 오른쪽 -->
						<div class="col-4" id="rightCol">
							<div class="col-12 titleBox">
								<h2>결제 예정금액</h2>
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
									<tr>
										<td>예약인원</td>
										<td>3명</td>
									</tr>
									<tr>
										<td colspan="2">&#8361;</td>
										<td>12,900</td>
									</tr>
									<tr>
										<td colspan="3">
											<button class="button primary fit">예약신청</button>
										</td>
									</tr>
								</table>
							</article>
						</div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>