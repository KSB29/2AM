<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
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
</head>
<body class="is-preload">
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	
	<!-- Header -->
	<header id="header">
		<!-- Nav -->
		<nav>
			<!-- Logo -->
			<ul>
				<li>
					<a href="${contextPath }" class="logo">
						<img src="${contextPath }/resources/img/logo.png" alt="logo" />
					</a>
				</li>
			</ul>
			<!-- MenuIcon -->
			<ul>
				<li><a href="#menu"></a></li>
			</ul>
			<!-- Search -->
			<ul>
				<li>
				  <c:url var="searchArea" value="search.sp"/>
					<form action="${searchArea }" id="searchForm" method="GET">
						<input type="text" name="searchBox" id="searchBox" placeholder="공간을 검색해보세요!" required>
						<button id="searchBtn"><i class="fa fa-search"></i></button>
					</form>
				</li>
			</ul>
		</nav>
	</header>
	
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<!-- Menu -->
	<nav id="menu">
		<c:if test="${!empty sessionScope.loginUser}">
		<c:url var="logout" value="logout.sp"/>
		<section>
			<div class="row" id="alram">
				<div class="col-8">
					<a href="${logout}">로그아웃</a>
				</div>
				<!-- 알림 벨  -->
				<div class="col-3 align-right">
					<button id="bell" onclick="myFunction();"><i class="fa fa-bell"></i><i class="fas fa-circle" id="redBell"></i></button>
				</div>
				<!-- 알림 리스트 -->
                <div class=" row notification-container" id="bellList" style="display: none">
                  <h3>알림</h3>
				  <div id="notificationDiv">
				  
				  
				  </div>
                </div>
			</div>
			<div class="row" id="section1row">
				<div class="col-12">
					<span>${loginUser.memberName}님 안녕하세요 </span>
				</div>
			</div>
		</section>
		</c:if>
		<section>
			<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<c:url var="loginForm" value="loginForm.sp"/>
				<c:url var="joinForm" value="joinForm.sp"/>
				<div class="row" id="section2row">
					<div class="col-6">
						<button class="button primary small" onclick="location.href='${loginForm}'">로그인</button>
					</div>
					<div class="col-6">
						<button class="button primary small" onclick="location.href='${joinForm}'">회원가입</button>
					</div>
				</div>
			</c:when>
			<c:when test="${!empty sessionScope.loginUser}">
				<c:url var="profileView" value="profileView.sp"/>
				<c:url var="hostApplyForm" value="hostApplyForm.sp"/>
				<c:url var="hostInfoForm" value="hostInfoForm.sp"/>
				<c:url var="adminHome" value="adminHome.sp"/>
				<div class="row" id="section2row">
					<c:choose>
						<c:when test="${loginUser.grade eq '0'}">
							<div class="col-12">
								<button class="button primary small" onclick="location.href='${adminHome}'">관리자 페이지</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-6">
								<button class="button primary small" onclick="location.href='${profileView}'">회원</button>
							</div>
							<div class="col-6">		
								<button class="button primary small" onclick="location.href='${hostApplyForm}'">호스트</button>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			</c:choose>
		</section>
		<c:url var="noticeList" value="noticeList.sp"/>
		<c:url var="faqList" value="faqList.sp" />
		<c:url var="qnaList" value="qnaList.sp"></c:url>
		<ul>
			<li><a href="${contextPath }">홈</a></li>
			<li><a href="${noticeList}">공지사항</a></li>
			<li><a href="${faqList}">FAQ</a></li>
			<li><a href="${qnaList}">1:1문의</a></li>
		</ul>
	</nav>

	<!-- Scripts -->
	<script>
	 /* 알림창 오픈클로즈 */
	function myFunction(){
		var x = document.getElementById("bellList");
		if (x.style.display === "none") {
			x.style.display = "block";
			$("#bell>i").css("color","#4c74b9");
			Alarm();
		}else {
			x.style.display = "none";
			$("#bell>i").css("color","#585858");
		}
	 }
	 
	 // 알림 조회 function 호출
  	$(function(){
  		checkAlarm();
	  });
 	 
 	 // 안읽은 알람 여부 조회
	 function checkAlarm(){
		 $.ajax({
			 url:"checkAlarm.sp",
			 success:function(result){
				 if(result=="ok"){
					 $("#redBell").css("display","block");
				 }else{
					 $("#redBell").css("display","none");
				 }
			 }
		 });
	 }
	  
	 
	//벨 클릭 시 알림 리스트 출력
	$(".fa-bell").click(function Alarm(){
       $.ajax({
		url:"alarmList.sp",
		dataType:"JSON",
		success:function(NoticeArr){
			var $body = $("#notificationDiv");
			$body.html("");
				        		
		if(NoticeArr.length>0){
			$.each(NoticeArr,function(i){
				var result="";
				result+='<input class="checkbox" type="checkbox" id="size_'
						+(i+1)
						+'" value="'
						+NoticeArr[i].noticeId 
						+'" checked />'
						+'<label class="notification" for="size_'
						+(i+1)
						+'"><em>'
						+(i+1)
						+'</em>'
						+NoticeArr[i].noticeContent
						+NoticeArr[i].noticeDate
						+'<i class="material-icons dp48 right">clear</i></label>';
						
						
						$body.append(result);
	    			});
			
     			// 알림 클릭 시 삭제
	     		$(".checkbox").click(function(noticeId){
	     			var noticeId = $(this).val();
	     			console.log(noticeId);
	             	$.ajax({
	             		url:"alarmDelete.sp",
	             		data:{noticeId:noticeId},
	             	    success:function(result){
		        	        if(result=="success"){
			        	        alert("알림이 삭제되었습니다!");
			        	       	Alarm();
			        	       	checkAlarm();
		        	         }
	        	          },
	        	          error:function(){
	        	      	 	console.log("error");
	        	         }
	             	});
	         	});
    			
    		}else{
    			var result2="";
	    		result2+='<p>새로운 알림이 없습니다!</p>';
	    		$body.append(result2);
    		}
	    	
	    	},
	    	error:function(){
	    		console.log("error");
	    	}
	   	});
	  });
	
    </script>
	<script src="${contextPath }/resources/js/browser.min.js"></script>
	<script src="${contextPath }/resources/js/breakpoints.min.js"></script>
	<script src="${contextPath }/resources/js/util.js"></script>
	<script src="${contextPath }/resources/js/main.js"></script>
	<!-- splaceScript -->
	<script src="${contextPath}/resources/js/splace.js"></script>
	<!-- selectBox -->
	<script src="${contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath }/resources/js/jquery.magnific-popup.js"></script>
	<script src="${contextPath }/resources/js/gijgo.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- header끝------------------------------------- -->
</body>
</html>
