<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>start</title>

<html>
<head>
	<meta charset="UTF-8">
	<link href="resources/css/mall.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-expand navbar-dark bg-light">
		<div class="container">
			<div class="navbar-header">
				<a href="login.ad" class="text-dark">관리자 로그인</a>
			</div>
		</div>
	</nav>
	
	<nav class="navbar navbar-expand navbar-dark bg-primary h-75 p-4">
		<div class="container">
			<h1 class="display-5">데일리 아이템부터<br>신선 먹거리까지<br>편하고 빠른 배민 B마트</h1>
			<button class="btn btn-light" onClick="location='main.mall'">마트 둘러보기</button>
		</div>
		<div class="container">
			<img src="resources/img/baemin.png" class="mx-auto w-75" alt="배민">
		</div>
	</nav>

</body>

</html>