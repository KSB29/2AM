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
          <h1 class="h3 mb-2 text-gray-800">호스트 문의 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>문의내용</th>
                      <th>문의등록일</th>
                      <th>문의작성자</th>
                      <th>공간아이디</th>
                      <th>삭제여부</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>
                      <th>문의내용</th>
                      <th>문의등록일</th>
                      <th>문의작성자</th>
                      <th>공간아이디</th>
                      <th>삭제여부</th>
                      <th></th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${qList }" var="qna">
	                    <tr>
	                      <td>${qna.qnaId}</td>
	                      <td>${qna.qContent}</td>
	                      <td><fmt:formatDate value="${qna.qDate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
	                      <td>${qna.qMemberId}</td>
	                      <td>${qna.spaceId}</td>
	                      <td>${qna.qStatus}</td>
	                      <td>
	                      	<c:if test="${qna.aDate != null }">
		                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${qna.qnaId}">
							   	 답변보기
							  </button>
	                      	</c:if>
						  </td>
	                    </tr>
	                    
                      	<c:if test="${qna.aDate != null }">
	                      	<div class="modal fade" id="exampleModalCenter${qna.qnaId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle${qna.qnaId}" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalCenterTitle${qna.qnaId}"><fmt:formatDate value="${qna.aDate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							      	<p><b>답변일:</b> ${qna.aMemberId}</p>
						        	<p><b>답변내용:</b> ${qna.aContent}</p>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							      </div>
							    </div>
							  </div>
							</div>
                      	</c:if>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
        <script>
        	function showAnswer() {
            	
			}
        </script>

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
