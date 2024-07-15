<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../mall/mall_top.jsp"%>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css"> --%>
<div class="container my-5 p-4"
	style="background: rgba(110, 175, 176, 0.3); border-radius: 0.375rem">
	<div class="row">
		<div class="col-sm-4 ms-auto">
			<div class="card" style="border: 0px">
				<div class="card-body"
					style="border-bottom: 8px solid rgba(110, 175, 176, 0.3)">
					<h4 class="card-title fw-bolder pb-2">
						<font class="text-primary">반가워요!</font> ${loginInfo.name}님 <a
							class="fw-normal ms-3 px-2 py-1"
							style="font-size: 16; background: #F5F5F5" href="logout.mb">로그아웃</a>
					</h4>
				</div>
				<div class="card-body">
					<nav class="nav flex-column">
						<font class="my-2 fw-bold" color="#186E6A">자주찾는메뉴</font> <a
							class="nav-link text-muted" aria-current="page" href="list.od">
							<i class="fi fi-rr-document icon"></i> 주문내역
						</a> <a class="nav-link text-muted" aria-current="page"
							href="watch.mall"> <i class="fi fi-rr-time-forward icon"></i>
							최근 본 상품
						</a> <a class="nav-link text-muted" aria-current="page"
							href="interest.mall"> <i class="fi fi-rr-heart icon"></i> 찜한
							상품 <span class="badge bg-primary rounded-pill">${fn:length(interestLists)}</span>
						</a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">쇼핑</font> <a
							class="nav-link text-muted" aria-current="page" href="#"> 상품
							후기 </a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">내 정보관리</font> <a
							class="nav-link text-muted" aria-current="page"
							href="mypage.mb?index=memberInfoUpdate"> 개인정보수정 </a> <a
							class="nav-link text-muted" aria-current="page"
							href="mypage.mb?index=addressInfo"> 배송지 관리 </a>
						<c:if test="${enter ne null}">
							<hr>
							<font class="my-2 fw-bold" color="#186E6A">사업</font>
							<a class="nav-link text-muted" aria-current="page"
								data-bs-toggle="modal" href="#resultModal"> 입점요청결과확인 </a>
							<a class="nav-link text-muted" aria-current="page"
								href="checkBusiness.mb?id=${loginInfo.id}"> 사업자페이지 </a>
						</c:if>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-6 me-auto">
			<div class="card h-100" style="border: 0px">
				<div class="card-body">
					<h5 class="card-title text-primary fw-bolder">주문내역</h5>
					<div class="m-auto w-50 text-center">
		<table>
			<tr>
				<th>주문번호</th>
				<th>고객 ID</th>
				<th>상품번호</th>
				<th>수량</th>
				<th>금액</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
			<c:choose>
				<c:when test="${pageInfo.totalCount == 0}">
					<table align="center">
						<tr>
							<td>주문이 없습니다.</td>
						</tr>
					</table>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.onum}</td>
							<td>${order.id}</td>
							<td>${order.pnum}</td>
							<td>${order.pamount}</td>
							<td>${order.price}</td>
							<td>${order.status}</td>
							<td><a href="detail.od?onum=${order.onum}">상세보기</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		</div></div></div></div>
		<div class="pagination">
			<c:if test="${count > 0}">
				<%
                int pageCount = (Integer) request.getAttribute("count") / (Integer) request.getAttribute("pageSize") + 
                                ((Integer) request.getAttribute("count") % (Integer) request.getAttribute("pageSize") == 0 ? 0 : 1);
                int pageBlock = 10;
                int startPage = ((Integer) request.getAttribute("currentPage") - 1) / pageBlock * pageBlock + 1;
                int endPage = startPage + pageBlock - 1;
                if (endPage > pageCount) {
                    endPage = pageCount;
                }
            %>
				<c:if test="${startPage > 1}">
					<a href="list.od?pageNum=${startPage-1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list.od?pageNum=${i}"
						class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="list.od?pageNum=${startPage+pageBlock}">[다음]</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="resultModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">입점요청내역</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="enter text-center mx-auto my-4">
					<tr>
						<th>제목</th>
						<th>사업자코드</th>
						<th>주소</th>
						<th>우편번호</th>
						<th>작성일</th>
						<c:if test="${enter.approveday != null}">
							<th>승인일</th>
						</c:if>
						<th>상태</th>
					</tr>
					<tr>
						<td>${enter.title}</td>
						<td>${enter.businesscode}</td>
						<td>${enter.addr1}&nbsp;${enter.addr2}</td>
						<td>${enter.postnum}</td>
						<td><fmt:parseDate var="writeday" value="${enter.writeday}"
								pattern="yyyy-MM-dd" /> <fmt:formatDate value="${writeday}"
								pattern="yyyy-MM-dd" /></td>
						<c:if test="${enter.approveday != null}">
							<td><fmt:parseDate var="approveday"
									value="${enter.approveday}" pattern="yyyy-MM-dd" /> <fmt:formatDate
									value="${approveday}" pattern="yyyy-MM-dd" /></td>
						</c:if>
						<c:choose>
							<c:when test="${enter.dstatus == -1}">
								<td><span class="badge bg-danger">반려</span></td>
							</c:when>
							<c:when test="${enter.dstatus == 0}">
								<td><span class="badge bg-warning">대기</span></td>
							</c:when>
							<c:when test="${enter.dstatus == 1}">
								<td><span class="badge bg-primary">승인완료</span></td>
							</c:when>
						</c:choose>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../mall/mall_bottom.jsp"%>