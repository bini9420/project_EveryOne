<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
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
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid product-list">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-3">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="javascript:show()" data-bs-toggle="modal"
			data-bs-target="#documentWrite"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50" id="requestDocument"></i>
			결재 요청</a>

		<div class="modal fade" id="documentWrite" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<p>
			평균 별점:
			<fmt:formatNumber value="${avgScore }" pattern=".0" />
			<br>
		</p>
		<c:choose>
			<c:when test="${not empty noReviewsMessage}">
				<p>${noReviewsMessage}</p>
			</c:when>
			<c:otherwise>
				<table border="1">
					<tr>
						<th>작성자</th>
						<th>평점</th>
						<th>Comment</th>
						<c:if test="${loginInfo.id == 'admin'}">
							<th>관리</th>
						</c:if>
					</tr>
					<c:forEach var="review" items="${reviews}">
						<tr>
							<td>${review.id}</td>
							<td>${review.score}</td>
							<td>${review.rcomment}</td>
							<td>
								<button onClick="#">리뷰 검토 요청</button>
							</td>
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
		<button onClick="history.back()">돌아가기</button>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>