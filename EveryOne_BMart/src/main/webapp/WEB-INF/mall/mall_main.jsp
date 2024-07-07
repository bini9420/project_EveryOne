<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<!-- carousel -->
<div class="container">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="resources/img/banner1.png" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/img/banner2.png" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/img/banner3.png" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<h4 class="fw-bolder mb-2">[ BEST 상품 ]</h4>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="best" items="${bMartBestProducts}" varStatus="status">
				<c:if test="${status.count <= 4}">
					<div class="col mb-5">
						<div class="card h-100 text-center">
							<c:if test="${best.ad == 1}">
								<div class="text-end pt-2 pe-2">
									<img src="resources/img/ad.png" style="width: 30; height: 25">
								</div>
							</c:if>
							<!-- Product image-->
							<a href="detail.mall?pnum=${best.pnum}">
								<c:if test="${best.pimage ne null}">
									<% String img = request.getContextPath()+"/image"; %>
										<img src="<%=img%>/${best.pimage}" alt="BestProductImg" class="productImg">
								</c:if>
								<c:if test="${best.pimage eq null}">
									<img src="resources/img/no-pictures.png" alt="BestProductImg" class="productImg">
								</c:if>
							</a>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder"><a href="#">${best.pname}</a></h5>
									<!-- Product price-->
									<fmt:formatNumber value="${best.price}" pattern="##,###원"/>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?id=${loginInfo.id}&pnum=${best.pnum}&qty=1">장바구니 담기</a>
									<!-- 로그인 해서 찜목록을 조회할 수 있을 때 -->
									<c:if test="${fn:length(ilists) > 0}">
										<!-- flag를 선언. 목록에 있으면 true, 없으면 false. -->
					                    <c:set var="flag" value="false"/>
										<c:forEach var="iproduct" items="${ilists}">
											<c:if test="${not flag}">
												<c:if test="${best.pnum eq iproduct.pnum}">
								                    <c:set var="flag" value="true"/>
							                    </c:if>
												<c:if test="${best.pnum ne iproduct.pnum}">
								                    <c:set var="flag" value="false"/>
							                    </c:if>
						                    </c:if>
					                    </c:forEach>
					                    <c:if test="${flag}">
					                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:white; border: 1px solid #FC7CB9; background: #FC7CB9" 
					                    	href="updateInterest.mall?page=main&index=del&id=${loginInfo.id}&pnum=${best.pnum}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
					                    <c:if test="${not flag}">
					                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
					                    	href="updateInterest.mall?page=main&index=in&id=${loginInfo.id}&pnum=${best.pnum}">
						                    	<i class="fi fi-rs-heart"></i>
						                    </a>
					                    </c:if>
				                    </c:if>
				                    <!-- 찜목록을 조회할 수 없을 때 -->
				                    <c:if test="${fn:length(ilists) == 0}">
				                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
				                    	href="updateInterest.mall?page=main&index=in&id=${loginInfo.id}&pnum=${best.pnum}">
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
	</div>
	
	<!-- 로그인 했을 경우에만 최근본상품, 찜한 상품이 보임. -->
	<c:if test="${loginInfo.id ne null}">
		<hr style="margin: 0 auto; width: 80%; border: 1.5px solid #DCDCDC">
		<div class="container px-4 px-lg-5 mt-5">
			<h4 class="fw-bolder mb-2">[ 최근 본 상품 ]</h4>
			<c:if test="${watchProductLists ne null}">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
					<c:forEach var="watch" items="${watchProductLists}" varStatus="status">
						<c:if test="${status.count <= 4}">
							<div class="col mb-5">
								<div class="card h-100 text-center">
									<c:if test="${watch.ad == 1}">
										<div class="text-end pt-2 pe-2">
											<img src="resources/img/ad.png" style="width: 30; height: 25">
										</div>
									</c:if>
									<!-- Product image-->
									<a href="detail.mall?pnum=${watch.pnum}">
										<c:if test="${watch.pimage ne null}">
											<% String img = request.getContextPath()+"/image"; %>
												<img src="<%=img%>/${watch.pimage}" alt="watchProductImg" class="productImg">
										</c:if>
										<c:if test="${watch.pimage eq null}">
											<img src="resources/img/no-pictures.png" alt="watchProductImg" class="productImg">
										</c:if>
									</a>
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder"><a href="#">${watch.pname}</a></h5>
											<!-- Product price-->
											<fmt:formatNumber value="${watch.price}" pattern="##,###원"/>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?id=${loginInfo.id}&pnum=${watch.pnum}&qty=1">장바구니 담기</a>
											<!-- 로그인 해서 찜목록을 조회할 수 있을 때 -->
											<c:if test="${fn:length(ilists) > 0}">
												<!-- flag를 선언. 목록에 있으면 true, 없으면 false. -->
							                    <c:set var="flag" value="false"/>
												<c:forEach var="iproduct" items="${ilists}">
													<c:if test="${not flag}">
														<c:if test="${watch.pnum eq iproduct.pnum}">
										                    <c:set var="flag" value="true"/>
									                    </c:if>
														<c:if test="${watch.pnum ne iproduct.pnum}">
										                    <c:set var="flag" value="false"/>
									                    </c:if>
								                    </c:if>
							                    </c:forEach>
							                    <c:if test="${flag}">
							                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:white; border: 1px solid #FC7CB9; background: #FC7CB9" 
							                    	href="updateInterest.mall?page=main&index=del&id=${loginInfo.id}&pnum=${watch.pnum}">
								                    	<i class="fi fi-rs-heart"></i>
								                    </a>
							                    </c:if>
							                    <c:if test="${not flag}">
							                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
							                    	href="updateInterest.mall?page=main&index=in&id=${loginInfo.id}&pnum=${watch.pnum}">
								                    	<i class="fi fi-rs-heart"></i>
								                    </a>
							                    </c:if>
						                    </c:if>
						                    <!-- 찜목록을 조회할 수 없을 때 -->
						                    <c:if test="${fn:length(ilists) == 0}">
						                    	<a class="btn flex-shrink-0 py-2 px-3" style="color:#FC7CB9; border: 1px solid #FC7CB9" 
						                    	href="updateInterest.mall?page=main&index=in&id=${loginInfo.id}&pnum=${watch.pnum}">
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
			<c:if test="${watchProductLists eq null}">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<div class="mt-4 mb-4 text-center">
						<font size="4">최근에 본 상품이 없습니다.</font>
					</div>
				</div>
			</c:if>
		</div>
	</c:if>
</section>

<%@ include file="mall_bottom.jsp"%>