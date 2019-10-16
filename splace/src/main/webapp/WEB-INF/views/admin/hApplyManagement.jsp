<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
          <h1 class="h3 mb-2 text-gray-800">호스트 신청 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>회원아이디</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>이름</th>
                      <th>상호명</th>
                      <th>사업자번호</th>
                      <th>은행</th>
                      <th>계좌번호</th>
                      <th>예금주</th>
                      <th>등록일</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>아이디</th>
                      <th>회원아이디</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>이름</th>
                      <th>상호명</th>
                      <th>사업자번호</th>
                      <th>은행</th>
                      <th>계좌번호</th>
                      <th>예금주</th>
                      <th>등록일</th>
                      <th></th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${hList }" var="host">
	                    <tr>
	                      <td>${host.hostId}</td>
	                      <td>${host.memberId}</td>
	                      <td>${host.hostPhone}</td>
	                      <td>${host.hostEmail}</td>
	                      <td>${host.hostName}</td>
	                      <td>${host.storeName}</td>
	                      <td>${host.hostNo}</td>
	                      <td>${host.hostBank}</td>
	                      <td>${host.hostAccount}</td>
	                      <td>${host.hostBname}</td>
	                      <td><fmt:formatDate value="${host.hostEnroll}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td><fmt:formatDate value="${host.hostUpdate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td>
	                      	<button class="btn btn-google btn-block" onclick="location.href='hApproveManagement.sp?hostId=${host.hostId}'">승인</button>
	                      	<button class="btn btn-facebook btn-block" onclick="location.href='hCancelManagement.sp?hostId=${host.hostId}'">반려</button>
	                      </td>
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
