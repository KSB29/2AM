<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1문의 등록</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/memberQna.css" />
</head>
<body class="is-preload">
		
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- header -->
		<jsp:include page="../common/top.jsp"/>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<jsp:include page="memberMenu.jsp"/>
            	<section>
                     <h1 class="center">1:1문의</h1>
                           
                       <form action="memberInsertQna.sp">
							<table class="table-wrapper">
							<tr class="accordion" id="accordionExample">
								<td class="card">
									<div class="card-header">
										<span class="col-6">문의 내역</span>
									</div>
									<div>
										<div class="card card-body">
											<div class="qnaContent">
												<textarea rows="7" name="qContent" id="qContent"></textarea>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					<br>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" class="button primary fit" value="등록">
						</div>
						<div class="col-4"></div>
					</div>
					</form>
					</section>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		<jsp:include page="../common/bottom.jsp"/>
	</body>
</html>