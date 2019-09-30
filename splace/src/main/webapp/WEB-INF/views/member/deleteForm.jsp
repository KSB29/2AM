<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
				<!-- template -->
				<noscript><link rel="stylesheet" href="${contextPath }/resources/css/noscript.css"></noscript>
				<!-- js -->
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
				<!-- css -->	
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
				<link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
				<link rel="stylesheet" href="${contextPath }/resources/css/fontawesome-all.min.css" type="text/css">
				<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
				<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
				<link rel="stylesheet" href="${contextPath }/resources/css/login.css" type="text/css">
				<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
				
</head>
	<!-- 회원 탈퇴 실패시 메세지 출력 -->
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
	</c:if>
	
	
	
	<!-- Header -->
	<jsp:include page="../common/top.jsp">
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">


				<!-- Menu -->

				<!-- Main -->
				<div id="main">
					<div class="inner">
							<div class="common_wrapper row type_2">
									<section class="wrapper_left welcome_bg col-5 center">
												<article class="welcome_box col-12">
												
												</article>
									</section>
									<section class="wrapper_right col-7 change_bg">
									<form action="#" method="POST">
										<article class="join_Form ">
													<div class="gjoin_box_1  center">
														<h2>떠나시려구요??</h2>
														<h3>
															떠나기 전에 확인해주세요!
														</h3> 
														<p> 
															서비스 탈퇴시 내 프로필, 
															예약 내용 등의 모든 정보가 삭제되며<br>
															이후 복구가 불가능합니다.
														</p>
														
														<div class="center">
															<input type="checkbox" id="delete_ck" required >
															<label for="delete_ck">위의 내용을 숙지했으며 탈퇴에 동의합니다.</label>
														</div>
													</div>	
													
													<div class="delete_btn_box center">
														<div class="delete_btn">
															<button id="delete_btn" class="button fit">서비스 탈퇴</button>
														</div>
														<div class="delete_btn">
															<button class="button primary fit " value="reset">취소</button>
														</div>
													</div>
										</article>
									</form>									

									</section>
								</div>
							</div>
						</div>
					</div>	
			<c:url var="delete" value="delete.sp"/>
				<!-- Footer -->
			<script>
			$(function(){
				$("#delete_btn").click(function(){
					var check = $("input:checkbox[id='delete_ck']").is(":checked");
					console.log(check);

					if(check==true){
						location.href="${delete}"
						alert('탈퇴 완료되었습니다.')
					}else{
						 alert('탈퇴에 동의해주세요!');
						 return false;
					}

				});

			});
		
		</script>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
	
		<jsp:include page="../common/bottom.jsp">
	
</html>