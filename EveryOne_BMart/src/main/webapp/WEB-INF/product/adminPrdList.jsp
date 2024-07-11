
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>



<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">상품목록</h1>
<div class="card shadow mb-4">
	<div class="card-header py-3">
			<div class="card-body">

		
<form class="row g-3">
 
  <div class="col-auto">
   
    <input type="password" class="form-control" id="inputPassword2" placeholder="Search..">
  </div>
  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3"><i class="fas fa-search fa-sm"></i></button>
  </div>
</form>
			
				
						
						<a href="productInsert.prd" class="plusbtn">
						<i class="fi fi-br-plus-small"></i></a>

					</div>
				</div>
	
	</div>
</div>



<div class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable">
			<thead>
				<tr>
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

			<c:forEach var="prd" items="${productLists }">

				<tr>
					<th>${prd.pnum }</th>
					<th>${prd.pcategory }</th>
					<th><a href="prodDetail.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&keyword=${param.keyword}" style="color: gray;">${prd.pname }</a></th>
					<th>${prd.price }</th>
					<th>${prd.ordercount }</th>
					<th>${fn:substring(prd.inputdate, 0, 10)}</th>
					<th>${prd.stock }</th>
					<th><a
						href="productUpdate.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">수정</a></th>
					<th><a
						href="productDelete.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">삭제</a></th>
				</tr>


			</c:forEach>
			</tbody>

		</table>

	</div>
</div>



<div class="pagination-wrapper">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item">${pageInfo.pagingHtml }</li>

			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</div>




<%@include file="../admin/a_bottom.jsp"%>
