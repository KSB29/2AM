<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<c:redirect url="/loginForm.sp"/>
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
					<div class="row titleBox bookDetailTitleBox" id="titleBox1">
						<h1 id="title">공간 예약내역</h1>
						<span id="status"></span>
						<a href="javascript:history.back();">목록으로</a>
					</div>
					
					<div class="row">
						<!-- 왼쪽 -->
						<div class="col-8" id="leftCol">

							<div class="col-12 titleBox">
								<h2>예약 내용</h2>
								<div>
									<span>예약번호 : ${book.bookId}</span>
								</div>
							</div>
							<article>
								<table class="table-wrapper bookDetailTable">
									<tr class="waitingTime">
										<td>승인대기기한</td>
										<td><fmt:formatDate value="${book.bookEnroll}" pattern="yyyy.MM.dd (E)"/>까지 (기간 내 호스트가 미승인시 예약은 자동 취소됩니다.)</td>
									</tr>
									<tr>
										<td>신청일</td>
										<td><fmt:formatDate value="${book.bookEnroll}" pattern="yyyy.MM.dd (E)"/></td>
									</tr>
									<tr>
										<td>예약공간</td>
										<td><a href="#">${book.spaceName }</a></td>
									</tr>
									<tr>
										<td>예약날짜</td>
										<td><fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd (E)"/></td>
									</tr>
									<tr>
										<td>예약시간</td>
										<td>${book.bookStartTime}시 ~ ${book.bookEndTime}시, ${book.bookEndTime-book.bookStartTime}시간</td>
									</tr>
									<tr>
										<td>예약인원</td>
										<td>${book.bookPer}명</td>
									</tr>
									<tr>
										<td>요청사항</td>
										<td>${book.bookRequest }</td>
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
										<td>${book.booker }</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>${book.bookerPhone }</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${book.bookerEmail }</td>
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
											<span class="warning"><i class="fas fa-exclamation-circle"></i> 이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</span>
										</td>
									</tr>
									<tr>
										<td>이용 2일 전</td>
										<td>총 금액의 100% 환불</td>
									</tr>
									<tr>
										<td>이용 전날</td>
										<td>총 금액의 50% 환불</td>
									</tr>
									<tr>
										<td>이용 당일</td>
										<td>환불 불가</td>
									</tr>
								</table>
							</article>

							<div class="col-12 titleBox">
								<h2>${book.spaceName }</h2>
							</div>
							<article id="article6">
								<div id="spaceInfo">
									<div>
										<c:forTokens items="${book.spaceAddress }" delims="," varStatus="status" var="addr">
										<c:if test="${status.index eq 1 }">
											<p>주소: ${addr}</p>										
										</c:if>
										</c:forTokens>
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
									<c:forTokens items="${book.spaceAddress }" delims="," varStatus="status" var="addr">
									<c:if test="${status.index eq 1 }">										
										geocoder.addressSearch('${addr}', function(result, status) {
									</c:if>
									</c:forTokens>
									
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
												location.href="https://map.kakao.com/link/to/${book.spaceName},"+coords.getLat()+","+coords.getLng();
											});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow({
												content: '<div style="width:150px;text-align:center;padding:6px 0;">${book.spaceName}</div>'
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
							<div id="rightColFloat" class="rightColFloat bookDetailRightCol">
								<div class="col-12 titleBox">
									<h2>결제 예정금액</h2>
									<div>
										<span><fmt:formatNumber value="${book.bookPrice }" type="currency"/></span>
									</div>
								</div>
								<article>
									<table class="table-wrapper">
										<tr>
											<td>예약날짜</td>
											<td><fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd (E)"/></td>
											<td rowspan="3"><fmt:formatNumber value="${book.bookPrice }" type="currency"/></td>
										</tr>
										<tr>
											<td>예약시간</td>
											<td>${book.bookStartTime}시 ~ ${book.bookEndTime}시, ${book.bookEndTime-book.bookStartTime}시간</td>
										</tr>
										<tr class="borderBottom2">
											<td>예약인원</td>
											<td>${book.bookPer}명</td>
										</tr>
										<tr>
											<td colspan="3" class="btnContainer">
											</td>
										</tr>
									</table>
								</article>
							</div>
						</div>
						<!-- Modal -->
						<article id="modalContainer">
							<div class="modal fade" id="bookCancel" tabindex="-1" role="dialog" aria-labelledby="bookCancelTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="bookCancelTitle">예약취소</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form action="${bookCancel}" method="post" id="modalForm">
											<div class="modal-body">
												<h2>예약을 취소하시겠습니까?</h2>
												<table class="table-wrapper">
													<tr>
														<td>예약공간</td>
														<td><input type="text" name="spaceId" id="spaceId" value="${book.spaceName }" readonly></td>
													</tr>
													<tr>
														<td>예약날짜</td>
														<td><input type="text" name="bookDate" id="bookDate" value="<fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd (E)"/>" readonly></td>
													</tr>
													<tr>
														<td>예약시간</td>
														<td>
															<input type="text" name="last-child" id="bookStartTime" value="${book.bookStartTime}" readonly> ~ 
															<input type="text" name="bookEndTime" id="bookEndTime" value="${book.bookEndTime}" readonly> 
															, <span>(${book.bookEndTime-book.bookStartTime}시간)</span>
														</td>
													</tr>
													<tr>
														<td>예약인원</td>
														<td><input type="text" name="bookPer" id="bookPer" value="${book.bookPer }" readonly>명</td>
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
						</article>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../../WEB-INF/views/common/bottom.jsp"/>
	</div>
	<c:url var="bookCancel" value="bookCancel.sp" />
	<c:url var="payment" value="payment.sp" />
	<c:url var="paymentCancel" value="paymentCancel.sp" />
	<c:url var="reviewForm" value="reviewForm.sp" />
	<script>
		// 예약대기 - 100
		// 예약승인 - 101
		// 예약취소,결제취소 - 102
		// 예약완료,결제완료 - 103
		// 이용완료(결제) - 104
		var bookStatus = ${book.statusId}; // book.status자리(100,101,102,103)
		var paymentStatus = ${book.pStatusId}; // payment.status자리(100,101,102,103)
		console.log("b: "+bookStatus+", p: "+paymentStatus);
		var $status = $("#status"); // 페이지제목(상태)
		var $waitingTime = $(".waitingTime"); // 대기시간
		var titleBox = $(".bookDetailRightCol .titleBox"); // 제목
		var table = $(".bookDetailRightCol .table-wrapper"); // 내용
		var btnContainer = $(".bookDetailRightCol .btnContainer"); // 버튼틀
		// modal
		var modalContainer = $("#modalContainer");
		var modal = $("#modalContainer .modal");
		var modalTitle = $("#modalContainer .modal-title");
		var modalForm = $("#modalContainer #modalForm");
		var modalBodyTitle = $(".modal-body h2");
		var modalBody = $("#modalContainer .modal-body table");
		var modalBtn = $("#modalContainer .modal-footer button:last-child");

		var result = "";
		if("${book.paymentType}" == "card"){var pType = "카드결제"}
		// 예약대기
		if(bookStatus == 100){ 
			$status.html("(승인대기)");
			$waitingTime.html("");
			
			result = "<td>승인대기기한</td>"
					+ "<td><fmt:formatDate value='${deadline}' type='date' pattern='yyyy.MM.dd (E)'/>까지 (기간 내 호스트가 미승인시 예약은 자동 취소됩니다.)</td>";
			$waitingTime.append(result);
			btnContainer.html("<button class='button primary fit-100' data-toggle='modal' data-target='#bookCancel'>예약취소</button>");
			modalTitle.attr("id", "bookCancelTitle");
			modalForm.attr("action", "${bookCancel}?bookId=${book.bookId}");
			modalBodyTitle.text("예약을 취소하시겠습니까?");
			modalBody.html("");
			modalBtn.html("예약취소");
		} 
		// 예약승인 
		else if(bookStatus == 101){ 
			$status.html("(결제대기)");
			$waitingTime.html("");
			result = "<td>결제대기기한</td>"
					+ "<td><fmt:formatDate value='${deadline}' type='date' pattern='yyyy.MM.dd (E)'/>까지 (기간 내 호스트가 미승인시 예약은 자동 취소됩니다.)</td>";
			$waitingTime.append(result);
			titleBox.html("");
			titleBox.html(
					"<h2>결제예정금액</h2>"
				+"<div>"
				+"<span><fmt:formatNumber value='${book.bookPrice }' type='currency'/></span>"
				+"</div>"
			);
			btnContainer.append("<button type='button' class='button fit' data-toggle='modal' data-target='#bookCancel'>예약취소</button>");
			btnContainer.append("<button type='button' class='button primary fit' data-toggle='modal' data-target='#paymentForm'>결제</button>");
			modalTitle.attr("id", "bookCancelTitle");
			modalForm.attr("action", "${bookCancel}?bookId=${book.bookId}");
			modalBodyTitle.text("예약을 취소하시겠습니까?");
			modalBody.html("");
			modalBtn.html("예약취소");
			modalContainer.append(
					'<div class="modal fade" id="paymentForm" tabindex="-1" role="dialog" aria-labelledby="paymentFormTitle" aria-hidden="true">'
				+ '<div class="modal-dialog modal-dialog-centered" role="document">'
				+ '<div class="modal-content">'
				+ '<div class="modal-header">'
				+ '<h5 class="modal-title" id="paymentFormTitle">예약취소</h5>'
				+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
				+ '<span aria-hidden="true">&times;</span>'
				+ '</button>'
				+ '</div>'
				+ '<form action="${payment}" method="post" id="modalForm">'
				+ '<input type="hidden" name="paymentId">'
				+ '<input type="hidden" name="paymentType">'
				+ '<input type="hidden" name="bookId">'
				+ '<input type="hidden" name="receiptId">'
				+ '<div class="modal-body">'
				+ '<h2>결제하시겠습니까?</h2>'
				+ '<table class="table-wrapper">'
				+ '<tr>'
				+ '<td>예약공간</td>'
				+ '<td>${book.spaceName}</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td>예약날짜</td>'
				+ '<td>'
				+ '<fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd (E)"/>'
				+ '</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td>예약시간</td>'
				+ '<td>'
				+ '${book.bookStartTime} ~ '
				+ '${book.bookEndTime}'
				+ ', <span>(${book.bookEndTime-book.bookStartTime}시간)</span>'
				+ '</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td>예약인원</td>'
				+ '<td>${book.bookPer}명</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td>결제예정금액</td>'
				+ '<td><fmt:formatNumber value="${book.bookPrice }" type="currency"/></td>'
				+ '</tr>'
				+ '</table>'
				+ '<span class="warning"><i class="fas fa-exclamation-circle"></i> 결제 전에, 환불기준과 예약내용을 반드시 확인해주세요!</span>'
				+ '</div>'
				+ '<div class="modal-footer">'
				+ '<button type="button" class="button small primary" data-dismiss="modal">취소</button>'
				+ '<button type="button" class="button small" id="payment">결제하기</button>'
				+ '</div>'
				+ '</form>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
			);
		} 
		// 예약완료 && 결제완료
		else if(bookStatus == 103 && paymentStatus == 103){ 
			$status.html("(예약완료)");
			$waitingTime.html("");
			titleBox.html("");
			titleBox.html(
					"<h2>결제금액</h2>"
				+"<div>"
				+"<span><fmt:formatNumber value='${book.bookPrice }' type='currency'/></span>"
				+"</div>"
			);
			$("#rightCol article table tr:first-child td:nth-child(3)").css("border","0");
			$(".bookDetailRightCol table tbody tr:nth-child(3)").removeClass("borderBottom2");
			$(".bookDetailRightCol table tbody tr:last-child").before("<tr class='borderBottom2'><td>결제정보</td><td>"+pType+"</td></tr>");
			btnContainer.html("<button class='button primary fit-100' data-toggle='modal' data-target='#paymentCancel'>예약취소</button>");
			modal.attr("id", "paymentCancel").attr("aria-labelledby", "paymentCancelTitle");
			modalTitle.attr("id", "paymentCancelTitle");
			modalForm.attr("action", "${paymentCancel}?bookId=${book.bookId}&receiptId=${book.receiptId}&price=${book.paymentCancelPrice}");
			modalBodyTitle.text("예약을 취소하시겠습니까?");
			modalBody.html("");
			modalBody.html(
					"<tbody>"
				+ "<tr><td>결제금액</td><td><fmt:formatNumber value='${book.bookPrice }' type='currency'/></td></tr>"
				+ "<tr><td>환불금액</td><td class='refund'><fmt:formatNumber value='${book.paymentCancelPrice }' type='currency'/></td></tr>"
				+ "</tbody>"
			);
			modalBtn.html("예약취소");

		} 
		// 예약취소 && 결제취소
		else if(bookStatus == 102 && paymentStatus == 102){ 
			$status.html("(취소완료)");
			$waitingTime.html("");
			titleBox.html("");
			titleBox.html(
					"<h2>환불 금액</h2>"
				+"<div>"
				+"<span><fmt:formatNumber value='${book.paymentCancelPrice }' type='currency'/></span>"
				+"</div>"
			);
			table.html("");
			table.html(
					"<tbody>"
				+ "<tr><td>취소날짜</td><td><fmt:formatDate value='${book.bookCancel}' pattern='yyyy.MM.dd (E)'/></td></tr>"
				+ "<tr><td>결제금액</td>"
				+ "<td><fmt:formatNumber value='${book.bookPrice }' type='currency'/></td></tr>"
				+ "<tr><td>환불금액</td>"
				+ "<td><fmt:formatNumber value='${book.paymentCancelPrice }' type='currency'/></td></tr>"
				+ "<tr class='borderBottom2'><td>결제정보</td>"
				+ "<td>"+pType+"</td></tr>"
				+ "<tr><td colspan='2' class='btnContainer'>"
				+ "<div class='fit-100'>예약 취소가 완료되었습니다.</div>"
				+ "</td></tr></tbody>"
			);
			modalContainer.html("");
		} 
		// 예약완료 && 이용완료
		else if(bookStatus == 103 && paymentStatus == 104){ 
			$status.html("(이용완료)");
			$waitingTime.html("");
			titleBox.html("");
			titleBox.html(
					"<h2>결제금액</h2>"
				+"<div>"
				+"<span><fmt:formatNumber value='${book.bookPrice }' type='currency'/></span>"
				+"</div>"
			);
			$("#rightCol article table tr:first-child td:nth-child(3)").css("border","0");
			$(".bookDetailRightCol table tbody tr:nth-child(3)").removeClass("borderBottom2");
			table.find("tr:last-child").before(
					"<tr class='borderBottom2'><td>결제정보</td>"
				+"<td>"+pType+"</td></tr>"
			);
			btnContainer.append("<div class='fit-100'>공간 이용이 완료되었습니다.</div>");
			modalContainer.html("");
		}
		// 예약취소 
		else if(bookStatus == 102){ 
			$status.html("(취소완료)");
			$waitingTime.html("");
			titleBox.html("");
			titleBox.html("<h2>예약취소</h2>");
			table.html("");
			table.html(
					"<tr><td>취소날짜</td><td><fmt:formatDate value='${book.bookCancel}' pattern='yyyy.MM.dd (E)'/></td></tr>"
				+"<tr><td colspan='2' class='btnContainer'>"
				+"<div class='fit-100'>예약 취소가 완료되었습니다.</div>"
				+"</td></tr>"
			);
			table.children("tr:last-child").css("border-top","2px solid #4c74b9");
			modalContainer.html("");
		}
	</script>
	<!-- 결제 연동 -->
	<script>
		// 결제API--------------------------------
		// 난독화;
		eval(function(p,a,c,k,e,r){e=String;if(!''.replace(/^/,String)){while(c--)r[c]=k[c]||c;k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('0 1="2";',3,3,'var|aid|5d7209d802f57e003591d597'.split('|'),0,{}))
		
		$("#payment").click(function(){
		    //실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
		    BootPay.request({
		        price: '1000', //실제 결제되는 가격
		        application_id: aid,
		        name: '${book.spaceName}', //결제창에서 보여질 이름
		        pg: 'inicis',
		        method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		        show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		        items: [
		            {
		                item_name: '${book.spaceName}', //상품명
		                qty: 1, //수량
		                unique: '${book.spaceId}', //해당 상품을 구분짓는 primary key
		                price: 1000, //상품 단가
		                cat1: '${book.typeName}', // 대표 상품의 카테고리 상, 50글자 이내
		                cat2: '${book.spaceName}'
		            }
		        ],
		        user_info: {
		            username: '사용자 이름',
		            email: '${book.memberId}',
		            addr: '사용자 주소',
		            phone: '010-1234-4567'
		        },
		        order_id: '${paymentId}', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		        params: {
		            callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'
		        },
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
		        //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.]
		        $("input[name='paymentId']").val("${paymentId}");
		        $("input[name='paymentType']").val(data.method);
		        $("input[name='bookId']").val("${book.bookId}");
		        $("input[name='receiptId']").val(data.receipt_id);
		        $("#paymentForm form").submit();
		        console.log(data);
		    });
		});
	</script>
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
	<script src="${contextPath}/resources/js/book.js"></script>
</body>
</html>