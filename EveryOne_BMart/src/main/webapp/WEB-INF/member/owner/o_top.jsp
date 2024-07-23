<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp"%>    
<!DOCTYPE html>
<html lang="en">
<style>
	body {
		font-family: "Spoqa Han Sans Neo", sans-serif;
	}
	.pagination-wrapper {
		display: flex;
		justify-content: center;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function show() {
		$('#documentWrite .modal-content').load("document_write.dc");
		$('#documentWrite').modal('show');
		$('#requestDocument').css('bgcolor', '#2ac1bc');
		$('#requestDocumnet').css('border-color', '#bae8e6');
	}
	
	function clickBell() { //종모양 클릭시 빨간색 말풍선 사라짐
		var bellElement = document.getElementById('bell');
	    if (bellElement) {
	        bellElement.style.display = 'none';
	    }
	}
</script>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-rounded/css/uicons-bold-rounded.css">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-bold-straight/css/uicons-bold-straight.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    
</head>
 
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="omain.mb">
                <div class="sidebar-brand-icon">
                	<img src="<%=request.getContextPath()%>/resources/images/Blogo.png" width="40" height="40">
                </div>
                <div class="sidebar-brand-text mx-3">EveryOne<br>B-Mart</div>
            </a>
   
            <!-- Owner -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="omain.mb"> 
                	<i class="fas fa-fw fa-tachometer-alt"></i> 
                	<span><b>${loginInfo.name}</b>님</span>
				</a>
			</li>
            
             <!-- Register -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading"> Product </div>
            
            <!-- 물품 등록 Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseFive"
                    aria-expanded="true" aria-controls="#collapseFour">
                    <i class="fas fa-fw fa-plus"></i>
                    <span>상품관리</span>
                </a>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="productInsert_owner.prd">상품등록</a>
                        <a class="collapse-item" href="productList.prd">상품목록</a>          
                    </div>
                </div>
            </li>
			<li class="nav-item">
				<a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseSix"
				aria-expanded="true" aria-controls="#collapseFour"> <i
					class="fas fa-fw fa-comments"></i> <span>상품리뷰</span>
				</a>
				<div id="collapseSix" class="collapse"
					aria-labelledby="headingFour" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="allrvlist.rv">전체 리뷰</a>
						<a class="collapse-item" href="listRV.prd">상품별 리뷰</a>
					</div>
				</div>
			</li>

			<!-- Manage -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading"> Manage </div>
            
            <!-- 매출관리 Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
                    aria-expanded="true" aria-controls="#collapseFour">
                    <i class="fas fa-fw fa-comments-dollar"></i>
                    <span>매출관리</span>
                </a>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Sales</h6>
                        <a class="collapse-item" href="owner_prdSales.sale">상품별 매출현황</a>
                        <a class="collapse-item" href="list.od">전체 매출현황</a>
                    </div>
                </div>
            </li>
            
            <!-- 재고관리 Menu -->
            <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-box"></i>
                    <span>재고관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Stock</h6>
                        <a class="collapse-item" href="owner_prdUpdate.prd">전체 재고현황</a>
                    </div>
                </div>
            </li> -->


            <!-- 전자결재 -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading"> Electronic-approval </div>
            
            <!-- 결재작성 -->
            <li class="nav-item">
                <a class="nav-link" href="javascript:show()">
                    <i class="fas fa-fw fa-pen"></i>
                    <span>결재작성</span>
                </a>
            </li>
            
			<!-- 결재 요청 작성 모달 -->
			<div class="modal fade" id="documentWrite" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
	
			    </div>
			  </div>
			</div>
            
            <!-- 결재함 Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
                    aria-expanded="true" aria-controls="collapseOne">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>결재함</span>
                </a>
                <div id="collapseOne" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">결재상신함</h6>
                        <a class="collapse-item" href="document_allBox.dc">전체문서함</a>
                        <a class="collapse-item" href="document_wait.dc">결재대기함</a>
                        <a class="collapse-item" href="document_approve.dc">결재완료함</a>
                        <a class="collapse-item" href="document_temp.dc">임시저장함</a>
                        <a class="collapse-item" href="document_return.dc">반려함</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">기타</h6>
                        <a class="collapse-item" href="rcheckList.dc">리뷰검토함</a>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="<%=request.getContextPath()%>/resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>B-마트</strong> Home으로 이동!</p>
                <a class="btn btn-success btn-sm" href="main.mall">Go to B-MART page</a>
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
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginInfo.id}</span>
                                <i class="fas fa-heart text-gray-800"></i>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->