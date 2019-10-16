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
  <title>SPLACE - PAYMENT</title>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">7
  
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
          <h1 class="h3 mb-2 text-gray-800">결제 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
               <option value="0" <c:if test="${status==0}">selected</c:if>>전체</option>
                <option value="104" <c:if test="${status==104 }">selected</c:if>>결제 완료</option>
                <option value="102" <c:if test="${status==102 }">selected</c:if>>결제 취소</option>

              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "paymentManagement.sp?paymentStatus="+$(this).val();
				});
			  </script>	
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >

                
	                  <thead>   
	                    <tr>
	                      <th>결제 번호</th>
	                      <th>회원아이디</th>
	                      <th>이름</th>
	                      <th>이용 금액</th>
	                      <th>결제 수단 </th>
	                      <th>고유 영수증 키</th>
	                      <th>결제 일</th>
	                      <th>결제 취소일</th>
	                      <th>결제 취소금액</th>    
	                    </tr>
	                  </thead>
	                  <tfoot>
	                    <tr>
	                      <th>결제 번호</th>
	                      <th>회원아이디</th>
	                      <th>이름</th>
	                      <th>이용 금액</th>
	                      <th>결제 수단 </th>
	                      <th>고유 영수증 키</th>
	                      <th>결제 일</th>
	                      <th>결제 취소일</th>
	                      <th>결제 취소금액</th>                  
	                    </tr>          
	                  </tfoot> 
                 	 <tbody>
                  	<c:forEach items="pList" var="p">

	                      <tr>
		                      <td>${p.paymentId}</td>
		                      <td>${p.memberId}</td>
		                      <td>${p.booker}</td>
		                      <td>${p.bookPrice }</td>
		                      <td>${p.paymentType}</td>
		                      <td>${p.receiptId}</td>
		                      <td>${p.paymentDate}</td>
		                      <td>${p.paymentCancel}</td>
		                      <td>${p.paymentCancelPrice}</td>
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
