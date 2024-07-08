<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../member/owner/o_top.jsp" %>
<style>
	#boxName {
		margin: 25px 0px;
	}
</style>
<script>
	var f_selbox = new Array('B마트', '배민상회');

	var s_selbox = new Array();
	s_selbox[0] = new Array('쌀/잡곡/견과', '국/탕/찌개', '음료/커피/생수', '정육/수산/계란','라면/면','과일/채소','양념/장류/오일','우유/유제품','햄/어묵/통조림','생활/기타');
	s_selbox[1] = new Array('쌀/잡곡/견과', '야채/채소', '과일','축산/계란','수산/건어물','베이커리/디저트','유제품','배달용품','주방용품');

	var selectCategory;

	function init(mc, mn) {
		//alert('init');
		//alert(mc +"/" + mn); // 아프리카/ 세네갈
		document.myform.first.options[0] = new Option("상품등록할 곳 ", ""); // text, value
		document.myform.second.options[0] = new Option("카테고리", ""); // text, value
		for (i = 0; i < f_selbox.length; i++) {
			document.myform.first.options[i + 1] = new Option(f_selbox[i],
					f_selbox[i]);
			if (document.myform.first.options[i + 1].value == mc) {
				document.myform.first.options[i + 1].selected = true;
				selectCategory = i; // 아프리카:1
			}
		}//for

		for (var j = 0; j < s_selbox[selectCategory].length; j++) {
			document.myform.second.options[j + 1] = new Option(
					s_selbox[selectCategory][j]);
			if (document.myform.second.options[j + 1].value == mn) {
				document.myform.second.options[j + 1].selected = true;
			}
		}//for
	}//init

	function firstChange() {
		var index = document.myform.first.selectedIndex; // 아프리카:2

		for (i = document.myform.second.length - 1; i > 0; i--) {
			document.myform.second.options[i] = null;
		}

		for (i = 0; i < s_selbox[index - 1].length; i++) {
			document.myform.second.options[i + 1] = new Option(
					s_selbox[index - 1][i]);
		}
	} //firstChange
</script>


<body onLoad="init('${product.mall }','${product.pcategory}')">
	<form:form commandName="product" name="myform"
		action="productInsert.prd" method="post" enctype="multipart/form-data">

		<input type="hidden" name="pageNumber" value="${pageNumber}">

		<div class="container-fluid">
		<div id="boxName">
			<i class="fas fa-plus fa-2x text-gray-500"></i>
			<h3 class="text-gray-800">상품추가</h3>
		</div>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">
					Product
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
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>카테고리</th>
								<td><select id="first" name="mall" onChange="firstChange()"
									style="width: 150px">
										<!-- <option value="">대륙 선택하세요</option> -->
								</select> <%--  <c:if test="${movie.continent}"></c:if> --%> 
								<form:errors path="mall" cssClass="err" /> <select
									id="second" name="pcategory" onChange="secondChange()"
									style="width: 150px"></select> <form:errors path="pcategory"
										cssClass="err" /></td>
							</tr>

							<tr>
								<th>등록인아이디</th>
								<td>${loginInfo.id}<form:errors path="id" cssClass="err"></form:errors></td>
							</tr>
							<tr>
								<th>상품이름</th>
								<td><input type="text" name="pname"
									value="${product.pname}"> <form:errors path="pname"
										cssClass="err"></form:errors></td>
							</tr>
							<tr>
								<th>상품이미지</th>
								<td><input type="file" name="upload"
									value="${product.pimage}"> <form:errors path="pimage"
										cssClass="err"></form:errors></td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input type="text" name="price"
									value="${product.price}"> <form:errors path="price"
										cssClass="err"></form:errors></td>
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
									value="${product.capacity}"> </td>
							</tr>
							<tr>
								<th>설명</th>
								<td><textarea name="pcontent" id="content"
										value="${product.pcontent}"></textarea> <form:errors
										path="pcontent" cssClass="err"></form:errors></td>
							</tr>
							<tr>
								<th>재고</th>
								<td><input type="text" name="stock"
									value="${product.stock}"> </td>
							</tr>


							<tr>
								<th>분류</th>
								<td>
									<%
									String[] mall = { "B마트", "배민상회" };
									%> <c:forEach var="mall" items="<%=mall%>">
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
		</div>
		</div>

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
	</form:form>
<%@ include file="../member/owner/o_bottom.jsp" %>