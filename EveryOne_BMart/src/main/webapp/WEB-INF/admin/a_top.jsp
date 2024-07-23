<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-rounded/css/uicons-bold-rounded.css">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-straight/css/uicons-bold-straight.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
	
	
	<style>
		.fc-header-toolbar .fc-button {
			font-size: 12px; /* 작은 글꼴 크기 */
			padding: 5px 10px; /* 작은 버튼 크기 */
		}
		
		.fc-header-toolbar .fc-button-primary {
			background-color: #2ac1bc; /* 기본 버튼 배경색 */
			color: #fff; /* 기본 버튼 글자색 */
			border-color: #2ac1bc; /* 기본 버튼 테두리 색 */
		}
		
		.fc-header-toolbar .fc-button-primary:hover {
			background-color: #2ac1bc; /* 마우스 호버 시 배경색 */
			border-color: #2ac1bc; /* 마우스 호버 시 테두리 색 */
		}
		
		#calendar-container {
			position: relative;
			z-index: 1;
			margin: 50px;
		}
		
		#calendar {
			max-width: 1100px;
		}
		
		.pagination-wrapper {
			display: flex;
			justify-content: center;
		}
		
		.plusbtn {
			float: right;
			margin-left: 10px;
			font-size: 2rem;
		}
		
		.content {
			width: 100%;
			height: 100px;
			box-sizing: border-box;
		}
		
		.err {
			color: red;
			font-weight: bold;
			font-size: 11pt;
		}
		
		.title {
			text-align: center;
		}
		
		.chart-container {
			position: relative;
			height: 85%;
			width: 85%;
		}
		
		.search {
			display: flex;
			justify-content: flex-end;
			align-items: center; /* 세로축 가운데 정렬 */
			margin-left: 75%;
		}
		
		.trash {
			font-size: 30px;
		}
		
		button {
			border: none; /* 경계선 없애기 */
			background: none; /* 배경 없애기 */
			padding: 0; /* 패딩 없애기 */
			cursor: pointer; /* 커서 포인터로 변경 */
		}
		
		.reading {
			border: 1px solid;
		}
		
		.profilebtn{
			text-align: center;
		}
		
		input[type="submit"]:hover, input[type="button"]:hover {
			background-color: #25A8A4;
		}
	</style>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Side bar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminMain.ad">
                <div class="sidebar-brand-icon">
                	<img src="<%=request.getContextPath()%>/resources/images/Blogo.png" width="40" height="40">
                </div>
                <div class="sidebar-brand-text mx-3">EveryOne<br>B-Mart</div>
            </a>
   
            <!-- Owner -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span><b>${loginInfo.name}</b>님</span>
                </a>
            </li>
            
            <hr class="sidebar-divider">
            
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember" aria-expanded="true" aria-controls="collapseMember"> 
					<i class="fas fa-fw fa-plus"></i> <span>회원관리</span>
				</a>
				<div id="collapseMember" class="collapse" aria-labelledby="headingMember" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Member Manage:</h6>
						<a class="collapse-item" href="aMemberList.mb">일반회원목록</a> 
						<a class="collapse-item" href="bMemberList.mb">사업자회원목록</a>
					</div>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="adminProductList.prd" data-toggle="collapse" data-target="#collapseProducts" aria-expanded="true" aria-controls="collapseUtilities"> 
					<i class="fas fa-fw fa-box"></i> <span>상품관리</span>
				</a>
				<div id="collapseProducts" class="collapse" aria-labelledby="headingProducts" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Product Manage:</h6>
						<a class="collapse-item" href="adminProductList.prd">상품목록</a> 
						<a class="collapse-item" href="adminProductInsert.prd">상품등록</a> 
					</div>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSales" aria-expanded="true" aria-controls="collapseUtilities"> 
					<i class="fas fa-fw fa-comments-dollar"></i> <span>매출관리</span>
				</a>
				<div id="collapseSales" class="collapse" aria-labelledby="headingSales" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Sales Manage:</h6>
						<a class="collapse-item" href="top.sale">상품 매출</a> 
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Approve</div>

			<!-- 결재함 메뉴 -->
	         <li class="nav-item">
	            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> 
	               <i class="fas fa-fw fa-folder"></i> 
	               <span>결재함</span>
	            </a>
	            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
	               <div class="bg-white py-2 collapse-inner rounded">
	                  <h6 class="collapse-header">결재함</h6>
	                  <a class="collapse-item" href="admin_allBox.dc">전체문서함</a> 
	                  <a class="collapse-item" href="admin_waitBox.dc">결재대기함</a> 
	                  <a class="collapse-item" href="admin_complete.dc">결재완료함</a> 
	                  <div class="collapse-divider"></div>
	                  
	                  <hr>
	                  
	                  <h6 class="collapse-header">기타</h6>
	                  <a class="collapse-item" href="admin_enterBox.dc">입점신청함 &nbsp;&nbsp;
	                  	<span class="badge text-bg-danger"><c:out value="${'+'}${waitEnter}" /></span></a>
	                  <a class="collapse-item" href="admin_rcheckBox.dc">리뷰검토함 &nbsp;&nbsp;
	                  	<span class="badge text-bg-danger"><c:out value="${'+'}${waitRcheck}" /></span></a>
	               </div>
	            </div>
	         </li>

			<li class="nav-item">
				<a class="nav-link" href="list.nt"> 
					<i class="fas fa-fw fa-comments"></i> <span>공지사항</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="dlist.nt"> 
					<i class="fas fa-fw fa-comments"></i> <span>문의게시판</span>
				</a>
			</li>



			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			<!-- Sidebar Message -->
			<div class="sidebar-card d-none d-lg-flex">
				<img class="sidebar-card-illustration mb-2" src="resources/img/Bmart_logo.png" alt="...">
				<a class="btn btn-success btn-sm" href="main.mall"> Let's go BMart! </a>
			</div>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
							<span class="mr-2 d-none d-lg-inline text-primary">${loginInfo.name }</span>
								<i class="fi fi-bs-admin-alt" style="font-size: 25px;"></i>
							</a> 
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="adProfile.mb"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400">
									</i> Profile
								</a> 
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div>
						</li>
						<!-- Logout Modal-->
						<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">로그아웃하시겠습니까?</h5>
										<button class="close" type="button" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">Select "Logout" below if you are
										ready to end your current session.</div>
									<div class="modal-footer">
										<button class="btn btn-secondary" type="button"
											data-dismiss="modal">Cancel</button>
										<a class="btn btn-primary" href="logout.ad">Logout</a>
									</div>
								</div>
							</div>
						</div>
					</ul>
				</nav>