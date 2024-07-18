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

/* New CSS rules for the product list section */
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
	function confirmDelete(pnum, pageNumber) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = 'delete.prd?pnum=' + pnum + "&pageNumber=" + pageNumber;
            }
        }
        function goUpdate(pnum, pageNumber) {
            location.href="update.prd?pnum=" + pnum +"&pageNumber=" + pageNumber;
        }

</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid product-list">

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
		<form action="insert.prd" method="post" enctype="multipart/form-data"
			class="insertPrd">
			<label for="pname">상품 이름:</label> <input type="text" id="pname"
				name="pname" required> <label for="price">가격:</label> <input
				type="number" id="price" name="price" required> <label
				for="stock">재고:</label> <input type="number" id="stock" name="stock"
				required> <label for="capacity">용량:</label> <input
				type="text" id="capacity" name="capacity" required> <label
				for="pcontent">설명:</label>
			<textarea id="pcontent" name="pcontent" required></textarea>

			<label for="expritydate">유통기한:</label> <input type="text"
				id="expritydate" name="expritydate" required> <label
				for="origin">원산지:</label> <input type="text" id="origin"
				name="origin" required> <label for="pcategory">카테고리:</label>
			<select id="pcategory" name="pcategory" required>
				<option value="쌀/잡곡/견과">쌀/잡곡/견과</option>
				<option value="국/탕/찌개">국/탕/찌개</option>
				<option value="음료/커피/생수">음료/커피/생수</option>
				<option value="정육/수산/계란">정육/수산/계란</option>
				<option value="라면/면">라면/면</option>
				<option value="과일/채소">과일/채소</option>
				<option value="양념/장류/오일">양념/장류/오일</option>
				<option value="우유/유제품">우유/유제품</option>
				<option value="햄/어묵/통조림">햄/어묵/통조림</option>
				<option value="생활/기타">생활/기타</option>
			</select> <label for="upload">이미지:</label> <input type="file" id="upload"
				name="upload"> <input type="hidden" name="id"
				value="${loginInfo.id}"> <br> <br>
			<button type="submit">추가</button>
			<br>
			<button onclick="history.back()">돌아가기</button>
		</form>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>