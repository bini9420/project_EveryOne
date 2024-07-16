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

/* New CSS rules for the product section */
.product-info {
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	margin-top: 20px;
}

.product-image {
	margin-right: 20px;
}

.product-image img {
	width: 300px;
	height: 200px;
	object-fit: cover;
}

.product-details {
	flex-grow: 1;
}

.product-details p {
	font-size: 16px;
	margin: 5px 0;
}

.product-details p span {
	font-weight: bold;
}

.buttons {
	margin-top: 20px;
	text-align: center;
	width: 100%;
}

.buttons button {
	padding: 10px 20px;
	margin: 0 10px;
	font-size: 16px;
	cursor: pointer;
}

.prdDetail {
	width: 60%;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	border: 1px solid #CCCCCC;
	border-radius: 8px;
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
			location.href = 'delete.prd?pnum=' + pnum + "&pageNumber="
					+ pageNumber;
		}
	}
	function goUpdate(pnum, pageNumber) {
		location.href = "update.prd?pnum=" + pnum + "&pageNumber=" + pageNumber;
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
		<div class="prdDetail">
			<div class="product-info">
				<div class="product-image">
					<img
						src="<%=request.getContextPath()+"/resources/uploadImage/"%>${product.pimage}"
						alt="상품 이미지">
				</div>
				<div class="product-details">
					<p>
						<span>번호:</span> ${product.pnum}
					</p>
					<p>
						<span>이름:</span> ${product.pname}
					</p>
					<p>
						<span>가격:</span> ${product.price}
					</p>
					<p>
						<span>재고:</span> ${product.stock}
					</p>
					<p>
						<span>설명:</span> ${product.pcontent}
					</p>
					<p>
						<span>원산지:</span> ${product.origin}
					</p>
					<p>
						<span>카테고리:</span> ${product.pcategory }
					</p>
					<p>
						<span>유통기한:</span> ${product.expritydate}
					</p>
				</div>
			</div>
			<div class="buttons">
				<button onClick="location.href='list.rv?pnum=${product.pnum}'">리뷰</button>
				<br>
				<button onClick="history.back()">돌아가기</button>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>