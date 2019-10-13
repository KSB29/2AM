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
    <jsp:include page="../admin/adminLeft.jsp" />
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="../admin/adminTop.jsp"/>
        <!-- End of Topbar -->

        <!-- 여기에 작성 시작! 다른 곳은 그대로 복사하시오! -->
        <div class="container-fluid">
			
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">FAQ 수정</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
          	<form action="updateFaq.sp?boardId=${faq.boardId }" method="post">
	            <div class="card-body">
	              <div class="input-group border-left-primary mb-4">
	              	  <label for="title" class="m-2">제목: </label>
		              <input type="text" class="form-control bg-light small" name="boardTitle" id="title" value="${faq.boardTitle }" required>
		              <select class="custom-select col-2" name="boardType" id="boardType" name="boardType">
		                <option value="0" <c:if test="${faq.boardType==0 }">selected</c:if>>회원</option>
		                <option value="1" <c:if test="${faq.boardType==1 }">selected</c:if>>예약 및 결제</option>
		                <option value="2" <c:if test="${faq.boardType==2 }">selected</c:if>>취소 및 환불</option>
		                <option value="3" <c:if test="${faq.boardType==3 }">selected</c:if>>공간이용 및 후기</option>
		                <option value="4" <c:if test="${faq.boardType==4 }">selected</c:if>>기타</option>
		              </select>              
	              </div>
	              <jsp:include page="summernote.jsp"/>
	            </div>
	            <div class="card-header py-3">
	            	<button type="button" class="btn btn-danger btn-circle btn-lg" onclick="location.href='faqManagement.sp'"><i class="fas fa-trash"></i></button>
	            	<button type="submit" class="btn btn-success btn-circle btn-lg"><i class="fas fa-check"></i></button>
	            </div>
            </form>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="../admin/adminBottom.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</body>
</html>
