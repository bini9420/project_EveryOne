<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/a_top.jsp"%>


<script>
function allCheck() {
    if($("#allChk").is(':checked')){
    	$("input[name=chkRow]").prop("checked",true);
    }else{
    	
    	$("input[name=chkRow]").prop("checked",false);
    }
}

function checkboxArr(){
	
	alert('삭제하시겠습니까?');
	
	var checkArr =[];
	$("input[name='chkRow']:checked").each(function(){
		
		
		
		checkArr.push($(this).val());
	});

	$.ajax({
		url:'/ex/adminProductDelete.prd',
		type:'get',
		dataType:'text',
		async : false,
		data:{
			chkArr:checkArr
		}
	});

	location.reload(true);
}
function check(){
	checkboxArr();
}

</script>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">상품목록</h1>
<div class="card shadow mx-auto" style="width :80%">
	<div class="card-header py-3">
		<div style="text-align: right">
			<form action="adminProductList.prd" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
				<div class="input-group">
					<input type="text" name="keyword" class="form-control bg-white border-0 small reading"
						placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="submit">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
			<a href="adminProductInsert.prd" class="btn btn-primary"> 
				<i class="fi fi-br-plus"></i>
			</a>
		</div>
	</div>
	<div class="card-body">
		<form action="adminProductDelete.prd" method="post">
			<table class="table table-bordered text-center" id="dataTable">
				<thead>
					<tr>
						<button type="button" onClick="check()">
							<i class="fi fi-rs-trash text-secondary trash m-2"></i>
						</button>
					</tr>
					<tr class="bg-secondary text-white">
						<th><input type="checkbox" id="allChk" onclick="allCheck()"></th>
						<th>상품번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>가격</th>
						<th>주문횟수</th>
						<th>상품등록일</th>
						<th>재고</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="prd" items="${productLists }">
						<tr>
							<th><input type="checkbox" name="chkRow"
								value="${prd.pnum }"></th>
							<th>${prd.pnum }</th>
							<th>${prd.pcategory }</th>
							<th><a href="adminProductDetail.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&keyword=${param.keyword}" style="color: gray;">${prd.pname }</a></th>
							<th>${prd.price }</th>
							<th>${prd.ordercount }</th>
							<th>${fn:substring(prd.inputdate, 0, 10)}</th>
							<th>${prd.stock }</th>
							<th><a href="adminProductUpdateForm.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&keyword=${param.keyword}">수정</a></th>
							<th><a href="adminProductDelete.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&keyword=${param.keyword}">삭제</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</div>
<div class="text-center my-3">
	${pageInfo.pagingHtml }
</div>




	<%@include file="../admin/a_bottom.jsp"%>