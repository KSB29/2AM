<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 리스트</title>
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
					<h1 class="align-center">Q&A 리스트</h1>
					<form action="">
						<div class="row gtr-uniform">
							<div class="col-8"></div>
							<div class="col-2">
								<select name="demo-category" id="demo-category">
									<option value="">- 공간 -</option>
									<option value="1">공간1</option>
								</select>
							</div>
							<div class="col-2">
								<select name="demo-category" id="demo-category">
									<option value="">- 답변상태 -</option>
									<option value="1">미등록</option>
									<option value="1">완료</option>
								</select>
							</div>
						</div>
					</form>
					<div class="row gtr-uniform">
						<div class="col-6">
							<!-- 문의내용 문의작성날짜 답변내용 답변작성날짜 상태(Y: 정상, N:삭제) 회원아이디 -->
							<table id="qArea">
								<thead>
									<tr>
										<th>공간</th>
										<th>회원</th>
										<th>문의날짜</th>
										<th>답변날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" begin="1" end="10">
									<tr>
										<td>공간${i}</td>
										<td>홍길동</td>
										<td>2019-09-20</td>
										<td>2019-09-21</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-6">
							<form method="post" action="#">
								<div class="row gtr-uniform" id="aArea">
									<div class="col-12 col-12-xsmall">
										<label for="qContent">문의</label>
										<textarea name="qContent" id="qContent" rows="5" readonly>문의내역</textarea>
									</div>
									<div class="col-12 col-12-xsmall">
										<label for="aContent">답변</label>
										<textarea name="aContent" id="aContent" placeholder="답변" rows="5"></textarea>
									</div>
								</div>
								<br><br>
								<div class="row">
									<div class="col-3"></div>
									<div class="col-3">
										<input type="submin" class="button primary fit" value="등록">
									</div>
									<div class="col-3">
										<input type="reset" class="button fit" value="취소">
									</div>
									<div class="col-3"></div>
								</div>
							</form>
						</div>
					</div>
					<br><br>
					<div class="row gtr-uniform">
						<div class="col-12">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
									</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
<script>
	$(document).ready(function(){
		$("#qArea td").click(function(){
			$("#qContent").text($(this).parent().children().eq(0).html()+"문의내역");
			$("#aContent").text($(this).parent().children().eq(0).html()+"답변내역");
		}).mouseenter(function(){
			$(this).parent().css("cursor", "pointer");
		});
	});
</script>
</body>
</html>