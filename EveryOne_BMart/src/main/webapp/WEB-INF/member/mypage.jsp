<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../mall/mall_top.jsp"%>

<div class="container my-5 p-4" style="background: rgba(110, 175, 176, 0.3); border-radius: 0.375rem">
	<div class="row">
		<div class="col-sm-4 ms-auto">
			<div class="card" style="border: 0px">
				<div class="card-body" style="border-bottom: 8px solid rgba(110, 175, 176, 0.3)">
					<h4 class="card-title fw-bolder pb-2">
						<font class="text-primary">반가워요!</font> ${loginInfo.name}님
						<a class="fw-normal ms-3 px-2 py-1" style="font-size: 16; background: #F5F5F5" href="logout.mb">로그아웃</a>
					</h4>
				</div>
				<div class="card-body">
					<nav class="nav flex-column">
						<font class="my-2 fw-bold" color="#186E6A">자주찾는메뉴</font>
							<a class="nav-link text-muted" aria-current="page" href="mypage.mb?index=orderList">
								<i class="fi fi-rr-document icon"></i>
								주문내역
							</a>
							<a class="nav-link text-muted" aria-current="page" href="watch.mall">
								<i class="fi fi-rr-time-forward icon"></i>
								최근 본 상품
							</a>
							<a class="nav-link text-muted" aria-current="page" href="interest.mall">
								<i class="fi fi-rr-heart icon"></i>
								찜한 상품
								<span class="badge bg-primary rounded-pill">${fn:length(interestLists)}</span>
							</a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">쇼핑</font>
							<a class="nav-link text-muted" aria-current="page" href="mypage.mb?index=review">
								상품 후기
							</a>
						<hr>
						<font class="my-2 fw-bold" color="#186E6A">내 정보관리</font>
							<a class="nav-link text-muted" aria-current="page" href="mypage.mb?index=memberInfoUpdate">
								개인정보수정
							</a>
							<a class="nav-link text-muted" aria-current="page" href="mypage.mb?index=addressInfo">
								배송지 관리
							</a>
						<c:if test="${enter.approveday ne null}">
							<hr>
							<font class="my-2 fw-bold" color="#186E6A">사업</font>
								<a class="nav-link text-muted" aria-current="page" data-bs-toggle="modal" href="#resultModal">
									입점요청결과확인
								</a>
								<a class="nav-link text-muted" aria-current="page" href="checkBusiness.mb?id=${loginInfo.id}">
									사업자페이지
								</a>
						</c:if>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-8 me-auto">
			<%@ include file="mypage_detail.jsp" %>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">입점요청내역</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
						<th>첨부파일</th>
						<th>상태</th>
						<c:if test="${enter.dstatus eq 0}">
							<td rowspan="2"><button type="button" class="btn btn-secondary btn-sm" onclick="location.href='enter_delete.dc?eno=${enter.eno}'">삭제</button></td>
						</c:if>
					</tr>
					<tr>
						<td>${enter.title}</td>
						<td>${enter.businesscode}</td>
						<td>${enter.addr1}&nbsp;${enter.addr2}</td>
						<td>${enter.postnum}</td>
						<td>
							<fmt:parseDate var="writeday" value="${enter.writeday}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${writeday}" pattern="yyyy-MM-dd"/>
						</td>
						<c:if test="${enter.approveday != null}">
							<td>
								<fmt:parseDate var="approveday" value="${enter.approveday}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${approveday}" pattern="yyyy-MM-dd"/>
							</td>
						</c:if>
						<td>
							<a href="<%=request.getContextPath()%>/resources/uploadImage/${enter.originname}" target='_blank'>${enter.originname}</a>
						</td>
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
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../mall/mall_bottom.jsp"%>