<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Begin Page Content -->
<style>
h6 {
	display: inline-block;
}

.btn-outline-primary {
	width: 30px;
	height: 30px;
}

#requestDocument:hover {
	background-color: #7dc9c6 !important;
	border-color: #bae8e6 !important;
}

/* New CSS rules for the product list section */
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

.product-list .pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: #007bff;
}

.product-list .pagination a.active {
	font-weight: bold;
	color: #0056b3;
}

.product-list .search-form {
	margin: 20px 0;
	text-align: center;
}

.product-list .search-form input[type="text"] {
	width: 200px;
	padding: 5px;
}

.product-list .search-form input[type="submit"] {
	padding: 5px 10px;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function show() {
		$('#documentWrite .modal-content').load("document_write.dc");
		$('#documentWrite').modal();
		$('#requestDocument').css('bgcolor', '#2ac1bc');
		$('#requestDocumnet').css('border-color', '#bae8e6');
	}
	function confirmDelete(pnum, pageNumber) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = 'delete.prd?pnum=' + pnum + "&pageNumber="
					+ pageNumber;
		}
	}
	function goUpdate(pnum, pageNumber) {
		location.href = "update.prd?pnum=" + pnum + "&pageNumber=" + pageNumber;
	}
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
<div class="card shadow mx-auto py-5" style="width :80%; margin-top: 80px">
	
	<div class="text-center my-3">
		<h3 style="font-weight: bold">상품별 리뷰 확인</h3>
	</div>
	<div class="container">
		<div class="text-end">
			<button onClick="history.back()" class="btn btn-primary btn-sm">돌아가기</button>
		</div>
		<p>
			<c:if test="${empty noReviewsMessage}">
			평균 별점:
			<fmt:formatNumber value="${avgScore }" pattern=".0" />
			</c:if>
			<br>
		</p>
		<c:choose>
			<c:when test="${not empty noReviewsMessage}">
				<p>${noReviewsMessage}</p>
			</c:when>
			<c:otherwise>
				<table class="table table-striped table-hover table-bordered mx-auto text-center my-4">
					<tr style="background: rgba(42, 193, 188, 0.3); color: black">
						<th>작성자</th>
						<th>평점</th>
						<th>Comment</th>
						<c:if test="${loginInfo.id != 'admin'}">
						<th></th>
						</c:if>
						<c:if test="${loginInfo.id == 'admin'}">
							<th>관리</th>
						</c:if>
					</tr>
					<c:forEach var="review" items="${reviews}">
						<tr>
							<td>${review.id}</td>
							<td>${review.score}</td>
							<td>${review.rcomment}</td>
							<c:if test="${loginInfo.id != 'admin'}">
							<td>
								<button onClick="checkReview('${review.rnum}')" class="btn btn-primary">리뷰 검토 요청</button>
							</td>
							</c:if>
							<c:if test="${loginInfo.id == 'admin'}">
								<td>
									<button onClick="confirmDelete('${review.rnum}', '${pnum}')">삭제</button>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>