<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<style>
	.fa-folder-open {
		float: left;
		margin-right: 5px;
	}
	h1 {
		float: left;
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
	#pageNation {
		text-align: center;
	}
	#first, #second {
		display: inline;
	}
	#first {
		margin-right: 7px;
	}
	h6 {
		display: inline;
		margin-bottom: -10px !important;
	}
	#insertBtn {
		float: right;
	}
</style>

<%@ include file="../member/owner/o_top.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
	//상품 등록 버튼 클릭 -> 유효성 검사 & insert
	function send() {
	    (() => {
	        'use strict'
	
	        // Fetch all the forms we want to apply custom Bootstrap validation styles to
	        const forms = document.querySelectorAll('.needs-validation')
	
	        // Loop over them and prevent submission
	        Array.from(forms).forEach(form => {
	            form.addEventListener('submit', event => {
	                if (!form.checkValidity()) {
	                    event.preventDefault()
	                    event.stopPropagation()
	                } else {
	                    form.submit(); 
	                }
	
	                form.classList.add('was-validated')
	            }, false)
	        })
	    })()
	
	    // 폼의 제출을 트리거
	    document.myform.action = "productInsert_owner.prd";
	    document.myform.submit();
	}
</script>

<form name="myform" method="post" enctype="multipart/form-data" novalidate>
	<!-- Begin Page Content -->
	 <div class="container">
		<div class="row">
			<!-- Page Heading -->
			<div class="d-flex align-items-center justify-content-start mb-4">
				<i class="fas fa-plus fa-2x text-gray-500 me-2"></i>
				<h1 class="h3 mb-0 text-gray-800">상품등록</h1>
			</div>
		</div>
	</div>
	
						
	<!-- 상품 정보 입력-->
	<div class="container h-80">
		<div class="row">
			<div class="col-lg-12">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상품 정보 입력</h6>
							<button type="button" onclick="send()" class="btn btn-primary" id="insertBtn">등록</button>
							<!-- <a href="#" class="btn btn-primary" id="insertBtn">상품등록</a> -->
					</div>
					
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0">
								<tbody>
									<tr>
							            <th>
							                <h6 class="mb-1">카테고리</h6>
							            </th>
								        <td>
								        	<select id="second" name="pcategory" style="width: 150px" class="form-select form-select-sm" required>
								        		<option value="">선택</option>
								        		<c:forEach var="document" items="${lists}">
								        			<option value="${document.prdcategory}">${document.prdcategory}</option>
								        		</c:forEach>
								        	</select>
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">등록인 아이디</h6>
							            </th>
								        <td>
								        	<input type="text" name="id" value="${sessionScope.loginInfo.id}" class="form-control form-control-sm" disabled>
								        	<input type="hidden" name="id" value="${sessionScope.loginInfo.id}">
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">상품명</h6>
							            </th>
								        <td>
								        	<input type="text" name="pname" class="form-control form-control-sm" required>
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">상품이미지</h6>
							            </th>
								        <td>
								        	<input class="form-control form-control-sm" id="formFileSm" type="file" name="upload" required>
											<div class="invalid-feedback">
										    	상품 사진을 첨부 해주세요
										    </div>
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">가격</h6>
							            </th>
								        <td>
								        	<input type="text" name="price" class="form-control form-control-sm" required>
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">원산지</h6>
							            </th>
								        <td>
								        	<input type="text" name="origin" class="form-control form-control-sm"> 
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">소비기한</h6>
							            </th>
								        <td>
								        	<input type="text" name="expritydate" class="form-control form-control-sm"> 
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">용량</h6>
							            </th>
								        <td>
								        	<input type="text" name="capacity" class="form-control form-control-sm"> 
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">설명</h6>
							            </th>
								        <td>
								        	<textarea name="pcontent" id="content" class="form-control form-control-sm" required></textarea> 
										</td>
							         </tr>
							         <tr>
							            <th>
							                <h6 class="mb-1">재고</h6>
							            </th>
								        <td>
								        	<input type="text" name="stock" class="form-control form-control-sm" required> 
										</td>
							         </tr>
							      </tbody>
							 </table>
						 </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</form>	
<!-- End of Main Content -->
     
<%@ include file="../member/owner/o_bottom.jsp" %>