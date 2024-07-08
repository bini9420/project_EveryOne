
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>

<head>
            
<style>
.plusbtn {
	float: right;
	margin-left: 10px;
	font-size: 2rem;
}

 .title {
            text-align: center;
        }
      
        
</style>


</head>

<form action="productList.prd" method="post">



	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 title" >상품목록</h1>
 <div class="card shadow mb-4">
        <div class="card-header py-3">
          
       <div class="card-body">
            
                <div class="input-group" >
                    <select name="whatColumn" class="form-control bg-light border-0 small" >
                        <option value="all">전체검색</option>
                        <option value="pcategory">카테고리</option>
                        <option value="pname">상품명</option>
                        <option value="price">가격</option>
                        <option value="stock">재고</option>
                    </select>
                    <input type="text" name="keyword" class="form-control bg-light border-0 small" placeholder="Search for..." >
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
            <a href="productInsert.prd" class="plusbtn"><i class="fi fi-br-plus-small"></i></a>
            
        </div>
       </div>
       </div>
    </div>
</div>

</form>



	<!--
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h5 class="m-0 font-weight-bold text-primary"> 
				Product List 
				</h5>
				    Topbar Search
				<div class="input-group-append">
					<div class="input-group">

						<select name="whatColumn"
							class="form-control bg-light border-0 small" aria-label="Search"
							aria-describedby="basic-addon2">
							<option value="all">전체검색
							<option value="pcategory">카테고리
							<option value="pname">상품명
							<option value="price">가격
							<option value="stock">재고
						</select> <input type="text" name="keyword"
							class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">

						<button class="btn btn-primary" input type="submit">
							<i class="fas fa-search fa-sm"></i>
						</button>

						<a href="productInsert.prd" class="plusbtn"><i
							class="fi fi-br-plus-small"></i></a>
					</div>
				</div> -->
			
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>카테고리</th>
									<th>상품명</th>
									<th>가격</th>
									<th>주문횟수</th>
									<th>재고</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>

							<c:forEach var="prd" items="${productLists }">





								<tr>
									<th>${prd.pnum }</th>
									<th>${prd.pcategory }</th>
									<th>${prd.pname }</th>
									<th>${prd.price }</th>
									<th>${prd.ordercount }</th>
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
		</div>



	

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"/>
       
	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->

	<center>${pageInfo.pagingHtml }</center>

</body>

</html>