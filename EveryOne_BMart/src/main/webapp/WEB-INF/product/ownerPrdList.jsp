<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<style>
	.fa-list {
		float: left;
		margin-right: 5px;
	}
	h1 {
		float: left;
		top: -10px;
	}
	.searchTd {
		padding: 5px;
	}
	.spaceTd {
		padding-right: 70px;
	}
	.testSize {
		width: 120px;
	}
	.col-auto, .mr-2 {
		display: inline-block;
		float: left;
	}
	#boxname {
		margin-left: 20px;
		margin-top: 10px;
	}
</style>

<%@ include file="../member/owner/o_top.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
function detail(pnum) {
    //alert("선택한 상품 번호: " + pnum);
	$('.modal-content').load("prdDetail_owner.prd?pnum=" + pnum);
	$('#prdModal').modal('show');
}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-md-6 mb-4">
             <div class="card border-left-info shadow h-100 py-2">
                  <div class="card-body">
                       <div class="row no-gutters align-items-center">
                       		<div class="col-auto">
	              			    <i class="fas fa-list fa-2x text-gray-500"></i>
	         			    </div>
                            <div class="col mr-2">
                                <div class="text-lg font-weight-bold text-info text-uppercase mb-1" id="boxname"><h3><b>상품목록</b></h3></div>
                            </div>
                  		</div>
             	  </div>
        	</div>
    	</div>	
	</div>
</div>

<!-- 검색 -->
<div class="container-fluid">					
	<div class="row">
		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-body">
					<form action="productList_owner.prd">
						<table align="center">
							<tr>
								<td class="searchTd text-gray-800"><b>카테고리</b></td>
								<td class="searchTd spaceTd">
									<select class="form-select form-select-sm" name="whatColumn">
										<option value="">선택
										<option value="전자기기">전자기기
										<option value="가구/인테리어">가구/인테리어
										<option value="주방용품">주방용품
										<option value="반려용품">반려용품
										<option value="스포츠/레저/캠핑">스포츠/레저/캠핑
									</select>
								</td>
								<td class="searchTd text-gray-800"><b>상&nbsp;&nbsp;품&nbsp;&nbsp;명</b></td>
								<td class="searchTd spaceTd" colspan="3">
									<input type="text" class="form-control form-control-sm" name="inputPname">
								</td>
								<td rowspan="2" align="center">
									<input type="submit" class="btn btn-primary" id="searchBtn" value="Search">
								</td>
							</tr>
							<tr>
								<td class="searchTd text-gray-800"><b>상품번호</b></td>
								<td class="searchTd spaceTd">
									<input type="text" class="form-control form-control-sm" name="inputPnum">
								</td>
								<td class="searchTd text-gray-800"><b>상품등록일</b></td>
								<td> 
									<input type="date" class="form-control form-control-sm" class="testSize" name="inputDay1">
								</td>
									<td>~</td>
								<td class="searchTd spaceTd">
									<input type="date" class="form-control form-control-sm" class="testSize" name="inputDay2">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 등록한 상품 List -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">등록한 상품 목록</h6>
				</div>
                                
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
							 <thead>
								<tr>
						        	<th>상품명</th>
						            <th>상품이미지</th>
						            <th>상품등록일</th>
						            <th>카테고리</th>
						            <th>가격</th>
						            <th>재고</th>
						        </tr>
						     </thead>
						     
						     <tbody>
						     	<c:forEach var="product" items="${lists}">
						     	<tr onclick="detail('${product.pnum}')" data-bs-toggle="modal" data-bs-target="#prdModal">
						     		<td>
						            	 <h6 class="mb-1">${product.pname}</h6>
						            	<span class="text-secondary fs-7">상품번호: ${product.pnum}</span>
						            </td>
						            <td>
						                <img src="<%=request.getContextPath()%>/resources/product/${product.pimage}" width="70" height="70">
						            </td>
						            <td>
						            	<fmt:parseDate value="${product.inputdate}" var="inputdate" pattern="yyyy-MM-dd"/>
							            <h6 class="mb-1"><fmt:formatDate value="${inputdate}" pattern="yyyy-MM-dd"/></h6>
							        </td>
							        <td>
							            <h6 class="mb-1">${product.pcategory}</h6>
							        </td>
							        <td>
							        	<fmt:formatNumber value="${product.price}" var="price" pattern="###,###"/>
							            <h6 class="mb-1"> &#8361;${price}</h6>
							        </td>
							        <td>
							            <h6 class="mb-1">${product.stock}개</h6>
							        </td>
						         </tr>
						         </c:forEach>
						      </tbody>
						 </table>
						 
						 
						 <!-- Modal -->
						<div class="modal fade" id="prdModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<!-- ownerPrdView.jsp가 들어올 부분 -->   
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>

<div class="pagination-wrapper">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item">&nbsp;<font class='btn btn-primary'>1</font>&nbsp;</li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</div>
<%@ include file="../member/owner/o_bottom.jsp"%>