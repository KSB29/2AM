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
						<h1 id="title">공간 예약내역</h1>
						<span id="status"></span>
					</div>
					
					<div class="row">
						<!-- 왼쪽 -->
						<div class="col-8" id="leftCol">

							<div class="col-12 titleBox">
								<h2>예약 내용</h2>
								<div>
									<span>예약번호 : 877624</span>
								</div>
							</div>
							<article>
								<table class="table-wrapper">
									<tr class="waitingTime">
										<td>승인대기기한</td>
										<td>2019.09.09 12:00까지 (기간 내 호스트가 미승인시 예약은 자동 취소됩니다.)</td>
									</tr>
									<tr>
										<td>신청일</td>
										<td>2019.09.11 (수)</td>
									</tr>
									<tr>
										<td>예약공간</td>
										<td><a href="#">더빅스터디, 3층 3번룸</a></td>
									</tr>
									<tr>
										<td>예약날짜</td>
										<td>2019.09.27 (금)</td>
									</tr>
									<tr>
										<td>예약시간</td>
										<td>18시 ~ 21시, ${21-18}</td>
									</tr>
									<tr>
										<td>예약인원</td>
										<td>${3}명</td>
									</tr>
									<tr>
										<td>요청사항</td>
										<td>없음</td>
									</tr>
								</table>
							</article>
							
							<div class="col-12 titleBox">
								<h2>예약자 정보</h2>
							</div>
							<article id="article2">
								<table class="table-wrapper">
									<tr>
										<td>예약명</td>
										<td>나나나</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>000000000</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>dd@naver.com</td>
									</tr>
								</table>
							</article>

							<div class="col-12 titleBox">
								<h2>환불규정 안내</h2>
							</div>
							<article id="article5">
								<table class="table-wrapper">
									<tr>
										<td colspan="2">
											<span class="warning">이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</span>
											<br><span>결제 후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)</span>
										</td>
									</tr>
									<tr>
										<td>이용 7일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 6일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 5일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 4일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 3일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 2일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 전날</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 당일</td>
										<td>총 금액의 100% 환불</td>
									</tr>
								</table>
							</article>

							<div class="col-12 titleBox">
								<h2>더빅스터디</h2>
							</div>
							<article id="article6">
								<div id="spaceInfo">
									<div>
										<p>주소: 서울 중구 남대문로 120</p>
										<p>번호: 010-0000-3333</p>
									</div>
									<button id="directions" class="button fit">길찾기</button>
								</div>
								<div id="map" style="width:100%;height:400px;border:1px solid #585858"></div>
								<!-- 지도 연동 -->
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=703f39fd6324ec678abee0446f28eee5&libraries=services"></script>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										mapOption = {
											center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											level: 3 // 지도의 확대 레벨
										};  
									
									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();
									
									// 주소로 좌표를 검색합니다
									geocoder.addressSearch('서울 중구 남대문로 120', function(result, status) {
									
										// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {
									
											var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									
											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker({
												map: map,
												position: coords
											});
											
											// 길찾기 버튼 클릭시 페이지 이동
											$("#directions").click(function(){
												location.href="https://map.kakao.com/link/to/우리회사,"+coords.getLat()+","+coords.getLng();
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow({
												content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
											});
											infowindow.open(map, marker);
									
											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										} 
									}); 
								</script>
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
										<tr>
											<td>예약인원</td>
											<td>3명</td>
										</tr>
										<tr>
											<td colspan="3" class="btnContainer">
											</td>
										</tr>
									</table>
								</article>
							</div>
						</div>
						<script>
							// 예약대기 - 100
							// 예약승인 - 101
							// 예약취소,결제취소 - 102
							// 예약완료,결제완료 - 103
							// 이용완료(결제) - 104
							var $status = $("#status"); // 상태
							var bookStutus = 103; // book.status자리(100,101,102,103)
							var paymentStutus = 103; // payment.status자리(100,101,102,103)
							var $waitingTime = $(".waitingTime"); // 대기시간
							var titleBox = $("#rightColFloat .titleBox"); // 제목
							var table = $("#rightColFloat .table-wrapper"); // 내용
							var btnContainer = $("#rightColFloat .btnContainer"); // 버튼틀

							var result = "";
							// 예약대기
							if(bookStutus == 100){ 
								$status.html("(승인대기)");
								$waitingTime.html("");
								
								result = "<td>승인대기기한</td>";
									   + "<td></td>";
								$waitingTime.append(result);

							} 
							// 예약승인 
							else if(bookStutus == 101){ 
								$status.html("(결제대기)");
								$waitingTime.html("");
								
								result = "<td>승인대기기한</td>";
									   + "<td></td>";
								$waitingTime.append(result);
								
							} 
							// 예약취소 
							else if(bookStutus == 102){ 
								$status.html("(취소완료)");
								$waitingTime.html("");
								titleBox.html("");
								titleBox.html(
									 "<h2>예약취소</h2>"
								);
								
							} 
							// 예약취소 && 결제취소
							else if(bookStutus == 102 && paymentStutus == 102){ 
								$status.html("(취소완료)");
								$waitingTime.html("");
								titleBox.html("");
								titleBox.html(
									 "<h2>결제취소</h2>"
									+"<div>"
									+"<span>&#8361;12,900</span>"
									+"</div>"
								);
								
							} 
							// 예약완료 && 결제완료
							else if(bookStutus == 103 && paymentStutus == 103){ 
								$status.html("(예약완료)");
								$waitingTime.html("");
								titleBox.html("");
								titleBox.html(
									 "<h2>결제금액</h2>"
									+"<div>"
									+"<span>&#8361;12,900</span>"
									+"</div>"
								);
							} 
							// 예약완료 && 이용완료
							else if(bookStutus == 103 && paymentStutus == 104){ 
								$status.html("(이용완료)");
								$waitingTime.html("");
								titleBox.html("");
								titleBox.html(
									 "<h2>결제금액</h2>"
									+"<div>"
									+"<span>&#8361;12,900</span>"
									+"</div>"
								);
							}
						</script>
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
											<button id="payment" type="submit" class="button small">예약신청</button>
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
	<!-- 결제 연동 -->
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
	<script>
		$("#payment").click(function(){
			//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
			BootPay.request({
				price: '1000', //실제 결제되는 가격
				application_id: "5d7209d802f57e003591d597",
				name: '블링블링 마스카라', //결제창에서 보여질 이름
				pg: 'inicis',
				method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						item_name: '나는 아이템', //상품명
						qty: 1, //수량
						unique: '123', //해당 상품을 구분짓는 primary key
						price: 1000, //상품 단가
						cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
						cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
						cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
					}
				],
				user_info: {
					username: '사용자 이름',
					email: '',
					addr: '사용자 주소',
					phone: '010-1234-4567'
				},
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
					start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
					vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function (data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function (data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function (data) {
				// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				console.log(data);
			}).done(function (data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
			});
		});
	</script>
	<script src="${contextPath}/resources/js/book.js"></script>
</body>
</html>