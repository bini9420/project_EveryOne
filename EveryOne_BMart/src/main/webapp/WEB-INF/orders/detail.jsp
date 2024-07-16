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

/* New CSS rules for the order details section */
.order-details {
	width: 100%;
	margin: 20px 0;
}

.order-details h5 {
	text-align: center;
	margin-bottom: 20px;
}

.order-details .content-container {
	margin: auto;
	width: 50%;
	text-align: center;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 8px;
	background-color: #f9f9f9;
}

.order-details .content-container p {
	margin: 10px 0;
	font-size: 16px;
}

.order-details .content-container strong {
	color: #333;
}

.order-details .content-container button {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #48D1CC;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.order-details .content-container button:hover {
	background-color: #48D1CC;
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
	<div class="row order-details">
		<h5 class="card-title text-primary fw-bolder">주문내역</h5>
		<div class="content-container">
			<p>
				<strong>주문번호:</strong> ${order.onum}
			</p>
			<p>
				<strong>고객 ID:</strong> ${order.id}
			</p>
			<p>
				<strong>상품번호:</strong> ${order.pnum}
			</p>
			<p>
				<strong>수량:</strong> ${order.pamount}
			</p>
			<p>
				<strong>금액:</strong> ${order.price}
			</p>
			<p>
				<strong>배송 방법:</strong> ${order.way}
			</p>
			<p>
				<strong>상태:</strong> ${order.status}
			</p>
			<p>
				<strong>요청사항:</strong> ${order.contents}
			</p>
			<p>
				<strong>결제 방법:</strong> ${order.payment}
			</p>
			<p>
				<strong>주문일:</strong> ${order.orderdate}
			</p>
			<button
				onClick="location.href='list.od?pageNumber=${param.pageNumber}'">돌아가기</button>
		</div>
	</div>
</div>

<!-- /.container-fluid -->

<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>
