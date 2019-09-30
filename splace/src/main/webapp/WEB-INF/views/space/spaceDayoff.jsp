<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#noticeList > span,
	#offList > span {
		display: block;
		border-bottom: 1px solid #c9c9c9;
	}
</style>
<script>
/* $(document).ready(function(){
	$("#addOffBtn").click(function(){
		var offStart = $("#offStart").val();
		var offEnd = $("#offEnd").val();
		if (offStart + offEnd != "") {
			var $offList = $("#offList");
			var $span = $("<span>").text(offStart + " ~ " + offEnd);
			$offList.append($span);
			$("#offStart").val("");
			$("#offEnd").val("");
		}
	});
	
}); */
</script>
<title>휴일 리스트</title>
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
					<h1 class="align-center">휴일 리스트</h1>
					<form action="">
						<div class="row gtr-uniform">
							<div class="col-2">
								<select name="demo-category" id="demo-category">
									<option value="">- 공간 -</option>
									<option value="1">공간1</option>
								</select>
							</div>
							<div class="col-10"></div>
						</div>
					</form>
					<div class="row gtr-uniform">
						<div class="col-7">
							<table id="offArea">
								<thead>
									<tr>
										<th>번호</th>
										<th>휴일시작</th>
										<th>휴일종료</th>
										<th><input type="checkbox" id="demo-human0" name="demo-human"><label for="demo-human0"></label></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" begin="1" end="3">
									<tr class="list">
										<td>${i}</td>
										<td>2019-09-22</td>
										<td>2019-09-25</td>
										<th><input type="checkbox" id="demo-human1" name="demo-human"><label for="demo-human1"></label></th>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-5">
							<div class="row gtr-uniform">
								<div class="col-5 col-2-xsmall">
									<input type="date" id="offStart">
								</div>
								<div class="col-5 col-2-xsmall">
									<input type="date" id="offEnd">
								</div>
								<div class="col-2">
									<input type="button" class="button primary small" id="addOffBtn" value="추가">
								</div>
								<div class="col-12 col-12-xsmall" id="offList"></div>
								<input type="hidden" name="dayOff" id="dayOff">
							</div>
						</div>
					</div>
					<br><br>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="button" class="button primary fit" value="저장" onclick="location.href='dayOffInsert.sp'">
						</div>
						<div class="col-4"></div>
					</div>
				</section>
				
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
<script>
	$(document).ready(function(){
		$("#addOffBtn").click(function(){
			var $table = $("#offArea tbody");
			var $tr = $("<tr>");
			$tr.append($("<td>"));
			$tr.append($("<td><input type='date' value='" + $("#offStart").val() + "'>"));
			$tr.append($("<td><input type='date' value='" + $("#offEnd").val() + "'>"));
			$tr.append($("<td>"));
			$table.append($tr);
		});
	});
</script>
</body>
</html>