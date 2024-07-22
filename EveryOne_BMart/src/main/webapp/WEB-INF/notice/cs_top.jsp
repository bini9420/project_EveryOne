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
	<link href="resources/css/mall.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- <link rel="stylesheet" type="text/css" href="resources/css/style.css"> -->
	
	<!-- fonts -->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<style>
		body {
			font-family: Arial, sans-serif;
		}
		
		/* 공지사항 리스트 */
		.containerN {
			width: 85%;
			margin: 0 auto;
			padding: 20px;
			background: #fff;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
		}
		
		/* 공지사항 목록 */
		.board-title {
			text-align: center;
			margin-bottom: 20px;
		}
		
		.board-table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 20px;
		}
		
		.board-table th{
			border: 1px solid #ddd;
			padding: 10 5;
			text-align: center;
		}
		
		.board-table td{
			border: 1px solid #ddd;
			padding: 5;
			text-align: center;
		}
		
		.board-table th {
			background-color: #f4f4f4;
		}
		
		.board-table td a {
			text-decoration: none;
			color: #333;
		}
		
		.board-table td a:hover {
			text-decoration: underline;
		}
		
		.no-content {
			text-align: center;
			padding: 20px;
		}
		
		.search-form {
			text-align: center;
			margin-bottom: 20px;
		}
		
		.search-form input[type="text"] {
			padding: 5px;
			width: 200px;
			border: 1px solid #ddd;
			border-radius: 4px;
		}
		
		.search-form input[type="submit"] {
			padding: 5px 10px;
			background-color: #48D1CC;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		.search-form input[type="submit"]:hover {
			background-color: #48D1CC;
		}
		
		.pagination {
			text-align: center;
			margin-top: 20px;
		}
		
		.plus_btn {
			padding: 5px 10px;
			background-color: #48D1CC;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		.pagination a {
			display: inline-block;
			padding: 5px 10px;
			margin: 0 5px;
			border: 1px solid #ddd;
			background-color: #f4f4f4;
			text-decoration: none;
			color: #333;
			border-radius: 4px;
		}
		
		.pagination a:hover {
			background-color: #ddd;
		}
		
		.pagination a.active {
			font-weight: bold;
			color: white;
			background-color: #4CAF50;
		}
		
		.content-details {
			padding: 10px;
			background-color: #f9f9f9;
			border: 1px solid #ddd;
			border-radius: 4px;
			margin-top: 10px;
		}
		
		.form-container {
			background-color: #f9f9f9;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		.form-container table {
			width: 100%;
		}
		
		.form-container td {
			padding: 10px 0;
		}
		
		.form-container input[type="text"], .form-container textarea,
			.form-container select {
			width: calc(100% - 20px);
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}
		
		.form-container input[type="submit"]:hover, .form-container button.plus_btn:hover
			{
			background-color: #008080;
		}
		
		.form-container .radio-group {
			display: flex;
			align-items: center;
		}
		
		.form-container .radio-group input[type="radio"] {
			margin: 0 10px 0 5px;
		}
		
		.table {
		    width: 100%;
		    margin-bottom: 1rem;
		    background-color: transparent;
		    border-collapse: collapse;
		}
		
		.table th,
		.table td {
		    padding: 0.75rem;
		    vertical-align: top;
		    border-top: 1px solid #dee2e6;
		    text-align: center;
		}
		
		.table thead th {
		    vertical-align: bottom;
		    border-bottom: 2px solid #dee2e6;
		}
		
		.table tbody + tbody {
		    border-top: 2px solid #dee2e6;
		}
		
		.table .table {
		    background-color: #f8f9fa;
		}
		
		.table th {
		    background-color: rgba(0, 0, 0, 0.05);
		    font-weight: bold;
		}
		
		.table tbody tr:hover {
		    background-color: rgba(110, 175, 176, 0.1);
		}
		
		.table .badge {
		    padding: 0.5em 0.75em;
		}
		
		.pagination a.active {
		    font-weight: bold;
		    color: #007bff;
		}
	</style>
	
</head>

<body class="bg-white">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-primary">
	<div class="container">
		<a href="list.nt" class="mx-auto my-2"><i class="fi fi-rr-chatbot-speech-bubble text-white fst-normal fw-bolder" style="font-size: 35"> 고객센터</i></a>
	</div>
</nav>
 