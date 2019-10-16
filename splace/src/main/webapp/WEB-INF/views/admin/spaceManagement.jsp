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
          <h1 class="h3 mb-2 text-gray-800">공간 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
                <option value="4" <c:if test="${status==4 }">selected</c:if>>전체</option>
                <option value="0" <c:if test="${status==0 }">selected</c:if>>등록</option>
                <option value="1" <c:if test="${status==1 }">selected</c:if>>대기</option>
                <option value="2" <c:if test="${status==2 }">selected</c:if>>승인</option>
                <option value="3" <c:if test="${status==3 }">selected</c:if>>반려</option>
              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "sInfoManagement.sp?spaceStatus="+$(this).val();
				});
			  </script>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>이름</th>
                      <th>한줄소개</th>
                      <th>상세소개</th>
                      <th>태그</th>
                      <th>주의사항</th>
                      <th>주소/전화번호</th>
                      <th>이용인원</th>
                      <th>운영시간</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th>회원ID</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>
                      <th>이름</th>
                      <th>한줄소개</th>
                      <th>상세소개</th>
                      <th>태그</th>
                      <th>주의사항</th>
                      <th>주소/전화번호</th>
                      <th>이용인원</th>
                      <th>운영시간</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th>회원ID</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${sList }" var="space">
                  	  <tr>
	                      <td>${space.spaceId}</td>
	                      <td>${space.spaceName}</td>
	                      <td>${space.spaceComment}</td>
	                      <td>${space.spaceDetail}</td>
	                      <td>${space.spaceTag}</td>
	                      <td>${space.spaceNotice}</td>
	                      <td>${space.spaceAddress} / ${space.spacePhone}</td>
	                      <td>${space.spaceMinPer} ~ ${space.spaceMaxPer} 명</td>
	                      <td>${space.spaceOpenTime} ~ ${space.spaceCloseTime} 시</td>
	                      <td><fmt:formatDate value="${space.spaceEnroll}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td><fmt:formatDate value="${space.spaceUpdate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td>${space.memberId}</td>
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
