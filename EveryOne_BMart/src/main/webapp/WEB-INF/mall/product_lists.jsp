<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>상품목록</title>


<%@ include file="mall_top.jsp"%>

<div class="container px-4 px-lg-5 mt-5">
	<div class="mb-2 text-center fs-3">
		<font class="fw-bolder">[ ${category} ]</font>&nbsp;&nbsp;
	</div>
	<div class="mb-2 p-2 text-end bg-light">
		<a href="plists.mall?category=${category}&range=recently" class="text-muted">최신순</a>&nbsp;|&nbsp;
		<a href="plists.mall?category=${category}&range=best" class="text-muted">인기순</a>&nbsp;|&nbsp;
		<a href="plists.mall?category=${category}&range=highPrice" class="text-muted">높은 가격순</a>&nbsp;|&nbsp;
		<a href="plists.mall?category=${category}&range=rowPrice" class="text-muted">낮은 가격순</a>
	</div>
	<c:if test="${plists ne null}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="product" items="${plists}" varStatus="status">
				<div class="col mb-5">
					<div class="card h-100 text-center">
						<!-- Product image-->
						<c:if test="${product.pimage ne null}">
							<% String img = request.getContextPath()+"/image"; %>
							<a href="#">
							<img src="<%=img%>/${product.pimage}" alt="ProductImg" class="productImg">
						</a>
						</c:if>
						<c:if test="${product.pimage eq null}">
						<a href="#">
							<img src="resources/img/no-pictures.png" alt="ProductImg" class="productImg">
						</a>
						</c:if>
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
								<a class="btn btn-outline-dark mt-auto" href="#">장바구니 담기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="mb-3 p-2 text-center">
			${pageInfo.pagingHtml}
		</div>
	</c:if>
	<c:if test="${plists eq null}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="mt-4 mb-4 text-center">
				<font size="4">해당 카테고리에 등록된 상품이 없습니다.</font>
			</div>
		</div>
	</c:if>
</div>

<%@ include file="mall_bottom.jsp"%>