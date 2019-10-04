<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/host.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>가격 정보</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section>
					<h1 class="align-center">가격 정보</h1>	
					<form method="post" action="spacePriceInsert.sp">
						<h2>1. 환불규정</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">해당 기준에 의해 환불 처리됩니다.</span>
							</div>
							<div class="col-1 col-12-xsmall noticeDiv">
							</div>
							<div class="col-2 col-12-xsmall noticeDiv">
								<label>이용 2일 전</label>
							</div>
							<div class="col-9 col-12-xsmall noticeDiv">
								<span>총 금액의 100% 환불</span>
							</div>
							<div class="col-1 col-12-xsmall noticeDiv">
							</div>
							<div class="col-2 col-12-xsmall noticeDiv">
								<label>이용 전날</label>
							</div>
							<div class="col-9 col-12-xsmall noticeDiv">
								<span>총 금액의 50% 환불</span>
							</div>
							<div class="col-1 col-12-xsmall noticeDiv">
							</div>
							<div class="col-2 col-12-xsmall noticeDiv">
								<label>이용 당일</label>
							</div>
							<div class="col-9 col-12-xsmall noticeDiv">
								<span>환불 불가</span>
							</div>
						</div>
						<br><br>
						<h2>2. 가격정보</h2>
						<div class="row gtr-uniform borderTop">
							<div class="col-12 col-12-xsmall">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">요일을 선택하신 후 금액을 입력해주세요.</span>
							</div>
							<div class="col-12 col-12-xsmall" id="dayArea">
								<input type="radio" name="day" id="day1" value="day1" checked>
								<label for="day1">월요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day2" value="day2">
								<label for="day2">화요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day3" value="day3">
								<label for="day3">수요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day4" value="day4">
								<label for="day4">목요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day5" value="day5">
								<label for="day5">금요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day6" value="day6">
								<label for="day6">토요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day7" value="day7">
								<label for="day7">일요일&nbsp;&nbsp;</label>
								<input type="radio" name="day" id="day8" value="day8">
								<label for="day8">공휴일&nbsp;&nbsp;</label>
							</div>
							<c:set var="spaceOpen" value="9"/>
							<c:set var="spaceClose" value="21"/>
							<div class="col-2 col-12-xsmall noticeDiv">
								<span class="labelText">운영 시간 </span>
							</div>
							<div class="col-10 col-12-xsmall noticeDiv">
								<span>${ spaceOpen } 시 ~ ${ spaceClose } 시</span>
							</div>
							<div class="col-2 col-12-xsmall">
								<span class="labelText" id="dayText"></span>
							</div>
							<div class="col-2 col-12-xsmall">
								<input type="number" name="inputPrice" id="inputPrice" min="1" class="align-right">
							</div>
							<div class="col-1 col-12-xsmall">
								<input type="button" id="insertBtn" class="button primary small" value="모두 입력">
							</div>
							<div class="col-1 col-12-xsmall">
								<input type="button" id="clearBtn" class="button small" value="입력 취소">
							</div>
							<div class="col-6 col-12-xsmall">
							</div>
							<div class="col-12 col-12-xsmall noticeDiv">
								<i class="fas fa-exclamation-circle noticeColor"></i> <span class="noticeColor">부가세 포함한 금액을 입력해주세요.</span>
							</div>
						</div>
						<br>
						<div id="priceArea" class="table-wrapper">
							<table>
								<thead>
									<tr>
										<c:forEach var="hour" begin="0" end="11">
										<th>${ hour }시</th>
										</c:forEach>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="day" begin="1" end="8">
									<tr id="timeTableAm${ day }" class="timeTable">
										<c:forEach var="hour" begin="0" end="11">
										<td>
											<c:if test="${ hour >= spaceOpen && hour <= spaceClose-1 }">
											<input type="number" id="timeTableAm${ day }hour${ hour }" class="price align-right">
											</c:if>
											<c:if test="${ hour < spaceOpen || hour > spaceClose-1 }">
											<input type="number">
											</c:if>
										</td>
										</c:forEach>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<table>
								<thead>
									<tr>
										<c:forEach var="hour" begin="12" end="23">
										<th>${ hour }시</th>
										</c:forEach>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="day" begin="1" end="8">
									<tr id="timeTablePm${ day }" class="timeTable">
										<c:forEach var="hour" begin="12" end="23">
										<td>
											<c:if test="${ hour >= spaceOpen && hour <= spaceClose-1 }">
											<input type="number" id="timeTablePm${ day }hour${ hour }" class="price align-right">
											</c:if>
											<c:if test="${ hour < spaceOpen || hour > spaceClose-1 }">
											<input type="number">
											</c:if>
										</td>
										</c:forEach>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row gtr-uniform">
							<div class="col-2 col-12-xsmall">
								<label for="spaceAdd">1인당 추가 금액</label>
								<input type="number" class="align-right" name="spaceAdd" id="spaceAdd" min="0">
							</div>
							<div class="col-10 col-12-xsmall">
							</div>
						</div>
						<br>
						<input type="hidden" name="spaceId" value="${ spaceId }">
						<input type="hidden" name="spacePrice" id="spacePrice1">
						<input type="hidden" name="spacePrice" id="spacePrice2">
						<input type="hidden" name="spacePrice" id="spacePrice3">
						<input type="hidden" name="spacePrice" id="spacePrice4">
						<input type="hidden" name="spacePrice" id="spacePrice5">
						<input type="hidden" name="spacePrice" id="spacePrice6">
						<input type="hidden" name="spacePrice" id="spacePrice7">
						<input type="hidden" name="spacePrice" id="spacePrice8">
						<div class="row">
							<div class="col-3"></div>
							<div class="col-3"><input type="submit" id="submitBtn" class="button primary fit" value="등록"></div>
							<div class="col-3"><input type="button" class="button fit" value="취소" onclick="location.href='spaceList.sp'"></div>
							<div class="col-3"></div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
	<script src="${contextPath}/resources/js/spacePrice.js"></script>
</body>
</html>