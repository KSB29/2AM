<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>예약 리스트</title>
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
					<h1 class="align-center">예약 리스트</h1>
					<form action="">
						<div class="row gtr-uniform">
							<div class="col-8"></div>
							<div class="col-2">
								<select name="spaceId" id="spaceId">
									<option value="">- 공간 -</option>
									<option value="1">공간1</option>
								</select>
							</div>
							<div class="col-2">
								<select name="spaceStatus" id="spaceStatus">
									<option value="">- 예약상태 -</option>
									<option value="0">등록</option>
									<option value="1">대기</option>
									<option value="2">승인</option>
									<option value="3">반려</option>
								</select>
							</div>
						</div>
					</form>
				</section>
				<section>		
					<div class="table-wrapper">
						<table id="bookArea">
							<thead>
								<tr>
									<th>공간</th>
									<th>상태</th>
									<th>회원</th>
									<th>예약신청일</th>
									<th>이용날짜</th>
									<th>이용시간</th>
									<th>인원</th>
									<th>금액</th>
									<th><input type="checkbox" id="checkAll"><label for="checkAll"></label></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="7">
								<tr class="list">
									<td>공간1</td>
									<td>대기</td>
									<td>홍길동</td>
									<td>2019-09-20</td>
									<td>2019-09-22</td>
									<td>13시 ~ 14시</td>
									<td>5</td>
									<td>30,000</td>
									<th><input type="checkbox" id="check${i}" name="check${i}"><label for="check${i}"></label></th>
								</tr>
								<tr class="detail">
									<td>예약내역</td>
									<td colspan="9">홍길동 / 010-0000-0000 / kdhong@test.com / 예약 시 요청사항</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-3">
							<input type="button" class="button primary fit" value="승인">
						</div>
						<div class="col-3">
							<input type="button" class="button fit" value="반려">
						</div>
						<div class="col-3"></div>
					</div>
				</section>
				

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
<script>
	$(document).ready(function(){
		$(".detail").css("display", "none");
		$(".list td").click(function(){
			if($(this).parent().next("tr").css("display") == "none") {
				$(this).parent().siblings(".detail").slideUp();
				$(this).parent().next().slideDown();
			} else {
				$(this).parent().next().slideUp();
			}
		});
	});
</script>
</body>
</html>