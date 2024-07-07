<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<!-- title icon-->
	<link rel="icon" type="image/x-icon" href="resources/img/B.png" />
	<title>배민 B마트</title>
	
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
	
	<!--  -->
	<link href="resources/css/mall-plus.css" rel="stylesheet" type="text/css">

</head>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg">
	<div class="container">
		<img src="resources/img/Bmart_logo.png" alt="B마트_logo" style="width:200; height: 60">&nbsp;&nbsp;
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="plists.mall">
	        <div class="input-group">
				<input type="hidden" name="mall" value="${mall}">
			    <input type="text" class="form-control bg-light border-0 px-3" placeholder="상품을 검색하세요(●'◡'●)"
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
					<a class="nav-link active" aria-current="page" href="interest.mall">
						<i class="fi fi-rr-heart icon"></i>
					</a>
				</li>
				<li class="nav-item">
					<!-- cart icon -->
					<a class="nav-link active" aria-current="page" href="cart.mall">
						<i class="fi fi-rr-shopping-basket icon"></i>
						<!-- Counter - Messages -->
						<c:if test="${loginInfo ne null}">
                        	<span class="badge badge-danger badge-counter">${cartTotalCount}</span>
                        </c:if>
					</a>
				</li>
				<c:if test="${loginInfo eq null}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fi fi-rr-user icon"></i>
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li>
								<a class="dropdown-item" href="bmartLogin.mb">
									<i class="fi fi-rr-users"> 로그인 </i>
								</a>
							</li>
							<li><hr class="dropdown-divider" /></li>
							<li>
								<a class="dropdown-item" href="#!">
									<i class="fi fi-rr-user-add"> 회원가입 </i>
								</a>
							</li>
						</ul>
					</li>
				</c:if>
				<c:if test="${loginInfo ne null}">
					<li class="nav-item">
						<!-- heart icon -->
						<a class="nav-link active" aria-current="page" href="mypage.mall">
							<i class="fi fi-rr-user icon"></i>
							<font class="fs-6 text-primary fw-bolder">${loginInfo.name} 님</font>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<!-- category -->
<nav class="navbar navbar-expand-lg mx-auto" style="border-bottom: 1px solid #D3D3D3; box-shadow: 0px 3px 5px -2px gray">
	<div class="container px-4">
		<ul class="navbar-nav" >
			<li class="nav-item dropdown mx-5">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<font size="3" style="font-style: normal;">카테고리</font>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="clists" items="${categoryLists}">
						<li>
							<a class="dropdown-item" href="plists.mall?category=${clists.category}&mall=${mall}">
								${clists.category}
							</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="plists.mall?mall=${mall}">
					<img src="resources/img/new.png" style="width: 25">
					신상품
				</a>
			</li>
			<li class="nav-item mx-5" >
				<a class="nav-link" aria-current="page" href="bestLists.mall">
					<img src="resources/img/hot.png" style="width: 25">
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