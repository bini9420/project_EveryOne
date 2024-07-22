<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/a_top.jsp"%>

<h1 class="h3 mb-2 text-gray-800 title">상품 상세화면</h1>
	<div class="card shadow mx-auto my-4 w-75">
		<div class="card-header py-3" style="text-align: right;">
			<button type="button" class="btn btn-sm btn-secondary" onclick="location.href='adminProductList.prd?pageNumber=${param.pageNumber}&keyword=${keyword }'">
				<i class="fi fi-rr-list"></i> 목록보기
			</button>
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="dataTable">
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
					<td>${product.price }원</td>
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
					<td><img src="<%=request.getContextPath() + "/resources/uploadImage/" %>${product.pimage}" width="180"/> <br></td>
				</tr>
			</table>
		</div>
	</div>

<%@include file="../admin/a_bottom.jsp"%>