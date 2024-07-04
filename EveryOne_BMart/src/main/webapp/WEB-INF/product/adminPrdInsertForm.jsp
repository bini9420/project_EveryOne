<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




<form:form commandName="product" action="productInsert.prd" method="post" enctype="multipart/form-data">

	<input type="hidden" name="pageNumber" value="${pageNumber}">


	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품추가</h1>


	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				Product
				<button type="submit" class="btn-outline-info">
					<i class="fi fi-br-plus-small"></i>
				</button>
				<button type="button" class="btn-outline-info" onclick="location.href='productList.prd?pageNumber=${pageNumber}'">
					<i class="fi fi-rr-list"></i>
				</button>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>

						<tr>
							<th>카테고리</th>
							<%
							String category[] = { "쌀/잡곡/견과", "밥/도시락", "국/탕/찌개", "음료/커피/생수", "요리/반찬", "정육/수산/계란", "라면/면", "과일/채소", "양념/장류/오일",
									"우유/유제품", "햄/어묵/통조림", "생활/기타", "배달용품", "주방용품" };
							
							%>



							<td><select name="pcategory">
									<c:forEach var="pcate" items="<%=category%>">
										<option value="${pcate }"
											<c:if test="${product.pcate==pcate}">selected</c:if>>${pcate }</option>

									</c:forEach>
							</select> <form:errors path="pcategory" cssClass="error"></form:errors></td>
						</tr>

						<tr>
							<th>등록인아이디</th>
							<td>${loginInfo.id}<form:errors path="id" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>상품이름</th>
							<td><input type="text" name="pname" value="${product.pname}">
								<form:errors path="pname" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>상품이미지</th>
							<td><input type="file" name="upload"
								value="${product.pimage}"> <form:errors path="pimage"
									cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" value="${product.price}">
								<form:errors path="price" cssClass="err"></form:errors></td>
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
								value="${product.expritydate}"> <form:errors
									path="expritydate" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="text" name="capacity"
								value="${product.capacity}"> <form:errors
									path="capacity" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea name="pcontent" id="content"
									value="${product.pcontent}"></textarea> <form:errors
									path="pcontent" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>재고</th>
							<td><input type="text" name="stock" value="${product.stock}">
								<form:errors path="stock" cssClass="err"></form:errors></td>
						</tr>


						<tr>
							<th>분류</th>
							<td>
								<%
								String[] mall = { "B마트", "배민상회" };
								%> <c:forEach var="mall"
									items="<%=mall%>">
									<input type="radio" name="mall" value="${mall}"
										<c:if test="${product.mall eq mall}">checked</c:if>>${mall}
								</c:forEach> <form:errors path="mall" cssClass="err" />
							</td>
						</tr>
						
					</thead>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<center>${pageInfo.pagingHtml }</center>
</form:form>
