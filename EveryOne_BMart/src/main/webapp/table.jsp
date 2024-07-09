<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="WEB-INF/common/common.jsp"%>
<%@include file="WEB-INF/admin/a_top.jsp"%>

	<form:form commandName="product" name="myform" action="productInsert.prd" method="post" enctype="multipart/form-data">
<body onLoad="init('${product.mall }','${product.pcategory}')"> 
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
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">


						<tr>
							<th>카테고리</th>



							<td><select id="first" name="mall" onChange="firstChange()"
								style="width: 150px" >

							</select> <select id="second"
								name="pcategory" onChange="secondChange()" style="width: 150px" ></select>
								</td>
						</tr>



						<tr>
							<th>등록인아이디</th>
							<td><input type="hidden" name="id" value="${sessionScope.loginInfo.id}">${sessionScope.loginInfo.id}</td>
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
							<th>수량</th>
							<td><input type="text" name="capacity"
								value="${product.capacity}"></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea name="pcontent" id="content"
									value="${product.pcontent}"></textarea> <form:errors
									path="pcontent" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>재고</th>
							<td><input type="text" name="stock" value="${product.stock}"></td>
						</tr>


						<tr>
							<th>분류</th>

							<td>
									<%
									String[] mall = { "B마트", "배민상회" };
									%> <c:forEach var="mall" items="<%=mall%>">
										<c:choose>
											<c:when test="${mall eq 'B마트'}">
												<input type="radio" name="mall" value=0
													<c:if test="${product.mall eq 0}">checked</c:if>>${mall }
       		 								</c:when>
											<c:when test="${mall eq '배민상회'}">
												<input type="radio" name="mall" value=1
													<c:if test="${product.mall eq 1}">checked</c:if>>${mall }
        									</c:when>
										</c:choose>
									</c:forEach> 
								</td>
					</table>
				</div>
			</div>
		</div>

		<center>${pageInfo.pagingHtml }</center>
	</form:form>