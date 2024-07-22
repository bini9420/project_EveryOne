<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- title icon-->
	<link rel="icon" type="image/x-icon" href="resources/img/baemin.png" />
	<title>배민</title>

	<!-- fonts -->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- CSS -->
	<link href="resources/css/mall.css" rel="stylesheet" />
	
	<style>
		#goBmart {
			background-color: white;
			font-family: "Spoqa Han Sans Neo", sans-serif;
		}
		#goBmart:hover {
			cursor: pointer;
			background-color: #F8F9FA;
		}
	</style>
</head>

<body class="bg-primary">
	<nav class="navbar navbar-expand-lg bg-light">
		<ul class="navbar-nav ms-auto" >
			<li class="nav-item mx-5" >
				<button  onClick="location='login.ad'" class="btn btn-light">관리자 로그인</button>
			</li>
		</ul>
	</nav>
	
	<nav class="navbar navbar-expand-lg w-75 mx-auto" style="margin-top:200">
		<div class="container">
			<ul class="navbar-nav mx-auto" >
				<li class="nav-item mx-5 pt-5" >
					<h1 class="display-5 text-white">
						데일리 아이템부터🧻<br>
						신선 먹거리까지🥩🥦<br>
						편하고 빠른 <font class="fw-bold">배민 <font color="#FFFC52">B</font>마트</font>
					</h1>
				</li>
				<li class="nav-item" >
					<img src="resources/img/baemin.png" class="mx-auto" style="width: 300;" alt="배민">
				</li>
			</ul>
		</div>
	</nav>
	<div class="text-center">
		<button class="btn btn-light" id="goBmart" onClick="location='main.mall'">B마트 바로가기👆🏻</button>
	</div>

	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	
	
</body>
</html>