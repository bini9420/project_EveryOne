<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
/* Add necessary CSS styles */
.product-list {
	width: 100%;
	margin: 20px 0;
}
.product-list table {
	width: 100%;
	border-collapse: collapse;
}
.product-list th, .product-list td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}
.product-list th {
	background-color: #f2f2f2;
	color: black;
}
.product-list tr:hover {
	background-color: #f1f1f1;
}
.product-list .no-products {
	text-align: center;
	color: red;
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
<div class="container product-list">
	<div class="row">
		<c:choose>
			<c:when test="${not empty noReviewsMessage}">
				<p class="no-products">${noReviewsMessage}</p>
			</c:when>
			<c:otherwise>
				<table border="1">
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
					<c:forEach var="review" items="${reviews}">
						<tr>
							<td>${review.id}</td>
							<td>${review.score}</td>
							<td>${review.rcomment}</td>
							<td><img src="<%=request.getContextPath()%>/resources/uploadImage/${review.image}" alt="Review Image" width="100" /></td>
							<td>${review.pnum}</td>
							<c:if test="${loginInfo.id == 'admin'}">
								<td>
									<button class="btn btn-primary btn-sm" onClick="confirmDelete('${review.rnum}', '${review.pnum}')">삭제</button>
								</td>
							</c:if>
							<td><button onClick="checkReview('${review.rnum}')">리뷰 검토</button></td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<button onClick="history.back()">돌아가기</button>
	</div>
</div>
<%@ include file="../member/owner/o_bottom.jsp"%>
