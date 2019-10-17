<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SPLACE - 마이 페이지</title>
		<meta charset="utf-8" />
		
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/profile.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		<!-- js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	
	
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

			<!-- url -->
			<c:url var="deleteForm" value="deleteForm.sp"/>
			
				<!-- Main -->
				<div id="main">
					<div class="inner">
						<jsp:include page="../common/top.jsp"/>
					
						<jsp:include page="memberMenu.jsp"/>
					
						<h1 class="center">프로필 관리</h1>
						<div class="profile_wrapper row display">
							<section class="profile_box col-12">
								<p></p>
								<div class="row">
									<p class="content"><strong>이름</strong></p>
									<p class="col-4">${loginUser.memberName}</p>
									<span class="col-5"></span>
								</div>
								<div class="row">
									<p class="content"><strong>이메일</strong></p>
									<p class="col-4" id=memberSubId>${loginUser.memberId}</p>
									<span class="col-5"></span>

								</div>
								<div class="row">
									<p class="content"><strong>연락처</strong></p>
									<p id="phoneNo" class="col-4">${loginUser.memberPhone}</p>
									<span class="col-5"><button class="button primary small" data-target="#updatePhone" data-toggle="modal">번호 수정</button></span>

								</div>
								<div class="row">
									<p class="content"><strong>비밀번호</strong></p>
									<p class="col-4"> <a href="changePwForm.sp" >변경하기</a></p>
									<span class="col-5"></span>
								</div>
								<div class="row"> 
									<p class="content"><strong>SNS연동</strong></p>
									<p class="col-4">네이버 연동 <input type="hidden" id="status1"></p>
									<span class="col-5 ">
									<c:choose>
										<c:when test="${loginUser.memberSocial eq '네이버'}">
										<label class="switch">
											 <input type="checkbox" id="status1" class="socialStatus" readonly checked> 
											 <span class="slider round"></span> 
										</label>
										</c:when>
										<c:otherwise>
										<label class="switch">
											 <input type="checkbox" id="status1" class="socialStatus" readonly> 
											 <span class="slider round"></span> 
										</label>																				
										</c:otherwise>
									</c:choose>								
									</span>
								</div>
								<div class="row">
									<p class="content"></p>
									<p class="col-4">카카오 연동</p>
									<span class="col-5 ">
									<c:choose>
										<c:when test="${loginUser.memberSocial eq '카카오'}">
										<label class="switch">
											 <input type="checkbox" id="status2" class="socialStatus" readonly checked> 
											 <span class="slider round"></span> 
										</label>
										</c:when>
										<c:otherwise>
										<label class="switch">
											 <input type="checkbox" id="status2" class="socialStatus" readonly> 
											 <span class="slider round"></span> 
										</label>																				
										</c:otherwise>
									</c:choose>								
									</span>								
								</div>
								<div class="row">
									<p class="content"></p>
									<p class="col-4">구글 연동</p>
									<span class="col-5 ">
									<c:choose>
										<c:when test="${loginUser.memberSocial eq '구글'}">
										<label class="switch">
											 <input type="checkbox" id="status3" class="socialStatus" readonly checked> 
											 <span class="slider round"></span> 
										</label>
										</c:when>
										<c:otherwise>
										<label class="switch">
											 <input type="checkbox" id="status3" class="socialStatus" readonly> 
											 <span class="slider round"></span> 
										</label>																				
										</c:otherwise>
									</c:choose>								
									</span>									
								</div>
								
								<div class="row">
									<p class="content"><strong>마케팅 <br>수신 동의</strong></p>
									<p class="col-4"></p>
									<input type="hidden" id="memberAgree" value="${loginUser.memberSocial}">
									<span class="col-5 ">
										<c:choose>
											<c:when test="${loginUser.memberAgree eq 'Y'}">	
												<label class="switch">
													 <input type="checkbox" id="smsAgree" class="operStatus" checked> 
													 <span class="slider round"></span> 
												</label>
											</c:when>
											<c:otherwise>
												<label class="switch">
													 <input type="checkbox" id="smsAgree" class="operStatus"> 
													 <span class="slider round"></span> 
												</label>																						
											</c:otherwise>											 
										</c:choose>											 
									</span>
								</div>
								

								<!-- 비밀번호 변경 Modal -->
								<div class="modal fade" id="checkPwd" tabindex="-1" role="dialog" aria-labelledby="checkPwdCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header modal_title">
											<h2 class="modal-title center" id="checkPwdCenterTitle">비밀번호 확인</h2>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
											<div class="modal-body">
												<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호 입력">
												<input type="hidden" name="memberId" value="${loginUser.memberId}"  >
												<span class="warning"></span>
											</div>
											<div class="modal_btn_box center">
												<div class="modal_btn">
													<button  type="button" onclick="pwdCheck()"  class="button fit">확인</button>
												</div>
												
												<div class="modal_btn">
													<button type="button" class="button fit primary" data-dismiss="modal">취소</button>											
												</div>
											</div>						
										</div>
									</div>
								</div>
								
								
								<!-- 전화번호 변경 Modal -->
								<div class="modal fade" id="updatePhone" tabindex="-1" role="dialog" aria-labelledby="updatePhoneCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header modal_title">
											<h2 class="modal-title center" id="updatePhoneCenterTitle">핸드폰 번호 변경 </h2>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
											<div class="modal-body">
												<input type="text" id="memberPhone" name="memberPhone" placeholder="핸드폰 번호">
												<input type="hidden" id="memberId" value="${loginUser.memberId}" name="memberId" >
												<span class="warning2"></span>
											</div>
											<div class="modal_btn_box center">
												<div class="modal_btn">
													<button  id="changeNo_btn"  class="button fit"  type="button" onclick="updatePhone()" data-dismiss="modal" disabled>확인</button>
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
						<div class="delete_btn center"> <a href="#checkPwd" data-toggle="modal">탈퇴할래요</a></div>
					</div>
				</div>
			</div>	
			<script>


			
			
			</script>
			<script type="text/javascript" src="${contextPath}/resources/js/profile.js"></script>
			<!-- Footer -->
			<jsp:include page="../common/bottom.jsp"/>
			
	</body>
</html>