<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>관리자</title>
	
	<!-- Custom fonts for this template-->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-rounded/css/uicons-bold-rounded.css">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-straight/css/uicons-bold-straight.css'>
	
	<!-- Custom styles for this page -->
	<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
	
	<style>  
		.btn-outline-info {          
			float: right;
			margin-left: 10px;
			font-size: 2rem;
			border: none;
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
			font-size: 9pt;
		}
		
		.title {
			text-align: center;
		}
		
		.chart-container {
			position: relative;
			height: 85%;
			width: 85%;
		}
	</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Side bar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Side bar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminMain.ad">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">관리자</div>
			</a>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Manage</div>

			<!-- 회원관리 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember"
					aria-expanded="true" aria-controls="collapseMember"> 
					<i class="fas fa-fw fa-wrench"></i>
					<span>회원관리</span>
				</a>
				<div id="collapseMember" class="collapse" aria-labelledby="headingMember" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Member Manage:</h6>
						<a class="collapse-item" href="aMemberList.mb">회원목록</a>
					</div>
				</div>
			</li>
			
			<!-- 상품관리 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
					aria-expanded="true" aria-controls="collapseProducts">
					<i class="fas fa-fw fa-wrench"></i>
					<span>상품관리</span>
				</a>
				<div id="collapseProducts" class="collapse" aria-labelledby="headingProducts" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Product Manage:</h6>
						<a class="collapse-item" href="productList.prd">상품목록</a> 
						<a class="collapse-item" href="productInsert.prd">상품등록</a> 
						<a class="collapse-item" href="productList.prd">상품수정</a> 
						<a class="collapse-item" href="productDelete.prd">상품삭제</a>
					</div>
				</div>
			</li>
			
			<!-- 매출관리 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSales"
					aria-expanded="true" aria-controls="collapseSales">
					<i class="fas fa-fw fa-wrench"></i>
					<span>매출관리</span>
				</a>
				<div id="collapseSales" class="collapse" aria-labelledby="headingSales" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Sales Manage:</h6>
						<a class="collapse-item" href="top.sale">상품 매출</a> 
						<a class="collapse-item" href="utilities-border.html">회원 매출</a>
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Approve</div>

			<!-- 결재함 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
					aria-expanded="true" aria-controls="collapsePages"> 
					<i class="fas fa-fw fa-folder"></i> 
					<span>결재함</span>
				</a>
				<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Approve Screens:</h6>
						<a class="collapse-item" href="login.html">전체문서함</a> 
						<a class="collapse-item" href="register.html">결재대기함</a> 
						<a class="collapse-item" href="forgot-password.html">결재완료함</a> 
						<a class="collapse-item" href="404.html">임시저장함</a> 
						<a class="collapse-item" href="blank.html">반려함</a>
						<div class="collapse-divider"></div>
						<hr>
						<h6 class="collapse-header">기타:</h6>
						<a class="collapse-item" href="404.html">리뷰검토함</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Charts -->
			<li class="nav-item">
				<a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> 
					<span>공지사항</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> 
					<span>문의사항</span>
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
				<img class="sidebar-card-illustration mb-2"
					src="resources/img/Bmart_logo.png" alt="...">
				<!-- <p class="text-center mb-2">
					<strong>관리자</strong> 
				</p> -->
				<a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro"> 
					Let's go BMart! 
				</a>
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

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none">
							<a class="nav-link dropdown-toggle" href="#" id="searchDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 
								<i class="fas fa-search fa-fw"></i>
							</a> 
							<!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-bell fa-fw"></i> 
								<!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
							</a> 
							<!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> 
								<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
							</div>
						</li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> 
								<span class="badge badge-danger badge-counter">7</span>
							</a> 
							<!-- Dropdown - Messages -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="resources/img/undraw_profile_1.svg" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="resources/img/undraw_profile_2.svg" alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="resources/img/undraw_profile_3.svg" alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">

										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> 
								<a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
								<div class="topbar-divider d-none d-sm-block"></div>
							</div>
						</li>


						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginInfo.name }</span>
								<i class="fi fi-bs-admin-alt" style="font-size: 25px;"></i>
							</a> 
							<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 
									Profile
								</a> 
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> 
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
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
									<div class="modal-body">
										Select "Logout" below if you are ready to end your current session.
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
										<a class="btn btn-primary" href="login.ad">Logout</a>
									</div>
								</div>
							</div>
						</div>

					</ul>
				</nav>
				<!-- Top 끝!  -->