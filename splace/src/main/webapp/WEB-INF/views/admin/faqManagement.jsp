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
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
                <option value="100" <c:if test="${status==100 }">selected</c:if>>전체</option>
                <option value="0" <c:if test="${status==0 }">selected</c:if>>회원</option>
                <option value="1" <c:if test="${status==1 }">selected</c:if>>예약 및 결제</option>
                <option value="2" <c:if test="${status==2 }">selected</c:if>>취소 및 환불</option>
                <option value="3" <c:if test="${status==3 }">selected</c:if>>공간이용 및 후기</option>
                <option value="4" <c:if test="${status==4 }">selected</c:if>>기타</option>
              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "faqManagement.sp?boardType="+$(this).val();
				});
			  </script>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>내용</th>
                      <th>유형</th>
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
                      <th>유형</th>
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
	                      <c:choose>
	                      	<c:when test="${faq.boardType == 0}">
	                      		<td>회원</td>
	                      	</c:when>
	                      	<c:when test="${faq.boardType == 1}">
	                      		<td>예약 및 결제</td>
	                      	</c:when>
	                      	<c:when test="${faq.boardType == 2}">
	                      		<td>취소 및 환불</td>
	                      	</c:when>
	                      	<c:when test="${faq.boardType == 3}">
	                      		<td>공간이용 및 후기</td>
	                      	</c:when>
	                      	<c:when test="${faq.boardType == 4}">
	                      		<td>기타</td>
	                      	</c:when>
	                      </c:choose>
	                      <td>${faq.boardStatus}</td>
	                      <td><fmt:formatDate value="${faq.boardEnroll}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td><fmt:formatDate value="${faq.boardUpdate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td>
	                      	<c:if test="${faq.boardStatus eq 'Y' }">
	                      		<button class="btn btn-google btn-block" onclick="location.href='faqDelete.sp?faqId=${faq.boardId}'">삭제</button>
	                      	</c:if>
	                      	<button class="btn btn-facebook btn-block" onclick="location.href='faqUpdateForm.sp?faqId=${faq.boardId}'">수정</button>
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
