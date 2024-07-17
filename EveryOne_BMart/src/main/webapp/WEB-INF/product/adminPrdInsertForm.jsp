<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




<%String pcate[]={"쌀/잡곡/견과","국/탕/찌개","음료/커피/생수","정육/수산/계란","라면/면","과일/채소","양념/장류/오일","우유/유제품","햄/어묵/통조림","생활/기타"}; %>



<form:form commandName="product" name="myform"
	action="productInsert.prd" method="post" enctype="multipart/form-data">

	<input type="hidden" name="pageNumber" value="${pageNumber}">


	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 title">상품추가</h1>


	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">

				<button type="submit" class="btn-outline-info">
					<i class="fi fi-br-plus-small"></i>
				</button>
				<button type="button" class="btn-outline-info"
					onclick="location.href='productList.prd?pageNumber=${pageNumber}'">
					<i class="fi fi-rr-list"></i>
				</button>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">


					<tr>
						<th>카테고리</th>
						<td><select name="pcategory">
								<c:forEach var="cate" items="<%=pcate %>">
									<option value="${cate}"
										<c:if test="${product.cate eq cate}">selected</c:if>>${cate}</option>
								</c:forEach>
						</select></td>

					</tr>

					<tr>
						<th>등록인아이디</th>
						<td><input type="hidden" name="id" value="${loginInfo.id}">${loginInfo.id}</td>
					</tr>
					<tr>
						<th>상품이름</th>
						<td><input type="text" name="pname" value="${product.pname}">
							<form:errors path="pname" cssClass="err"></form:errors></td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td><input type="file" name="upload"
							value="${product.pimage}"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" value="${product.price}"></td>
					</tr>
					<tr>
						<th>원산지</th>
						<td><input type="text" name="origin"
							value="${product.origin}"> <form:errors path="origin"
								cssClass="err"></form:errors></td>
					</tr>
					<tr>
						<th>소비기한</th>
						<td><input type="text" name="expritydate"
							value="${product.expritydate}"></td>
					</tr>
					<tr>
						<th>중량/용량</th>
						<td><input type="text" name="capacity"
							value="${product.capacity}"></td>
					</tr>
					<tr>
					    <th>설명</th>
					    <td>
					        <textarea name="pcontent" id="content" value="${product.pcontent}"></textarea>
					        <form:errors path="pcontent" cssClass="err"></form:errors>
					    </td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td><input type="date" name="inputdate"
							value="<c:out value='${fn:substring(product.inputdate, 0, 10)}' />">
						</td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" name="stock" value="${product.stock}"></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</form:form>
<%@include file="../admin/a_bottom.jsp"%>
