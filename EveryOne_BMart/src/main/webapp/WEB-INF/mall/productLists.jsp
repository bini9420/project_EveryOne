<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>카테고리 상품 목록</title>


<%@ include file="mall_top.jsp"%>

<div class="container px-4 px-lg-5 mt-5">
	<c:if test="${fn:length(plists) > 0}">
		<c:if test="${category ne null}">
			<div class="mb-2 text-center fs-3">
				<font class="fw-bolder" style="color:#2ac1bc">[ ${category} ]</font>
			</div>
			<div class="mt-5 mb-3 p-2 text-end bg-light">
				<a href="plists.mall?category=${category}&range=recently">최신순</a>&nbsp;|&nbsp;
				<a href="plists.mall?category=${category}&range=best">인기순</a>&nbsp;|&nbsp;
				<a href="plists.mall?category=${category}&range=highPrice">높은 가격순</a>&nbsp;|&nbsp;
				<a href="plists.mall?category=${category}&range=rowPrice">낮은 가격순</a>
			</div>
		</c:if>
		
		<c:if test="${keyword ne null}">
			<div class="mb-2 text-center fs-3">
				<font class="fw-bolder" style="color: #2ac1bc">[ 상품 검색 결과 ]</font>
			</div>
			<div class="mt-5 mb-3 p-2 text-end bg-light">
				<a href="plists.mall?keyword=${keyword}&range=recently">최신순</a>&nbsp;|&nbsp;
				<a href="plists.mall?keyword=${keyword}&range=best">인기순</a>&nbsp;|&nbsp;
				<a href="plists.mall?keyword=${keyword}&range=highPrice">높은 가격순</a>&nbsp;|&nbsp;
				<a href="plists.mall?keyword=${keyword}&range=rowPrice">낮은 가격순</a>
			</div>
		</c:if>
		
		<c:if test="${keyword eq null && category eq null}">
			<div class="mb-4 text-center fs-3">
				<font class="fw-bolder" style="color: #2ac1bc">[ 신상품 ]</font>
			</div>
			<div class="mt-5 mb-3 p-2 text-end bg-light">
				<a href="plists.mall?range=recently">최신순</a>&nbsp;|&nbsp;
				<a href="plists.mall?range=highPrice">높은 가격순</a>&nbsp;|&nbsp;
				<a href="plists.mall?range=rowPrice">낮은 가격순</a>
			</div>
		</c:if>
		
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 mt-4 mb-2">
			<c:forEach var="product" items="${plists}" varStatus="status">
				<div class="col mb-4">
					<div class="card h-100 text-center">
						<c:if test="${product.ad == 1}">
							<div class="text-end pt-2 pe-2">
								<img src="resources/img/ad.png" style="width: 30; height: 25">
							</div>
						</c:if>
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
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><a href="#">${product.pname}</a></h5>
								<!-- Product price-->
								<fmt:formatNumber value="${product.price}" pattern="##,###원"/>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?id=${loginInfo.id}&pnum=${product.pnum}&qty=1">장바구니 담기</a>
								<!-- 로그인 해서 찜목록을 조회할 수 있을 때 -->
								<c:if test="${fn:length(interestLists) > 0}">
									<!-- flag를 선언. false일 때만 출력하고 true면 반복문을 빠져나가도록. -->
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
			                    		<c:if test="${category ne null}">
											<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
					                     	href="updateInterest.mall?page=category&index=del&id=${loginInfo.id}&pnum=${product.pnum}&category=${category}&range=${range}">
												<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
										<c:if test="${keyword ne null}">
											<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
					                     	href="updateInterest.mall?page=keyword&index=del&id=${loginInfo.id}&pnum=${product.pnum}&keyword=${keyword}&range=${range}">
												<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
										<c:if test="${keyword eq null && category eq null}">
											<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
					                    	href="updateInterest.mall?page=new&index=del&id=${loginInfo.id}&pnum=${product.pnum}&range=${range}">
												<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
									</c:if>
			                    	<c:if test="${not flag}">
			                    		<c:if test="${category ne null}">
					                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger" 
					                     	href="updateInterest.mall?page=category&index=in&id=${loginInfo.id}&pnum=${product.pnum}&category=${category}&range=${range}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
				                    	<c:if test="${keyword ne null}">
					                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
											href="updateInterest.mall?page=keyword&index=in&id=${loginInfo.id}&pnum=${product.pnum}&keyword=${keyword}&range=${range}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
				                    	<c:if test="${keyword eq null && category eq null}">
					                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
					                    	href="updateInterest.mall?page=new&index=in&id=${loginInfo.id}&pnum=${product.pnum}&range=${range}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
									</c:if>
			                    </c:if>
			                    <!-- 찜목록을 조회할 수 없을 때 -->
			                    <c:if test="${fn:length(interestLists) == 0}">
				                    <c:if test="${category ne null}">
					                    <a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
					                     href="updateInterest.mall?page=category&index=in&id=${loginInfo.id}&pnum=${product.pnum}&category=${category}&range=${range}">
					                    	<i class="fi fi-rs-heart"></i>
					                    </a>
									</c:if>
									<c:if test="${keyword ne null}">
										<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
										href="updateInterest.mall?page=keyword&index=in&id=${loginInfo.id}&pnum=${product.pnum}&keyword=${keyword}&range=${range}">
					                    	<i class="fi fi-rs-heart"></i>
					                    </a>
									</c:if>
									<c:if test="${keyword eq null && category eq null}">
										<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
										href="updateInterest.mall?page=new&index=in&id=${loginInfo.id}&pnum=${product.pnum}&range=${range}">
					                    	<i class="fi fi-rs-heart"></i>
					                    </a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="mb-5 p-2 text-center">
			${pageInfo.pagingHtml}<br>
		</div>
	</c:if>
	<c:if test="${fn:length(plists) == 0}">
		<div class="row justify-content-center mb-3">
			<div class="mb-4 text-center">
				<c:if test="${category ne null}">
					<font size="4">해당 카테고리에 등록된 상품이 없습니다.</font>
				</c:if>
				<c:if test="${keyword ne null}">
					<font size="4">상품명에 검색어가 포함된 상품이 없습니다.</font>
				</c:if>
				<c:if test="${keyword eq null && category eq null}">
					<font size="4">최근 등록된 상품이 없습니다.</font>
				</c:if>
			</div>
		</div>
	</c:if>
</div>

<%@ include file="mall_bottom.jsp"%>