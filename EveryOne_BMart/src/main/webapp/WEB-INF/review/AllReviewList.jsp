<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<style>
	.center-button {
        display: flex;
        justify-content: center;
        margin-bottom: 15px;
    }
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function confirmDelete(rnum, pnum) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = 'delete.rv?rnum=' + rnum + '&pnum=' + pnum;
		}
	}

	function checkReview(rnum) {
		var check = confirm('선택하신 리뷰를 검토요청 하시겠습니까?\n승인시에는 해당 리뷰가 삭제됩니다');
		if(check) {
			location.href="rcheckInsert.dc?rnum=" + rnum;			
		}
	} 
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container h-100">
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">전체 리뷰</h6>
				</div>
	                               
				<div class="card-body">
					<div class="table-responsive">
						<table class="table bsb-table-xl text-nowrap align-middle m-0">
							 <thead>
								<tr>
						        	<th>작성자</th>
									<th>평점</th>
									<th>Comment</th>
									<th>이미지</th>
									<th>상품번호</th>
									<c:if test="${loginInfo.id == 'admin'}">
										<th>관리</th>
									</c:if>
									<th>요청</th>
								</tr>
						     </thead>
						     
						     <tbody>
							 <c:choose>
								<c:when test="${not empty noReviewsMessage}">
									<tr>
										<c:if test="${loginInfo.id == 'admin'}">
											<td colspan="7" align="center">${noReviewsMessage}</td>
										</c:if>
										<td colspan="6" align="center">${noReviewsMessage}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="review" items="${reviews}">
										<tr>
											<td>${review.id}</td>
											<td>${review.score}</td>
											<td>${review.rcomment}</td>
											<td><img src="${pageContext.request.contextPath}/resources/uploadImage/${review.image}" alt="Review Image" width="100"/></td>
											<td>${review.pnum}</td>
											<c:if test="${loginInfo.id == 'admin'}">
												<td>
													<button class="btn btn-primary btn-sm" onClick="confirmDelete('${review.rnum}', '${review.pnum}')">삭제</button>
												</td>
											</c:if>
											<td><button class="btn btn-outline-primary btn-sm" onClick="checkReview('${review.rnum}')">리뷰 검토</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>	
			
			<div class="center-button">
               	<button class="btn btn-secondary" onClick="history.back()">돌아가기</button>
            </div>
		</div>
	</div>
</div>
<%@ include file="../member/owner/o_bottom.jsp"%>