<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- Begin Page Content -->
<style>
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

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function show() {
		$('#documentWrite .modal-content').load("document_write.dc");
		$('#documentWrite').modal();
		$('#requestDocument').css('bgcolor', '#2ac1bc');
		$('#requestDocumnet').css('border-color', '#bae8e6');
	}
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-3">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="javascript:show()" data-bs-toggle="modal"
			data-bs-target="#documentWrite"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50" id="requestDocument"></i>
			결재 요청</a>

		<div class="modal fade" id="documentWrite" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<form action="ddelete.nt" method="POST">
			<table border="1" align="center">
				<tr>
					<td>비밀번호를 입력해 주세요.</td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td><input type="hidden" name="dnum" value="${param.dnum }">
						<input type="hidden" name="pageNumber" value="${param.pageNumber}">
						<input type="hidden" name="whatColumn" value="${param.whatColumn}">
						<input type="hidden" name="keyword" value="${param.keyword}">
						<input type="submit" value="글삭제"> <input type="button"
						value="글목록"
						onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>