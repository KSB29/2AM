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
          <h1 class="h3 mb-2 text-gray-800">관리자 답변 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="row">
	          <div class="card shadow mb-4 col-lg-8">
	            <div class="card-body">
	              <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                  <thead>
	                    <tr>
	                      <th>번호</th>
	                      <th>문의내용</th>
	                      <th>문의등록일</th>
	                      <th>문의작성자</th>
	                      <th>삭제여부</th>
	                    </tr>
	                  </thead>
	                  <tfoot>
	                    <tr>
	                      <th>번호</th>
	                      <th>문의내용</th>
	                      <th>문의등록일</th>
	                      <th>문의작성자</th>
	                      <th>삭제여부</th>
	                    </tr>
	                  </tfoot>
	                  <tbody>
	                  	<c:forEach items="${aList }" var="qna">
		                    <tr class="tr" onclick="show(${qna.qnaId})">
		                      <td>${qna.qnaId}</td>
		                      <td>${qna.qContent}</td>
		                      <td><fmt:formatDate value="${qna.qDate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
		                      <td>${qna.qMemberId}</td>
		                      <td>${qna.qStatus}</td>
		                    </tr>
	                  	</c:forEach>
	                  </tbody>
	                </table>
	              </div>
	            </div>
	          </div>
	          <div class="col-lg-4">
	          	<div class="card shadow mb-4" id="form" style="display: none;">
	          		<div class="card-header py-3 m-0 font-weight-bold text-primary">답변 작성</div>
	          		<div class="card-body">
	          			<form class="row" action="answerAdmin.sp">
	          				<span class="form-control form-control-user col-2 mb-4">글번호</span> <input class="form-control form-control-user col-10 mb-4" type="text" name="qnaId" readonly>
	          				<textarea name="aContent" class="form-control form-control-user mb-4" rows="5" required></textarea>
	          				<button class="btn btn-primary btn-user btn-block">
			                  	답변작성
			                </button>
	          			</form>
	          		</div>
	          	</div>
	          </div>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      <script>
      	$(function() {
          $("tr.tr").hover(function(){
            $(this).css({"cursor":"pointer", "color":"#4e73df", "font-weight":"bold"});

          }, function(){
            $(this).css({"cursor":"none", "color":"#858796", "font-weight":"normal"});
          })
        });
      	function show(qnaId) {
      		$("#form").toggle();
      		/* $("#form").css("display", "block"); */
      		$("input[name=qnaId]").val(qnaId);
        }
      </script>

      <!-- Footer -->
      <jsp:include page="adminBottom.jsp"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</body>
</html>
