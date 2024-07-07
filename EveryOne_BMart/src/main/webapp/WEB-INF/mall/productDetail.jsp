<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품 상세</title>

<%@ include file="mall_top.jsp" %>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	function up(stock){
		//alert('up');
		if(document.count.qty.value == stock){
			alert('더이상 재고가 남아있지 않습니다.')
		}else{
			document.count.qty.value++;
		}
	}
	function down(){
		if(document.count.qty.value > 1){
			document.count.qty.value--;	
		}else{
			alert('개수는 최소 1개부터 가능합니다.');
		}
	}
</script>
<!-- Product section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-4">
        <div class="row gx-4 gx-lg-5 align-items-center">
        	<!-- product image -->
            <div class="col-md-5 mx-4">
	        	<c:if test="${product.ad == 1}">
					<div class="text-end px-2 py-2">
						<img src="resources/img/ad.png" style="width: 40; height: 35">
					</div>
				</c:if>
            	<img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
            </div>
            <!-- product detail -->
            <div class="col-md-5 mx-2">
            	
                <h2 class="fw-bolder">${product.pname}</h2>
                <div class="fs-5 mb-5">
                	<fmt:formatNumber value="${product.price}" pattern="##,###원"/>
                </div>
                <p class="lead">
                	${product.pcontent}
                </p>
                <form action="insertCart.mall" name="count" method="post">
                	<input type="hidden" name="id" value="${loginInfo.id}">
                	<input type="hidden" name="pnum" value="${product.pnum}">
	                <div class="d-flex mb-3">
	                    <input type="button" class="form-control text-center me-2 fw-bolder" value="-" style="max-width: 3rem" onClick="down()"/>
	                    <input name="qty" class="form-control text-center me-2" id="inputQuantity" type="text" value="1" style="max-width: 3rem" />
	                    <input type="button"  class="form-control text-center me-3 fw-bolder" value="+" style="max-width: 3rem" onClick="up('${product.stock}')"/>
	                    <input class="btn btn-outline-info flex-shrink-0 me-2" type="submit" value="장바구니 담기">
	                    <!-- 로그인 해서 찜목록을 조회할 수 있을 때 -->
						<c:if test="${fn:length(ilists) > 0}">
							<!-- flag를 선언. 목록에 있으면 true, 없으면 false. -->
		                    <c:set var="flag" value="false"/>
							<c:forEach var="iproduct" items="${ilists}">
								<c:if test="${not flag}">
									<c:if test="${product.pnum eq iproduct.pnum}">
					                    <c:set var="flag" value="true"/>
				                    </c:if>
									<c:if test="${product.pnum ne iproduct.pnum}">
					                    <c:set var="flag" value="false"/>
				                    </c:if>
			                    </c:if>
		                    </c:forEach>
		                    <c:if test="${flag}">
		                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:white; border: 1px solid #FC7CB9; background: #FC7CB9" 
		                    	href="updateInterest.mall?page=detail&index=del&id=${loginInfo.id}&pnum=${product.pnum}">
			                    	<i class="fi fi-rs-heart"></i>
			                    </a>
		                    </c:if>
		                    <c:if test="${not flag}">
		                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
		                    	href="updateInterest.mall?page=detail&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
			                    	<i class="fi fi-rs-heart"></i>
			                    </a>
		                    </c:if>
	                    </c:if>
	                    <!-- 찜목록을 조회할 수 없을 때 -->
	                    <c:if test="${fn:length(ilists) == 0}">
	                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
	                    	href="updateInterest.mall?page=detail&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
		                    	<i class="fi fi-rs-heart"></i>
		                    </a>
	                    </c:if>
	                </div>
                </form>
                <div class="fs-5 mt-5">
                	<table class="detail text-center">
			       		<tr>
			       			<th colspan="8">상품 상세 설명</th>
			       		</tr>
			       		<tr>
			       			<th colspan="2">카테고리</th>
			       			<td colspan="2">${product.pcategory}</td>
			       			<th colspan="2">용량</th>
			       			<td colspan="2">${product.capacity}</td>
			       		</tr>
			       		<c:if test="${product.origin ne null}">
			       		<tr>
			       			<th colspan="2">원산지</th>
			       			<td colspan="6">${product.origin}</td>
			       		</tr>
			       		</c:if>
			       		<c:if test="${product.expritydate ne null}">
			       		<tr>
			       			<th colspan="2">상품기한(유통기한)</th>
			       			<td colspan="6">${product.expritydate}</td>
			       		</tr>
			       		</c:if>
			       	</table>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="container py-5">
	<div class="container py-1 text-center" style="background: #F5F5F5">
		<ul class="navbar-nav mx-auto text-muted fs-5 fw-bolder py-2" >
			<li class="nav-item" >
				상품리뷰
			</li>
		</ul>

	    <div class="container py-5 text-center" style="border-top: 1px solid gray">
	    	리뷰 내역
	    </div>
	</div>
</section>

<%@ include file="mall_bottom.jsp"%>