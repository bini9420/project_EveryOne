<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp" %>

<div class="container px-4 px-lg-5 mt-5">
	<div class="mb-4 text-center fs-3">
		<font class="fw-bolder" style="color: #2ac1bc">최근 본 상품</font>
	</div>
	<div class="mt-5 mb-3 p-2 text-end bg-light">
		<a href="watch.mall?range=recently">최신순</a>&nbsp;|&nbsp;
		<a href="watch.mall?range=highPrice">높은 가격순</a>&nbsp;|&nbsp;
		<a href="watch.mall?range=rowPrice">낮은 가격순</a>
	</div>
	<c:if test="${fn:length(wlists) > 0}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="watch" items="${wlists}">
				<div class="col my-4">
					<div class="card text-center pb-3" style="height: 350">
						<c:if test="${watch.ad == 1}">
							<div class="text-end pt-2 pe-2">
								<img src="resources/img/ad.png" style="width: 30; height: 25">
							</div>
						</c:if>
						<c:if test="${watch.ad == 0}">
							<div class="p-3"> </div>
						</c:if>
						<div class="card-body p-2">
							<!-- Product image-->
							<a href="detail.mall?pnum=${watch.pnum}">
								<c:if test="${watch.pimage ne null}">
									<% String img = request.getContextPath()+"/resources/uploadImage/"; %>
									<img src="<%=img%>${watch.pimage}" alt="productImg" class="productImg">
								</c:if>
								<c:if test="${watch.pimage eq null}">
									<img src="resources/img/no-pictures.png" alt="productImg" class="productImg">
								</c:if>
							</a>
							<!-- Product details-->
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><a href="#">${watch.pname}</a></h5>
								<!-- Product price-->
								<fmt:formatNumber value="${watch.price}" pattern="##,###원"/>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-primary mt-auto" href="insertCart.mall?index=watch&id=${loginInfo.id}&pnum=${watch.pnum}&qty=1&range=${param.range}&pageNumber=${pageInfo.pageNumber}">장바구니 담기</a>
		                    	<c:if test="${fn:length(interestLists) > 0}">
									<!-- flag를 선언. false일 때만 출력하고 true면 반복문을 빠져나가도록. -->
				                    <c:set var="flag" value="false"/>
									<c:forEach var="iproduct" items="${interestLists}">
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
										<a class="btn flex-shrink-0 py-2 px-3 btn-danger"
				                    	href="updateInterest.mall?page=watch&index=del&id=${loginInfo.id}&pnum=${watch.pnum}&range=${range}&pageNumber=${pageInfo.pageNumber}">
											<i class="fi fi-rs-heart"></i>
					                    </a>
									</c:if>
			                    	<c:if test="${not flag}">
				                    	<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
				                    	href="updateInterest.mall?page=watch&index=in&id=${loginInfo.id}&pnum=${watch.pnum}&range=${range}&pageNumber=${pageInfo.pageNumber}">
					                    	<i class="fi fi-rs-heart"></i>
					                    </a>
									</c:if>
			                    </c:if>
			                    <!-- 찜목록을 조회할 수 없을 때 -->
			                    <c:if test="${fn:length(interestLists) == 0}">
									<a class="btn flex-shrink-0 py-2 px-3 btn-outline-danger"
									href="updateInterest.mall?page=watch&index=in&id=${loginInfo.id}&pnum=${watch.pnum}&range=${range}&pageNumber=${pageInfo.pageNumber}">
				                    	<i class="fi fi-rs-heart"></i>
				                    </a>
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
	<c:if test="${fn:length(wlists) == 0}">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center h-75">
			<div class="mt-4 mb-4 text-center">
				<img src="resources/img/no-watch.png" alt="..." class="productImg m-3"/><br>
				<font size="4">최근 본 상품이 없습니다.</font>
			</div>
		</div>
	</c:if>
</div>
<%@ include file="mall_bottom.jsp"%>