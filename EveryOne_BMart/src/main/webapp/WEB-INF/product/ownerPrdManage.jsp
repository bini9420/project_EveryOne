<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
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

.product-list {
	width: 100%;
	margin: 20px 0;
}

.product-list table {
	width: 100%;
	border-collapse: collapse;
}

.product-list th, .product-list td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.product-list th {
	background-color: #f2f2f2;
	color: black;
}

.product-list tr:hover {
	background-color: #f1f1f1;
}

.product-list .no-products {
	text-align: center;
	color: red;
}

.product-list .pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: #007bff;
}

.product-list .pagination a.active {
	font-weight: bold;
	color: #0056b3;
}

.product-list .search-form {
	margin: 20px 0;
	text-align: center;
}

.product-list .search-form input[type="text"] {
	width: 200px;
	padding: 5px;
}

.product-list .search-form input[type="submit"] {
	padding: 5px 10px;
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

		<form action="${pageContext.request.contextPath}/owner_prdUpdate.prd"
			method="post" enctype="multipart/form-data" class="insertPrd">
			<input type="hidden" name="pnum" value="${product.pnum}"> 
			<input type="hidden" name="upload2" value="${product.pimage}"> 
			<input type="hidden" name="pageNumber" value="${pageNumber}"> 
			<label for="pname">상품 이름:</label> 
			<input type="text" id="pname" name="pname" value="${product.pname}" required> 
			<label for="price">가격:</label> 
			<input type="number" id="price" name="price" value="${product.price}" required> 
			<label for="stock">재고:</label>
			<input type="number" id="stock" name="stock" value="${product.stock}" required> 
			<label for="capacity">용량:</label> 
			<input type="text" id="capacity" name="capacity" value="${product.capacity}" required> 
			<label for="pcontent">설명:</label>
			<textarea id="pcontent" name="pcontent" required>${product.pcontent}</textarea>

			<label for="expritydate">유통기한:</label> 
			<input type="text" id="expritydate" name="expritydate" value="${product.expritydate}" required> 
			<label for="origin">원산지:</label> 
			<input type="text" id="origin" name="origin" value="${product.origin}" required>
			<label for="pcategory">카테고리:</label>
			<select id="pcategory" name="pcategory" required>
				<option value="전자기기" ${product.pcategory == '11' ? 'selected' : ''}>전자기기</option>
				<option value="가구·인테리어" ${product.pcategory == '12' ? 'selected' : ''}>가구·인테리어</option>
				<option value="주방용품" ${product.pcategory == '13' ? 'selected' : ''}>주방용품</option>
				<option value="반려용품" ${product.pcategory == '14' ? 'selected' : ''}>반려용품</option>
				<option value="스포츠·레저·캠핑" ${product.pcategory == '15' ? 'selected' : ''}>스포츠·레저·캠핑</option>
			</select> 
			<label for="upload">이미지:</label> 
			<input type="file" id="upload" name="upload"> 
			<br> <br>
			<button type="submit">수정</button>
			<br>
			<button type="button" onclick="history.back()">돌아가기</button>
		</form>
	</div>
	<!-- /.container-fluid -->
</div>

<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>
