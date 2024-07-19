<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="documentStyle.css">
<link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	#staticBackdropLabel {
		margin-left: 30px;
	}
	.btn-secondary {
		font-family: "Spoqa Han Sans Neo", sans-serif;
	}
	.table {
		margin: auto;
	}
	.selectedTh {
		background-color: #9ad5d4;
	}
	#plusBtn, #minusBtn, #stockInput {
		display: inline;
	}
	#contentTd {
		border: 1px;
		padding: 4px;
	}
	.form-check-input:checked {
		background-color: #2ac1bc;	
		border-color: #2ac1bc;
	}
	#updateBtn {
		margin-right: 15px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
	function plus(pnum) {
		alert(pnum);
	}
	
	function minus(pnum) {
		alert(pnum);
	}

	function send() {
	    (() => {
	        'use strict'

	        // Fetch all the forms we want to apply custom Bootstrap validation styles to
	        const forms = document.querySelectorAll('.validated-form')

	        // Loop over them and prevent submission
	        Array.from(forms).forEach(form => {
	            form.addEventListener('submit', event => {
	                if (!form.checkValidity()) {
	                    event.preventDefault()
	                    event.stopPropagation()
	                } 

	                form.classList.add('was-validated')
	            }, false)
	        })
	    })()

	    // 폼의 제출을 트리거
	    const myForm = document.querySelector('form[name="myform"]');
	    if (myForm) {
	        myForm.action = "productUpdate_owner.prd";
	        myForm.submit();
	    } else {
	        console.error('폼을 찾을 수 없습니다.');
	    }
	}
</script>
<form class="validated-form" name="myform" method="post" enctype="multipart/form-data" id="update" novalidate>
<input type="hidden" name="pnum" value="${product.pnum}">
<div class="modal-header">
    <h1 class="modal-title fs-5" id="staticBackdropLabel" align="left"><b>[상품 정보] ${product.pname}</b></h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
    <div class="container">
        <!-- 상품등록일 -->
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table1">
                    <tr>
                        <th><label for="prdInputdate" class="form-label">상품등록일</label></th>
                        <td id="title">
                        	<fmt:parseDate value="${product.inputdate}" var="inputdate" pattern="yyyy-MM-dd HH:mm"/>
                            <label class="form-label"><fmt:formatDate value="${inputdate}" pattern="yyyy-MM-dd HH:mm"/></label>
                        </td>
                    </tr>
                </table>	 
            </div>
        </div>
        
        <!-- 상품이미지 & 상품설명 테이블 -->
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table2" border=1>
                    <tr>
                        <td align="center">
                        	<img src="<%=request.getContextPath()%>/resources/product/${product.pimage}" width="250" height="250">
				 			<input class="form-control form-control-sm" type="file" name="upload">
				 		</td>
				 		<td id="contentTd">
				 			<textarea class="form-control" id="prdContent" style="height: 300px" name="pcontent" required>${product.pcontent}</textarea>
				 			<div class="invalid-feedback">
								상품 설명 입력은 필수입니다
							</div>
				 		</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- 카테고리, 가격, 재고, 광고유무 테이블 -->
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table3">
                    <tr>
                    	<th><label for="prdCategory" class="form-label">카테고리</label></th>
                    	<td>
                    		<input type="text" class="form-control form-control-sm" name="pcategory" value="${product.pcategory}" disabled>
                    	</td>
                    </tr>
                    <tr>
                    	<fmt:formatNumber value="${product.price}" var="price" pattern="###,###"/>
                    	<th><label for="prdPrice" class="form-label">가격</label></th>
                    	<td>
                    		<input type="text" class="form-control form-control-sm" name="price" placeholder="${product.price}" required>
	                    	<div class="invalid-feedback">
								가격 입력은 필수입니다
							</div>
						</td>
                    </tr>
                    <tr>
                    	<th><label for="prdStock" class="form-label">재고</label></th>
                    	<td> 
                    		<button type="button" class="btn btn-outline-primary btn-sm" id="minusBtn" onClick="javascript:this.form.stock.value--;">-</button>
						    <input type="text" class="form-control form-control-sm" name="stock" placeholder="${product.stock}" id="stockInput" style="width: 10%" required>
						    <button type="button" class="btn btn-outline-primary btn-sm" id="plusBtn" onClick="javascript:this.form.stock.value++;">+</button>
						    <div class="invalid-feedback">
								재고수량 입력은 필수입니다
							</div>
						</td>
                    </tr>
                    <tr>
                    	<th><label for="prdAd" class="form-label">광고유무</label></th>
                    	<td>
							 <div class="form-check">
							    <input class="form-check-input" type="radio" name="ad" id="flexRadioDefault1" value="1"
							           <c:if test="${product.ad == 1}">checked</c:if> disabled>
							    <label class="form-check-label" for="flexRadioDefault1">
							        O
							    </label>
							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    <input class="form-check-input" type="radio" name="ad" id="flexRadioDefault2" value="0"
							           <c:if test="${product.ad == 0}">checked</c:if> disabled>
							    <label class="form-check-label" for="flexRadioDefault2">
							        X
							    </label>    
							</div>
                    	</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
      
<div class="modal-footer d-flex justify-content-between">
	<!-- 삭제 버튼 -->
	<a href="productDelete_owner.prd?pnum=${product.pnum}" class="btn btn-outline-danger btn-icon-split" id="deleteBtn">
		<span class="text">삭제</span>
	</a>
	
	<div class="ml-auto">  
		<!-- 저장 버튼 -->
		<a onclick="javascript:send()" class="btn btn-outline-primary btn-icon-split" id="sendBtn">
			<span class="text">저장</span>
		</a>
		      
		<!-- 닫기 버튼 -->
		<a href="" class="btn btn-outline-secondary btn-icon-split" id="closeBtn">
			<span class="text">닫기</span>
		</a>
	</div>
</div>
</form>	