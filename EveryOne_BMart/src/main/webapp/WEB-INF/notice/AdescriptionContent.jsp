<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ include file="../common/common.jsp" %>
<style>
 #approveBox:hover {
 	cursor: pointer;
 }
h6 {
	display: inline-block;
}

.btn-outline-primary {
	width: 30px;
	height: 30px;
}

#requestDocument:hover {
	background-color: #7dc9c6 !important;
	border-color: #bae8e6 !important;
}

body {
	font-family: Arial, sans-serif;
	background-color: #F5F5F5;
	color: #333333;
}

h1 {
	color: #48D1CC;
}

form {
	margin: 20px auto;
	text-align: center;
}

select, input[type="text"], input[type="submit"], input[type="button"] {
	padding: 10px;
	border: 1px solid #CCCCCC;
	border-radius: 5px;
	margin: 5px;
}

input[type="submit"], input[type="button"] {
	background-color: #48D1CC;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #009f8e;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #CCCCCC;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #48D1CC;
	color: white;
}

td {
	background-color: white;
}

a {
	text-decoration: none;
	color: #00C7AE;
}

a:hover {
	text-decoration: underline;
}

.paging {
	text-align: center;
	margin: 20px;
}

.paging a {
	margin: 0 5px;
	color: #00C7AE;
}

.paging a:hover {
	text-decoration: underline;
}
</style>

<%@ include file="../admin/a_top.jsp"%>

<a href="top.sale"></a>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50"></i> 
			Generate Report
		</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<table border="1" width="600">
			<tr align="center" height="30">
				<td width="150">글번호</td>
				<td width="150">${db.dnum }</td>
			</tr>
			<tr>
				<td width="150">작성자</td>
				<td width="150">${db.id }</td>
				<td width="150">작성일</td>
				<td width="150">${db.ddate }</td>
			</tr>
			<tr>
				<td width="150">글제목</td>
				<td width="150" colspan="4">${db.dsubject }</td>
			</tr>
			<tr>
				<td width="150">글내용</td>
				<td width="150" colspan="4">${db.dcontent }</td>
			</tr>
			<tr align="center" height="30">
				<td colspan="4"><c:if test="${loginInfo.id == db.id}">
						<input type="button" value="글수정"
							onClick="location.href='dupdate.nt?dnum=${db.dnum }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					</c:if> <c:if test="${loginInfo.id == db.id || loginInfo.id == 'admin'}">
						<input type="button" value="글삭제"
							onClick="location.href='ddelete.nt?dnum=${db.dnum }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					</c:if> <input type="button" value="답글쓰기"
					onClick="location.href='dreply.nt?ref=${db.ref }&re_step=${db.re_step }&re_level=${db.re_level }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					<input type="button" value="글목록"
					onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
				</td>
			</tr>

		</table>
		
	</div>
</div>
<%@include file="../admin/a_bottom.jsp"%>