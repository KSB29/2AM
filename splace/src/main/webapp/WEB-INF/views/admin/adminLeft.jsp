<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <!-- Custom fonts for this template-->
  <link href="${contextPath }/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${contextPath }/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${adminHome.sp }">
      <div class="sidebar-brand-text mx-3">SPLACE - Admin</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="${adminHome.sp }">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span>
      </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <li class="nav-item">
      <a class="nav-link" href="tables.html">
        <i class="fas fa-fw fa-cog"></i>
        <span>회원관리</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
        <i class="fas fa-fw fa-cog"></i>
        <span>호스트관리</span>
      </a>
      <div id="collapse1" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">호스트 정보관리</a>
          <a class="collapse-item" href="utilities-border.html">호스트 신청관리</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
        <i class="fas fa-fw fa-cog	"></i>
        <span>공간관리</span>
      </a>
      <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">공간 정보관리</a>
          <a class="collapse-item" href="utilities-border.html">공간 신청관리</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
        <i class="fas fa-fw fa-cog	"></i>
        <span>예약관리</span>
      </a>
      <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">승인대기</a>
          <a class="collapse-item" href="utilities-border.html">결제대기</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
        <i class="fas fa-fw fa-cog	"></i>
        <span>결제관리</span>
      </a>
      <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">결제완료</a>
          <a class="collapse-item" href="utilities-border.html">결제취소</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse5" aria-expanded="true" aria-controls="collapse5">
        <i class="fas fa-fw fa-cog	"></i>
        <span>매출관리</span>
      </a>
      <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">최근 3개월 매출</a>
          <a class="collapse-item" href="utilities-border.html">호스트별 매출</a>
          <a class="collapse-item" href="utilities-border.html">총 매출</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse6" aria-expanded="true" aria-controls="collapse6">
        <i class="fas fa-fw fa-cog	"></i>
        <span>정산관리</span>
      </a>
      <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="utilities-color.html">공간별 정산</a>
        </div>
      </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      	관리자
    </div>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseA1" aria-expanded="true" aria-controls="collapseA1">
        <i class="fas fa-fw fa-cog	"></i>
        <span>문의관리</span>
      </a>
      <div id="collapseA1" class="collapse" aria-labelledby="headingA1" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">호스트</h6>
          <a class="collapse-item" href="login.html">내역관리</a>
          <div class="collapse-divider"></div>
          <h6 class="collapse-header">관리자</h6>
          <a class="collapse-item" href="404.html">내역관리</a>
          <a class="collapse-item" href="blank.html">답변관리</a>
        </div>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="tables.html">
        <i class="fas fa-fw fa-cog	"></i>
        <span>공지사항</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="tables.html">
        <i class="fas fa-fw fa-cog	"></i>
        <span>FAQ</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
  <!-- End of Sidebar -->
    
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="login.html">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${contextPath }/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${contextPath }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${contextPath }/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${contextPath }/resources/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${contextPath }/resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="${contextPath }/resources/admin/js/demo/chart-pie-demo.js"></script>
</body>
</html>
