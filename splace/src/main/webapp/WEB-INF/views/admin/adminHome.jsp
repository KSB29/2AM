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
			<div class="row">
				<div class="col-lg-7">
					<div class="card shadow mb-4">
		                <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">오늘 예약 수</h6>
		                </div>
		                <div class="card-body">
		                  <div class="chart-bar">
		                    <canvas id="myAreaChart"></canvas>
		                  </div>
		                </div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="card shadow mb-4">
		                <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">답변요청 문의목록</h6>
		                </div>
		                <div class="card-body">
		                  <div class="table-responsive">
			                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>번호</th>
			                      <th>문의내용</th>
			                      <th>문의등록일</th>
			                      <th>문의작성자</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                  	<c:forEach items="${aList }" var="qna">
				                    <tr class="tr" onclick="location.href='answerAdminManagement.sp'">
				                      <td>${qna.qnaId}</td>
				                      <td>${qna.qContent}</td>
				                      <td><fmt:formatDate value="${qna.qDate}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
				                      <td>${qna.qMemberId}</td>
				                    </tr>
			                  	</c:forEach>
			                  </tbody>
			                </table>
			              </div>
		                </div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card shadow mb-4">
		                <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">호스트 신청목록</h6>
		                </div>
		                <div class="card-body">
		                  <div class="table-responsive">
			                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>번호</th>
			                      <th>대표자명</th>
			                      <th>상호명</th>
			                      <th>등록일</th>
			                      <th>회원ID</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                  	<c:forEach items="${hList }" var="host">
				                    <tr onclick="location.href='hApplyManagement.sp'">
				                      <td>${host.hostId}</td>
				                      <td>${host.hostName}</td>
				                      <td>${host.storeName}</td>
				                      <td><fmt:formatDate value="${host.hostEnroll}" pattern="yyyy.MM.dd (E) HH:mm:ss"/></td>
				                    </tr>
			                  	</c:forEach>
			                  </tbody>
			                </table>
			              </div>
		                </div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card shadow mb-4">
		                <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">공간 신청목록</h6>
		                </div>
		                <div class="card-body">
		                  
		                </div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
		                <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">신규회원</h6>
		                </div>
		                <div class="card-body">
			              <div class="table-responsive">
			                <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
			                  <thead>
			                    <tr>
			                      <th>아이디</th>
			                      <th>이름</th>
			                      <th>전화번호</th>
			                      <th>광고수신여부</th>
			                      <th>가입날짜</th>
			                      <th>소셜로그인</th>
			                      <th>등급</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                  	<c:forEach items="${mList }" var="mem">
			                  	  <tr>
				                      <td>${mem.memberId}</td>
				                      <td>${mem.memberName}</td>
				                      <td>${mem.memberPhone}</td>
				                      <td>${mem.memberAgree}</td>
				                      <td><fmt:formatDate value="${mem.memberEnroll}" pattern="yyyy.MM.dd HH:mm"/></td>
				                      <td>${mem.memberSocial}</td>
				                      <td>${mem.grade}</td>
			                      </tr>
			                  	</c:forEach>
			                  </tbody>
			                </table>
			              </div>
		                </div>
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
  <script src="${contextPath }/resources/admin/vendor/chart.js/Chart.min.js"></script>
  <script>
  	/* datatables.js */
  	$(document).ready(function() {
	  $('table.dataTable').DataTable();
	});

  	/* charts.js */
	var countArr = new Array(24);
	/* console.log(countArr.length); */
  	<c:forEach items="${bList }" var="bt">
  		var time = "${bt.getTime()}";
  		var count = ${bt.getCount()};
		countArr[time] = count;
	</c:forEach>
	/* console.log(countArr); */
	for(var i=0; i<countArr.length; i++){
		if(countArr[i] == null){
			countArr[i] = 0;
		}
	}
	/* console.log(countArr); */
	  Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	  Chart.defaults.global.defaultFontColor = '#858796';
	
	  function number_format(number, decimals, dec_point, thousands_sep) {
	    number = (number + '').replace(',', '').replace(' ', '');
	    var n = !isFinite(+number) ? 0 : +number,
	      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	      sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	      dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	      s = '',
	      toFixedFix = function(n, prec) {
	        var k = Math.pow(10, prec);
	        return '' + Math.round(n * k) / k;
	      };
	    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	    if (s[0].length > 3) {
	      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	    }
	    if ((s[1] || '').length < prec) {
	      s[1] = s[1] || '';
	      s[1] += new Array(prec - s[1].length + 1).join('0');
	    }
	    return s.join(dec);
	  }
	
	  var ctx = document.getElementById("myAreaChart");
	  var myLineChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: ["00시", "01시", "02시", "03시", "04시", "05시", "06시", "07시", "08시", "09시", "10시", "11시", "12시", "13시", "14시", "15시", "16시", "17시", "18시", "19시", "20시", "21시", "22시", "23시"],
	      datasets: [{
	        label: "예약 수",
	        lineTension: 0.3,
	        backgroundColor: "rgba(78, 115, 223, 0.05)",
	        borderColor: "rgba(78, 115, 223, 1)",
	        pointRadius: 3,
	        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointBorderColor: "rgba(78, 115, 223, 1)",
	        pointHoverRadius: 3,
	        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	        pointHitRadius: 10,
	        pointBorderWidth: 2,
	      	data: countArr
	      }],
	    },
	    options: {
	      maintainAspectRatio: false,
	      layout: {
	        padding: {
	          left: 10,
	          right: 25,
	          top: 25,
	          bottom: 0
	        }
	      },
	      scales: {
	        xAxes: [{
	          time: {
	            unit: 'date'
	          },
	          gridLines: {
	            display: false,
	            drawBorder: false
	          },
	          ticks: {
	            maxTicksLimit: 7
	          }
	        }],
	        yAxes: [{
	          ticks: {
	            maxTicksLimit: 5,
	            padding: 10,
	            callback: function(value, index, values) {
	              return value;
	            }
	          },
	          gridLines: {
	            color: "rgb(234, 236, 244)",
	            zeroLineColor: "rgb(234, 236, 244)",
	            drawBorder: false,
	            borderDash: [2],
	            zeroLineBorderDash: [2]
	          }
	        }],
	      },
	      legend: {
	        display: false
	      },
	      tooltips: {
	        backgroundColor: "rgb(255,255,255)",
	        bodyFontColor: "#858796",
	        titleMarginBottom: 10,
	        titleFontColor: '#6e707e',
	        titleFontSize: 14,
	        borderColor: '#dddfeb',
	        borderWidth: 1,
	        xPadding: 15,
	        yPadding: 15,
	        displayColors: false,
	        intersect: false,
	        mode: 'index',
	        caretPadding: 10,
	        callbacks: {
	          label: function(tooltipItem, chart) {
	            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	            return datasetLabel + ': ' + tooltipItem.yLabel;
	          }
	        }
	      }
	    }
	  });
  </script>
</body>
</html>
