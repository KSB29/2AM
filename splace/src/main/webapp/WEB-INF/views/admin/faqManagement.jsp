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
          <h1 class="h3 mb-2 text-gray-800">FAQ 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>내용</th>
                      <th>상태</th>
                      <th>작성일</th>
                      <th>수정일</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>내용</th>
                      <th>상태</th>
                      <th>작성일</th>
                      <th>수정일</th>
                      <th></th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${bList }" var="faq">
	                    <tr>
	                      <td>${faq.boardId}</td>
	                      <td>${faq.boardTitle}</td>
	                      <td>${faq.boardContent}</td>
	                      <td>${faq.boardStatus}</td>
	                      <td><fmt:formatDate value="${faq.boardEnroll}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td><fmt:formatDate value="${faq.boardUpdate}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td>
	                      	<button class="btn btn-google btn-block" onclick="location.href=''">수정</button>
	                      	<button class="btn fit" onclick="location.href=''">삭제</button>
	                      </td>
	                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="card-header py-3">
            	<button class="btn btn-secondary btn-block" onclick="location.href='insertFaqForm.sp'">글쓰기</button>
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
