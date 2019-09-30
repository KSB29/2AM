<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/space.css" type="text/css">
<title>공간 리스트</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section id="spaceArea">
					<h1 class="align-center">공간 리스트</h1>
					<div class="row gtr-uniform">
						<c:forEach var="i" begin="1" end="3">
							<div class="col-4">
								<div class="image fit bgImage" style="background-image:url('${contextPath }/resources/spaceImg/space${i}.PNG');">
									<span class="bgBlur"><br><br><br><br><br><br><br><span>비공개 중입니다.</span></span>
								</div>
								<h2 class="marginClear">공간명${i}</h2>
								<div class="marginClear">
									<span>등록일 : 2019.09.20</span>
									<span>&nbsp;&nbsp;&nbsp;</span>
									<label class="switch">
							            <input type="checkbox" class="operStatus">
							            <span class="slider round"></span>
							        </label>
						        </div>
								<div class="image fit marginClear">
									<a class="button primary small" href="spaceUpdateForm.sp">수정</a>
									<a class="button primary small" href="spacePrice.sp">가격 등록</a>
									<a class="button primary small" href="spaceDayoff.sp">휴일 등록</a>
								</div>
								<c:if test="${i==1 }">
								<div class="image fit marginClear">
									<a class="button small" href="">신청</a>
									<a class="button small" href="">삭제</a>
								</div>
								</c:if>
							</div>
						</c:forEach>
						<c:forEach var="i" begin="4" end="7">
							<div class="col-4">
								<div class="image fit bgImage" style="background-image:url('${contextPath }/resources/spaceImg/space${i}.PNG');">
									<br><br><br><br><br><br><br>
								</div>
								<h2 class="marginClear">공간명${i}</h2>
								<div class="marginClear">
									<span>등록일 : 2019.09.22</span>
									<span>&nbsp;&nbsp;&nbsp;</span>
									<label class="switch">
										<input type="checkbox" class="operStatus" checked>
						            	<!-- <input type="hidden" value="Y"> -->
							            <span class="slider round"></span>
							        </label>
						        </div>
								<div class="image fit marginClear">
									<a class="button primary small" href="spaceUpdateForm.sp">수정</a>
									<a class="button primary small" href="spacePrice.sp">가격 등록</a>
									<a class="button primary small" href="spaceDayoff.sp">휴일 등록</a>
								</div>
								<c:if test="${i==1 }">
								<div class="image fit marginClear">
									<a class="button small" href="">신청</a>
									<a class="button small" href="">삭제</a>
								</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<script>
						$(document).ready(function(){
			                $("input[type='checkbox']").click(function(){
			                    if ($(this).prop("checked") == true) {
			                    	$(this).attr("checked", true);
			                    } else {
			                    	$(this).attr("checked", false);
			                    };
			                });
			            });
					</script>
					<br><br>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="button" class="button primary fit" onclick="location.href='spaceInsertForm.sp'" value="공간 등록">
						</div>
						<div class="col-4"></div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>