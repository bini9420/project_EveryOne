<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>베스트상품</title>

<%@ include file="mall_top.jsp"%>

<div class="container px-4 px-lg-5 mt-5">
	<c:if test="${fn:length(plists) > 0}">
		<div class="mb-4 text-center fs-3">
			<font class="fw-bolder" style="color: #2ac1bc">[ 베스트 상품 - TOP10 ]</font>
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 mt-5 mb-2">
			<c:forEach var="product" items="${plists}" varStatus="status">
				<c:if test="${status.count <= 10}">
					<div class="col mb-4">
						<div class="card text-center pb-3" style="height: 350">
							<c:if test="${product.ad == 1}">
								<div class="text-end pt-2 pe-2">
									<img src="resources/img/ad.png" style="width: 30; height: 25">
								</div>
							</c:if>
							<c:if test="${product.ad == 0}">
								<div class="p-3"> </div>
							</c:if>
							<div class="card-body p-2">
								<!-- Product image-->
								<a href="detail.mall?pnum=${product.pnum}">
									<c:if test="${product.pimage ne null}">
										<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
										<img src="<%=img%>${product.pimage}" alt="productImg" class="productImg">
									</c:if>
									<c:if test="${product.pimage eq null}">
										<img src="resources/img/no-pictures.png" alt="productImg" class="productImg">
									</c:if>
								</a>
								<!-- Product details-->
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder"><a href="#">${product.pname}</a></h5>
									<!-- Product price-->
									<fmt:formatNumber value="${product.price}" pattern="##,###원"/>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?index=best&id=${loginInfo.id}&pnum=${product.pnum}&qty=1">장바구니 담기</a>
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
					                    	href="updateInterest.mall?page=best&index=del&id=${loginInfo.id}&pnum=${product.pnum}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
					                    <c:if test="${not flag}">
					                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
					                    	href="updateInterest.mall?page=best&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
				                    </c:if>
				                    <!-- 찜목록을 조회할 수 없을 때 -->
				                    <c:if test="${fn:length(interestLists) == 0}">
				                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
				                    	href="updateInterest.mall?page=best&index=in&id=${loginInfo.id}&pnum=${product.pnum}">
					                    	<i class="fi fi-rs-heart"></i>
					                    </a>
				                    </c:if>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
</div>

<%@ include file="mall_bottom.jsp"%>