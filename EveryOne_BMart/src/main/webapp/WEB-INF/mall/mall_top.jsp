<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<head>
	<title>배민 B마트</title>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="resources/mall/assets/favicon.ico" />
	
	<!-- icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-brands/css/uicons-brands.css'>
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="resources/css/mall_style.css" rel="stylesheet" />
	
	<!-- search, carousel 등 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- fonts -->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<style>
		.bottom_icon{
			font-size: 35;
			color: white;
			margin: 0 15 0 0
		}
		.icon{
			font-size: 28;
			color: gray
		}
		.product{
			font-size: 100;
			color: gray
		}
		.search{
			font-size: 18
		}
		.keyword{
			margin: 35 10 0 20;
			width : 300;
			height: 40;
			padding-left: 10
		}
		.footer1{
			margin: 2 auto;
			border-top: 1px solid #F5F5F5;
			border-bottom: 1px solid #F5F5F5;
			width: 100%;
			text-align: center
		}
		.footer1 td{
			padding: 10 30
		}
		.footer2 td{
			padding: 10 100 10 0
		}
		.highlight{
			font-weight: bold
		}
		.float{
			position:fixed;
			width:30px;
			height:60px;
			bottom:40px;
			right:40px;
			color:#D3D3D3;
			text-align:center;
			font-size: 45;
		}
		.float:hover{
			text-decoration: none;
			color: #2ac1bc
		}
		.my-float{
			margin-top:22px;
		}
		a:hover{
			text-decoration: none;
		}
		.productImg{
			width : 100;
			margin : 10 0
		}
	</style>
</head>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg">
	<div class="container px-4 px-lg-5">
		<img src="resources/img/Bmart_logo.png" alt="B마트_logo" style="width:200; height: 60">&nbsp;&nbsp;
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="main.mall" method="post">
            <div class="input-group">
                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                    aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">
                        <i class="fi fi-rr-search search"></i>
                    </button>
                </div>
            </div>
        </form>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" >
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="main.mall">
						<i class="fi fi-rr-home icon"></i>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="#!">
						<i class="fi fi-rr-heart icon"></i>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="#!">
						<i class="fi fi-rr-shopping-basket icon"></i>
						<!-- Counter - Messages -->
                        <span class="badge badge-danger badge-counter">7</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="#!">
						<i class="fi fi-rr-user icon"></i>
					</a>
				</li>
				<!-- 
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="resources/img/user.png" alt="user" class="top_icon">
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li>
							<a class="dropdown-item" href="#!">
								<img src="resources/img/user.png" alt="user" class="dropdown_icon">
								Profile
							</a>
						</li>
						<li><hr class="dropdown-divider" /></li>
						<li>
							<a class="dropdown-item" href="#!">
								<img src="resources/img/logout.png" alt="logout" class="dropdown_icon">
								Logout
							</a>
						</li>
					</ul>
				</li>
				 -->
			</ul>
		</div>
	</div>
</nav>

<!-- category -->
<nav class="navbar navbar-expand-lg">
	<div class="container px-4 px-lg-5">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" >
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fi fi-rr-menu-burger icon"></i>카테고리
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="category" items="${categoryLists}">
						<c:if test="${category.num <= 12}">
							<li>
								<a class="dropdown-item" href="#!">
									${category.name}
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
</nav>

