<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/prdStyle.css">

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
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid product-list">
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
					</tr>
					<c:forEach var="review" items="${reviews}">
						<tr>
							<td>${review.id}</td>
							<td>${review.score}</td>
							<td>${review.rcomment}</td>
							<td><img src="${pageContext.request.contextPath}/resources/image/${review.image}" alt="Review Image" width="100" /></td>
							<td>${review.pnum}</td>
							<c:if test="${loginInfo.id == 'admin'}">
								<td>
									<button onClick="confirmDelete('${review.rnum}', '${review.pnum}')">삭제</button>
								</td>
							</c:if>
						</tr> 
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<button onClick="history.back()">돌아가기</button>
	</div>
</div>
<%@ include file="../member/owner/o_bottom.jsp"%>
