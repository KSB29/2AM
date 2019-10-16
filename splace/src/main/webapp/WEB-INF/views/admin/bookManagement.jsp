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
          <h1 class="h3 mb-2 text-gray-800">예약 정보관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
                <option value="109" <c:if test="${status==109 }">selected</c:if>>전체</option>
                <option value="100" <c:if test="${status==100 }">selected</c:if>>대기</option>
                <option value="101" <c:if test="${status==101 }">selected</c:if>>승인</option>
                <option value="102" <c:if test="${status==102 }">selected</c:if>>취소</option>
                <option value="103" <c:if test="${status==103 }">selected</c:if>>완료</option>
                <option value="104" <c:if test="${status==104 }">selected</c:if>>이용완료</option>
              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "bInfoManagement.sp?bookStatus="+$(this).val();
				});
			  </script>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>예약아이디</th>
                      <th>회원명</th>
                      <th>공간명</th>
                      <th>이용일</th>
                      <th>이용시간</th>
                      <th>이용인원</th>
                      <th>요청사항</th>
                      <th>가격</th>
                      <th>예약신청일</th>
                      <th>예약자</th>
                      <th>예약자 연락처</th>
                      <th>예약취소일</th>
                      <th>예약승인일</th>
                      <th>예약상태</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>예약아이디</th>
                      <th>회원명</th>
                      <th>공간명</th>
                      <th>이용일</th>
                      <th>이용시간</th>
                      <th>이용인원</th>
                      <th>요청사항</th>
                      <th>가격</th>
                      <th>예약신청일</th>
                      <th>예약자</th>
                      <th>예약자 연락처</th>
                      <th>예약취소일</th>
                      <th>예약승인일</th>
                      <th>예약상태</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${bList }" var="book">
                  	  <tr>
	                      <td>${book.bookId}</td>
	                      <td>${book.memberName}</td>
	                      <td>${book.spaceName}</td>
	                      <td><fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td>${book.bookStartTime} ~ ${book.bookEndTime} 시</td>
	                      <td>${book.bookPer} 명</td>
	                      <td>${book.bookRequest}</td>
	                      <td>${book.bookPrice}</td>
	                      <td><fmt:formatDate value="${book.bookEnroll}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td>${book.booker}</td>
	                      <td>${book.bookerEmail} / ${book.bookerPhone}</td>
	                      <td><fmt:formatDate value="${book.bookCancel}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td><fmt:formatDate value="${book.approvalDate}" pattern="yyyy.MM.dd (E)"/></td>
	                      <td>${book.statusName}</td>
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
