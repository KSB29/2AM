<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SPLACE - ADMIN</title>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  
    <!-- Sidebar -->
    <jsp:include page="adminLeft.jsp" />
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="adminTop.jsp"/>
        <!-- End of Topbar -->

        <!-- 여기에 작성 시작! 다른 곳은 그대로 복사하시오! -->
        <div class="container-fluid">
			
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
                <option value="Y" <c:if test="${status.equals('Y') }">selected</c:if>>회원</option>
                <option value="N" <c:if test="${status.equals('N') }">selected</c:if>>탈퇴회원</option>
              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "memberManagement.sp?memberStatus="+$(this).val();
				});
			  </script>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>광고수신여부</th>
                      <th>가입날짜</th>
                      <th>소셜로그인</th>
                      <th>등급</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>광고수신여부</th>
                      <th>가입날짜</th>
                      <th>소셜로그인</th>
                      <th>등급</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${mList }" var="mem">
                  	  <tr>
	                      <td>${mem.memberId}</td>
	                      <td>${mem.memberName}</td>
	                      <td>${mem.memberPhone}</td>
	                      <td>${mem.memberAgree}</td>
	                      <td>${mem.memberEnroll}</td>
	                      <td>${mem.memberSocial}</td>
	                      <td>${mem.grade}</td>
                      </tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
			
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="adminBottom.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</body>
</html>
