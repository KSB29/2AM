<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 리스트</title>
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
					<h1 class="align-center">후기 리스트</h1>
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
									<th>회원</th>
									<th>별점</th>
									<th>등록일자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="1" end="7">
								<tr>
									<td>공간</td>
									<td>홍길동</td>
									<td></td>
									<td>2019-09-21</td>
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