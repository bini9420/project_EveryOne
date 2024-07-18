<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>	
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
</style>

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
				 			<textarea class="form-control" id="prdContent" style="height: 300px" name="pcontent">${product.pcontent}</textarea>
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
                    	<td><input type="text" class="form-control form-control-sm" name="pcategory" value="${product.pcategory}"></td>
                    </tr>
                    <tr>
                    	<fmt:formatNumber value="${product.price}" var="price" pattern="###,###"/>
                    	<th><label for="prdPrice" class="form-label">가격</label></th>
                    	<td><input type="text" class="form-control form-control-sm" name="price" value="&#8361;${price}"></td>
                    </tr>
                    <tr>
                    	<th><label for="prdStock" class="form-label">재고</label></th>
                    	<td> 
                    		<button type="button" class="btn btn-outline-primary btn-sm" id="minusBtn" onclick="minus()">-</button>
						    <input type="text" class="form-control form-control-sm" name="stock" value="${product.stock}" id="stockInput" style="width: 10%">
						    <button type="button" class="btn btn-outline-primary btn-sm" id="plusBtn" onclick="plus()">+</button>
						</td>
                    </tr>
                    <tr>
                    	<th><label for="prdAd" class="form-label">광고유무</label></th>
                    	<td>
							 <div class="form-check">
							    <input class="form-check-input" type="radio" name="ad" id="flexRadioDefault1" value="1"
							           <c:if test="${product.ad == 1}">checked</c:if>>
							    <label class="form-check-label" for="flexRadioDefault1">
							        O
							    </label>
							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    <input class="form-check-input" type="radio" name="ad" id="flexRadioDefault2" value="0"
							           <c:if test="${product.ad == 0}">checked</c:if>>
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
      
<div class="modal-footer">
	<!-- 닫기 버튼 -->
	<a href="" class="btn btn-icon-split" id="closeBtn">
		<span class="text">닫기</span>
	</a>
        
	<!-- 저장 버튼 -->
	<a href="javascript:save()" class="btn btn-primary btn-icon-split" id="saveBtn">
		<span class="text">저장</span>
	</a>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	function minus() {
		alert(1);
		var stockInput = $('#stockInput');
        var currentStock = parseInt(stockInput.val());
        if (currentStock > 0) {
            currentStock--;
            stockInput.val(currentStock);
        }
	}
	
	function plus() {
		alert(2);
		var stockInput = $('#stockInput');
        var currentStock = parseInt(stockInput.val());
        currentStock++;
        stockInput.val(currentStock);
	}
</script>