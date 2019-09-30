<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 리스트</title>
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
					<h1 class="align-center">정산 리스트</h1>
					<form action="">
						<div class="row gtr-uniform">
							<div class="col-10"></div>
							<div class="col-2">
								<select name="demo-category" id="demo-category">
									<option value="">- 공간 -</option>
									<option value="1">공간1</option>
								</select>
							</div>
						</div>
					</form>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>공간</th>
									<th>예약번호</th>
									<th>매출날짜</th>
									<th>정산여부</th>
									<th>정산날짜</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="7">
								<tr>
									<td>공간${i}</td>
									<td>${i}</td>
									<td>2019-09-21</td>
									<td>Y</td>
									<td>2019-09-21</td>
									<td>50000</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>