<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<!-- carousel -->
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

<!-- TOP button	 -->
<a href="#" class="float">
	<i class="fi fi-rs-arrow-circle-up my-float"></i>
</a>

<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="mb-2">
			<font class="fw-bolder" size="5">[ BEST 상품 ]</font>&nbsp;&nbsp;
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="best" items="${bestProducts}" varStatus="status">
				<c:if test="${status.count <= 4}">
					<div class="col mb-5">
						<div class="card h-100 text-center">
							<!-- Product image-->
							<c:if test="${best.pimage ne null}">
								<% String img = request.getContextPath()+"/image"; %>
								<a href="#">
								<img src="<%=img%>/${best.pimage}" alt="BestProductImg" class="productImg">
							</a>
							</c:if>
							<c:if test="${best.pimage eq null}">
							<a href="#">
								<img src="resources/img/no-pictures.png" alt="BestProductImg" class="productImg">
							</a>
							</c:if>
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
									<a class="btn btn-outline-dark mt-auto" href="#">장바구니 담기</a>
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
			<div class="mb-2">
				<font class="fw-bolder" size="5">[ 최근 본 상품 ]</font>&nbsp;&nbsp;
			</div>
			<c:if test="${watchProductLists ne null}">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
					<c:forEach var="watch" items="${watchProductLists}" varStatus="status">
						<c:if test="${status.count <= 4}">
							<div class="col mb-5">
								<div class="card h-100 text-center">
									<!-- Product image-->
									<c:if test="${watch.pimage ne null}">
										<% String img = request.getContextPath()+"/image"; %>
										<a href="#">
										<img src="<%=img%>/${watch.pimage}" alt="WatchProductImg" class="productImg">
									</a>
									</c:if>
									<c:if test="${watch.pimage eq null}">
									<a href="#">
										<img src="resources/img/no-pictures.png" alt="WatchProductImg" class="productImg">
									</a>
									</c:if>
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
											<a class="btn btn-outline-dark mt-auto" href="#">장바구니 담기</a>
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
		
		<hr style="margin: 0 auto; width: 80%; border: 1.5px solid #DCDCDC">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="mb-2">
				<font class="fw-bolder" size="5">[ 찜한 상품 ]</font>&nbsp;&nbsp;
			</div>
			<c:if test="${interestProductLists ne null}">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
					<c:forEach var="interest" items="${interestProductLists}" varStatus="status">
						<c:if test="${status.count <= 4}">
							<div class="col mb-5">
								<div class="card h-100 text-center">
									<!-- Product image-->
									<c:if test="${interest.pimage ne null}">
										<% String img = request.getContextPath()+"/image"; %>
										<a href="#">
										<img src="<%=img%>/${interest.pimage}" alt="InterestProductImg" class="productImg">
									</a>
									</c:if>
									<c:if test="${interest.pimage eq null}">
									<a href="#">
										<img src="resources/img/no-pictures.png" alt="InterestProductImg" class="productImg">
									</a>
									</c:if>
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder"><a href="#">${interest.pname}</a></h5>
											<!-- Product price-->
											<fmt:formatNumber value="${interest.price}" pattern="##,###원"/>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#">장바구니 담기</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${interestProductLists eq null}">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<div class="mt-4 mb-4 text-center">
						<font size="4">찜한 상품이 없습니다.</font>
					</div>
				</div>
			</c:if>
		</div>
	</c:if>
</section>

<%@ include file="mall_bottom.jsp"%>