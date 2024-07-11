<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




<h1 class="h3 mb-2 text-gray-800 title">상품 상세화면</h1>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<button type="button" class="btn-outline-info"
				onclick="location.href='productList.prd?pageNumber=${param.pageNumber}&keyword=${keyword }'">
				<i class="fi fi-rr-list"></i>
			</button>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable">
				<form:form commandName="product" action="productList.prd"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="pnum" value="${product.pnum }">
					<input type="hidden" name="pageNumber" value="${param.pageNumber}">
					<input type="hidden" name="keyword" value="${param.keyword}">
					<tr>
						<th>상품번호</th>
						<td>${product.pnum }</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${product.pcategory}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${product.pname }</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>${product.price }</td>
					</tr>
					<tr>
						<th>상품등록일</th>
						<td>${fn:substring(product.inputdate, 0, 10)}</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>${product.stock }</td>
					</tr>
					<tr>
						<th>설명</th>
						<td>${product.pcontent }</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td><img
							src="<%=request.getContextPath() + "/resources/uploadImage/" %>${product.pimage}"
							width="100" height="100" /> <br></td>
					</tr>
				</form:form>
			</table>
		</div>
	</div>
</div>

<%@include file="../admin/a_bottom.jsp"%>