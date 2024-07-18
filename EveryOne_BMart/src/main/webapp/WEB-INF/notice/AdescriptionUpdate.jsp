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

		<form:form commandName="db" action="dupdate.nt" method="post">
			<input type="hidden" name="dnum" value="${db.dnum }">
			<input type="hidden" name="pageNumber" value="${param.pageNumber }">
			<table border="1" width="500">
				<tr>
					<td align="right" colspan="2"><a
						href="dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}">글목록</a>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="dsubject" value="${db.dsubject }">
						<form:errors path="dsubject" class="err" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="dcontent" rows="5" cols="50">${db.dcontent }</textarea>
						<form:errors path="dcontent" class="err" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="password"> <form:errors
							path="password" class="err" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="hidden"
						name="dnum" value="${param.dnum }"> <input type="hidden"
						name="pageNumber" value="${param.pageNumber}"> <input
						type="hidden" name="whatColumn" value="${param.whatColumn}">
						<input type="hidden" name="keyword" value="${param.keyword}">
						<input type="submit" value="글수정"> <input type="button"
						value="다시작성" onClick="location.reload()"> <input
						type="button" value="목록보기"
						onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					</td>
				</tr>
			</table>
		</form:form>
		
	</div>
</div>
<%@include file="../admin/a_bottom.jsp"%>