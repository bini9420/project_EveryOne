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
				<c:if test="${product.pimage eq null}">
	            	<img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</c:if>
				<c:if test="${product.pimage ne null}">
					<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
	            	<img class="card-img-top mb-5 mb-md-0" src="<%=img%>${product.pimage}" alt="..." />
				</c:if>
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
                <form action="insertCart.mall" name="count">
                	<input type="hidden" name="id" value="${loginInfo.id}">
                	<input type="hidden" name="pnum" value="${product.pnum}">
                	<input type="hidden" name="index" value="detail">
	                <div class="d-flex mb-3">
	                    <input type="button" class="form-control text-center me-2 fw-bolder" value="-" style="max-width: 3rem" onClick="down()"/>
	                    <input name="qty" class="form-control text-center me-2" id="inputQuantity" type="text" value="1" style="max-width: 3rem" />
	                    <input type="button"  class="form-control text-center me-3 fw-bolder" value="+" style="max-width: 3rem" onClick="up('${product.stock}')"/>
	                    <input class="btn btn-outline-primary flex-shrink-0 me-2" type="submit" value="장바구니 담기">
	                    <!-- 로그인 해서 찜목록을 조회할 수 있을 때 -->
						<c:if test="${fn:length(interestLists) > 0}">
							<!-- flag를 선언. 목록에 있으면 true, 없으면 false. -->
		                    <c:set var="flag" value="false"/>
							<c:forEach var="iproduct" items="${interestLists}">
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
		                    	<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
		                    	href="updateInterest.mall?page=detail&index=del&id=${loginInfo.id}&pnum=${product.pnum}">
			                    	<i class="fi fi-rs-heart"></i>
			                    </a>
		                    </c:if>
		                    <c:if test="${not flag}">
		                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
		                    	href="updateInterest.mall?page=detail&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
			                    	<i class="fi fi-rs-heart"></i>
			                    </a>
		                    </c:if>
	                    </c:if>
	                    <!-- 찜목록을 조회할 수 없을 때 -->
	                    <c:if test="${fn:length(interestLists) == 0}">
	                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger" 
	                    	href="updateInterest.mall?page=detail&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
		                    	<i class="fi fi-rs-heart"></i>
		                    </a>
	                    </c:if>
	                </div>
                </form>
                <div class="fs-5 mt-5">
                	<table class="detail text-center text-muted">
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

<section class="py-5">
	<div class="container py-1 text-center w-75">
		<div class="text-center fw-bold py-3 fs-4 text-secondary">
			상품리뷰(<fmt:formatNumber value="${rcount}" pattern="##,###"/>)
		</div>
	    <c:if test="${fn:length(rdetail) == 0}">
	    	<div class="container py-5 text-center" style="border-top: 2px solid #EBEBEB">
	    		현재 등록된 리뷰가 없습니다.
	    	</div>
	    </c:if>
	    	
	    	
	    <c:if test="${fn:length(rdetail) > 0}">
	    	<div class="container pb-5 text-center" style="border-top: 2px solid #EBEBEB">
	    		<c:forEach var="rd" items="${rdetail}" varStatus="status">
	    			<c:if test="${status.count == 1}">
	    				<div class="mb-3 p-2 text-end">
							<a href="detail.mall?pnum=${rd.pnum}&range=recently">최신순</a>&nbsp;|&nbsp;
							<a href="detail.mall?pnum=${rd.pnum}&range=highScore">높은별점순</a>&nbsp;|&nbsp;
							<a href="detail.mall?pnum=${rd.pnum}&range=rowScore">낮은별점순</a>
						</div>
	    			</c:if>
	    		</c:forEach>
	    		
		    	<table class="mx-auto my-4 bg-white" style="width: 700">
		    		<c:forEach var="rd" items="${rdetail}">
		    			<tr style="border-top: 1px solid gray">
		    				<td rowspan="5" class="p-4" style="background: rgba(42, 193, 188, 0.2); border-right: 1px solid gray">
								<c:forEach var="i" begin="1" end="${5-rd.score}">
									<i class="fi fi-sr-star text-white"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${rd.score}">
									<i class="fi fi-sr-star" style="color: yellow"></i>
								</c:forEach>
								
								<p class="mt-2 text-muted fw-bold">
								${rd.id}
		    				</td>
		    			</tr>
		    			<tr>
		    				<td class="pt-3 ps-4 text-muted">
		    					${rd.pname}
		    				</td>
		    			</tr>
		    			<tr>
		    				<td class="pt-2 ps-4">
		    					<c:if test="${rd.image ne null}">
				    				<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
				    				<img src="<%=img%>${rd.image}" style="width: 80">
				    			</c:if>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td class="pt-2 ps-4">${rd.rcomment}</td>
		    			</tr>
		    			<tr style="border-bottom: 1px solid gray">
		    				<td class="pt-1 ps-4 pb-3 text-muted">
		    					<fmt:parseDate var="date" value="${rd.rdate}" pattern="yyyy-MM-dd"/>
		    					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
		    				</td>
		    			</tr>
		    		</c:forEach>
		    	</table>
		    	${pageInfo.pagingHtml }
		    </div>
	    </c:if>
	    	
	</div>
</section>


<%@ include file="mall_bottom.jsp"%>