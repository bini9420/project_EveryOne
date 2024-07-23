<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp" %>
<div class="container px-4 px-lg-5 mt-5">
	<div class="mb-4 text-center fs-3">
		<font class="fw-bolder" style="color: #2ac1bc">찜한 상품</font>
	</div>
	<div class="mt-5 mb-3 p-2 text-end bg-light">
		<a href="interest.mall?range=recently">최신순</a>&nbsp;|&nbsp;
		<a href="interest.mall?range=highPrice">높은 가격순</a>&nbsp;|&nbsp;
		<a href="interest.mall?range=rowPrice">낮은 가격순</a>
	</div>
	<c:if test="${fn:length(ilists) > 0}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="in" items="${ilists}">
				<div class="col my-4">
					<div class="card text-center pb-3" style="height: 350">
						<c:if test="${in.ad == 1}">
							<div class="text-end pt-2 pe-2">
								<img src="resources/img/ad.png" style="width: 30; height: 25">
							</div>
						</c:if>
						<c:if test="${in.ad == 0}">
							<div class="p-3"> </div>
						</c:if>
						<div class="card-body p-2">
						<!-- Product image-->
							<a href="detail.mall?pnum=${in.pnum}">
								<c:if test="${in.pimage ne null}">
									<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
									<img src="<%=img%>${in.pimage}" alt="interestProductImg" class="productImg">
								</c:if>
								<c:if test="${in.pimage eq null}">
									<img src="resources/img/no-pictures.png" alt="interestProductImg" class="productImg">
								</c:if>
							</a> 
							<!-- Product details-->
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><a href="#">${in.pname}</a></h5>
								<!-- Product price-->
								<fmt:formatNumber value="${in.price}" pattern="##,###원"/>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?index=interest&id=${loginInfo.id}&pnum=${in.pnum}&qty=1&range=${param.range}&pageNumber=${pageInfo.pageNumber}">장바구니 담기</a>
		                    	<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
		                    	href="updateInterest.mall?page=interest&index=del&id=${loginInfo.id}&pnum=${in.pnum}&range=${param.range}&pageNumber=${pageInfo.pageNumber}">
			                    	<i class="fi fi-rs-heart"></i>
			                    </a>
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
	<c:if test="${fn:length(ilists) == 0}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center h-75">
			<div class="mt-4 mb-4 text-center">
				<font size="4">찜한 상품이 없습니다.</font>
			</div>
		</div>
	</c:if>
</div>
<%@ include file="mall_bottom.jsp"%>