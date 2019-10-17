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
          <h1 class="h3 mb-2 text-gray-800">매출 관리</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <select class="custom-select" name="statusSelect" id="statusSelect">
                <option value="4" <c:if test="${status==4 }">selected</c:if>>총 매출</option>
                <option value="0" <c:if test="${status==0 }">selected</c:if>>최근 3개월 매출</option>
                <option value="1" <c:if test="${status==1 }">selected</c:if>>호스트별 매출</option>
                <option value="2" <c:if test="${status==2 }">selected</c:if>>승인</option>
                <option value="3" <c:if test="${status==3 }">selected</c:if>>반려</option>
              </select>
			  <script>
				$("#statusSelect").on("change", function() {
					location.href = "salesManagement.sp?hostStatus="+$(this).val();
				});
			  </script>
            </div>
            <!-- 차트 내용  -->
            <div  style="width: 500px">
				<canvas id="myChart" style="display:block; width:360px; height:320px" width="360" height="320"></canvas>
       
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   <script>
			var ctx = document.getElementById("myChart"); //캔버스 id값 가져오기
			var myChart = new Chart(ctx, {
			    type: 'line', //그래프 형태 지정하기
			    data: {
			        labels: ["8월", "9월", "10월"], //X축 제목
			        datasets: [{
			            label: '최근 3개월간 매출 데이터',
			            data: [1, 2, 3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)', //1번째 그래프의 바탕색
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)'

			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',      //1번째 그래프의 선색
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)'
			            ],
			            borderWidth: 1 //선굵기
			        }]
			    },
			    options: {
			        scales: { //X,Y축 옵션
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true  //Y축의 값이 0부터 시작
			                }
			            }]
			        }
			    }
			});
</script>
  
</body>
</html>
