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
          <h1 class="h3 mb-2 text-gray-800">호스트별 정산 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="monthSelect" id="monthSelect">
                <option value="0">월별 전체</option>
                <c:forEach begin="1" end="12" var="month">
                	<option value="${month }" <c:if test="${month == monthS }">selected</c:if>>${month }월</option>
                </c:forEach>
              </select>
			  <script>
				$("#monthSelect").on("change", function() {
					location.href = "settlementManagement.sp?monthS="+$(this).val();
				});
			  </script>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>호스트아이디</th>
                      <th>시작기간</th>
                      <th>종료기간</th>
                      <th>총 결제 금액</th>
                      <th>수수료 금액</th>
                      <th>정산금액</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>
                      <th>호스트아이디</th>
                      <th>시작기간</th>
                      <th>종료기간</th>
                      <th>총 결제 금액</th>
                      <th>수수료 금액</th>
                      <th>정산금액</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${aList }" var="act">
	                    <tr>
	                      <td>${act.accountId}</td>
	                      <td>${act.hoshId}</td>
	                      <td><fmt:formatDate value="${act.accountStart}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td><fmt:formatDate value="${act.accountEnd}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td>${act.accountTotal}</td>
	                      <td>${act.accountFee}</td>
	                      <td>${act.accountPrice}</td>
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
