
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>


       
<script>
	var f_selbox = new Array('B마트', '배민상회');

	var s_selbox = new Array();
	s_selbox[0] = new Array('쌀/잡곡/견과', '국/탕/찌개', '음료/커피/생수', '정육/수산/계란',
			'라면/면', '과일/채소', '양념/장류/오일', '우유/유제품', '햄/어묵/통조림', '생활/기타');
	s_selbox[1] = new Array('쌀/잡곡/견과', '야채/채소', '과일', '축산/계란', '수산/건어물',
			'베이커리/디저트', '유제품', '배달용품', '주방용품');

	var selectCategory;

	function init(mc, mn) {

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

		for (var j = 0; j < s_selbox[selectCategory].length;j++) {
			document.myform.second.options[j + 1] = new Option(
					s_selbox[selectCategory][j]);
			if (document.myform.second.options[j + 1].value == mn) {
				document.myform.second.options[j + 1].selected = true;
			}
		}//for
	}//init

	function firstChange() {
		var index = document.myform.first.selectedIndex;

		for (i = document.myform.second.length - 1; i > 0; i--) {
			document.myform.second.options[i] = null;
		}

		for (i = 0; i < s_selbox[index - 1].length; i++) {
			document.myform.second.options[i + 1] = new Option(
					s_selbox[index - 1][i]);
		}
	} //firstChange
</script>


	<form:form commandName="product" name="myform" action="productInsert.prd" method="post" enctype="multipart/form-data">
<body onLoad="init('${product.mall }','${product.pcategory}')"> 
		<input type="hidden" name="pageNumber" value="${pageNumber}">


		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800 title">회원등록</h1>


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
							<th>회원 ID</th>



							<td><select id="first" name="mall" onChange="firstChange()"
								style="width: 150px" >

							</select> <select id="second"
								name="pcategory" onChange="secondChange()" style="width: 150px" ></select>
								</td>
						</tr>



						<tr>
							<th>회원 이름</th>
							<td><input type="hidden" name="id" value="${sessionScope.loginInfo.id}">${sessionScope.loginInfo.id}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" name="pname" value="${product.pname}">
								<form:errors path="pname" cssClass="err"></form:errors></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td><input type="file" name="upload"
								value="${product.pimage}"></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="text" name="price" value="${product.price}"></td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>

		<center>${pageInfo.pagingHtml }</center>
	</form:form>