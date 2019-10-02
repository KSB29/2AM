<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/profile.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
	</head>
	
	<jsp:include page="../common/top.jsp"/>
	
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- url -->
	
			<c:url var="checkPwForm" value="checkPsForm.sp"/>
			<c:url var="deleteForm" value="deleteForm.sp"/>
			<c:url var="changePwForm" value="changePwForm.sp"/>
			
		
				<!-- Menu -->

				<!-- Main -->
				<div id="main">
					<div class="inner">
						<jsp:include page="memberMenu.jsp"/>
					
						<div class="profile_wrapper row display">
							<section class="co1-12">
								<h1>프로필</h1>
							</section>
							<section class="profile_box col-12">
								<p></p>
								<div class="row">
									<p class="col-2">이름</p>
									<p class="col-2">테스트1</p>
									<span class="col-8"></span>
								</div>
								<div class="row">
									<p class="col-2">이메일</p>
									<p class="col-2">test@naver.com</p>
									<span class="col-8"></span>

								</div>
								<div class="row">
									<p class="col-2">연락처</p>
									<p class="col-2">010-1111-2222</p>
									<span class="col-8"></span>

								</div>
								<div class="row">
									<p class="col-2">비밀번호</p>
									<p class="col-2"> <a href="#exampleModalCenter" data-toggle="modal">변경하기</a></p>
									<span class="col-8"></span>
								</div>
								<div class="row"> 
									<p class="col-2">SNS연동</p>
									<p class="col-2">네이버연동</p>
									<span class="col-8"></span>
							
								</div>
								<div class="row">
									<p class="col-2"></p>
									<p class="col-2">카카오연동</p>
									<span class="col-8"></span>
								</div>
								<div class="row">
									<p class="col-12"> <a href="${deleteForm}">탈퇴할래요</a></p>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header modal_title">
											<h2 class="modal-title center" id="exampleModalCenterTitle">비밀번호 확인</h2>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<input type="password" id="pwCheck" placeholder="password">
										</div>
										<div class="modal_btn_box center">
											<div class="modal_btn">
												<button type="button" class="button fit" onclick="pwCheck();">확인</button>
											</div>
											<div class="modal_btn">
												<button type="button" class="button fit primary" data-dismiss="modal">취소</button>											
											</div>
										</div>
									</div>
									</div>
								</div>
							</section>

						</div>
					</div>
				</div>
			</div>		
			<script>
				function pwCheck(){
					var pw = document.getElementById('pwCheck').value;
					if(pw==${loginUser.memberPwd}){
						location.href="${changePwForm}";		
					}
				}
			</script>






		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
		<!-- Footer -->
		<jsp:include page="../common/bottom.jsp"/>
	
</html>