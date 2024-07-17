<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">상품수정</h1>

<form:form commandName="product" action="productUpdate.prd"
	method="post" enctype="multipart/form-data">

	<input type="hidden" name="pnum" value="${product.pnum }">
	<input type="hidden" name="pageNumber" value="${param.pageNumber}">
	<input type="hidden" name="keyword" value="${param.keyword}">

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<button type="submit" class="btn-outline-info">
					<i class="fi fi-rr-file-edit"></i>
				</button>
				<button type="button" class="btn-outline-info"
					onclick="location.href='productList.prd?pageNumber=${param.pageNumber}&keyword=${keyword }'">
					<i class="fi fi-rr-list"></i>
				</button>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">



					<!-- <table> -->
					<tr>
						<th>상품번호</th>
						<td>${product.pnum }<form:errors path="pnum" class="err" />
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${product.pcategory }<form:errors path="pcategory"
								class="err" />
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="pname" value="${product.pname }">
							<form:errors path="pname" class="err" /></td>
					</tr>

					<tr>
						<th>가격</th>
						<td><input type="text" name="price" value="${product.price }">
							<form:errors path="price" class="err" /></td>
					</tr>

					<tr>
						<th>주문횟수</th>
						<td>${product.ordercount }</td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" name="stock" value="${product.stock }">
						</td>
					</tr>

					<tr>
						<th>설명</th>
						<td><input type="text" name="pcontent"
							value="${product.pcontent }"> <form:errors
								path="pcontent" class="err" /></td>
					</tr>

					<tr>
						<th>상품 이미지</th>
						<td><img
							src="<%=request.getContextPath() + "/resources/uploadImage/" %>${product.pimage}"
							width="100" height="100" /> <br> <br> <input
							type="file" name="upload" value="${product.pimage }"><br>
							<br> <!-- upload:새로 업로드할 파일명 --> <input type="text"
							name="upload2" value="${product.pimage }"> <!-- upload2:삭제할 파일명 -->
						</td>
					</tr>

				</table>
</form:form>
