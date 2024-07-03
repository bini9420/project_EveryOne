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
	<link href="resources/css/mall-style.css" rel="stylesheet" />
	<!-- carousel --> <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- fonts -->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- 추가적인 스타일 작업 -->
	<link href="resources/css/mall-style-plus.css" rel="stylesheet">
</head>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg">
	<div class="container px-4 px-lg-5">
		<img src="resources/img/Bmart_logo.png" alt="B마트_logo" style="width:200; height: 60">&nbsp;&nbsp;
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="plists.mall" method="post">
            <div class="input-group">
                <input type="text" class="form-control bg-light border-0 px-5" placeholder="상품을 검색하세요(●'◡'●)"
                    aria-label="Search" aria-describedby="basic-addon2" name="keyword">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">
                        <i class="fi fi-rr-search search"></i>
                    </button>
                </div>
            </div>
        </form>
		<div class="collapse navbar-collapse ms-lg-5" id="navbarSupportedContent">
			<ul class="navbar-nav mb-2 mb-lg-0 ms-lg-5 ps-lg-5">
				<li class="nav-item ms-lg-5">
					<!-- home icon -->
					<a class="nav-link active" aria-current="page" href="main.mall">
						<i class="fi fi-rr-home icon"></i>
					</a>
				</li>
				<li class="nav-item">
					<!-- heart icon -->
					<a class="nav-link active" aria-current="page" href="#!">
						<i class="fi fi-rr-heart icon"></i>
					</a>
				</li>
				<li class="nav-item">
					<!-- cart icon -->
					<a class="nav-link active" aria-current="page" href="#!">
						<i class="fi fi-rr-shopping-basket icon"></i>
						<!-- Counter - Messages -->
                        <span class="badge badge-danger badge-counter">7</span>
					</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fi fi-rr-user icon"></i>
						<c:if test="${loginInfo ne null}">
							<font size="3" style="font-weight: bold">${loginInfo.name}님</font>
						</c:if>
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${loginInfo eq null}">
							<li>
								<a class="dropdown-item" href="loginForm.mb">
									<i class="fi fi-rr-users"> 로그인 </i>
								</a>
							</li>
							<li><hr class="dropdown-divider" /></li>
							<li>
								<a class="dropdown-item" href="#!">
									<i class="fi fi-rr-user-add"> 회원가입 </i>
								</a>
							</li>
						</c:if>
						<c:if test="${loginInfo ne null}">
							<li>
								<a class="dropdown-item" href="#!">
									<i class="fi fi-rr-circle-user"> 마이페이지 </i>
								</a>
							</li>
							<li><hr class="dropdown-divider" /></li>
							<li>
								<a class="dropdown-item" href="#!">
									<i class="fi fi-rr-sign-out-alt"> 로그아웃 </i>
								</a>
							</li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- category -->
<nav class="navbar navbar-expand-lg">
	<div class="container px-4 py-1" style="border-bottom: 1px solid #D3D3D3; border-top: 1px solid #D3D3D3">
		<ul class="navbar-nav " >
			<li class="nav-item dropdown mx-5">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<font size="3" style="font-style: normal;">카테고리</font>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="category" items="${categoryLists}">
						<c:if test="${category.num <= 12}">
							<li>
								<a class="dropdown-item" href="plists.mall?category=${category.name}">
									${category.name}
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="#!">
					신상품
				</a>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="#!">
					베스트 상품
				</a>
			</li>
		</ul>
	</div>
</nav>

<!-- TOP button	 -->
<a href="#" class="float">
	<i class="fi fi-rr-arrow-small-up my-float"></i>
</a>