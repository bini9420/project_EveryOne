<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
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
                location.href = 'delete.prd?pnum=' + pnum + "&pageNumber=" + pageNumber;
            }
        }
        function goUpdate(pnum, pageNumber) {
            location.href="update.prd?pnum=" + pnum +"&pageNumber=" + pageNumber;
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
		<table>
			<tr>
				<th>번호</th>
				<c:if test="${loginInfo.id == 'admin' }">
					<th>등록자</th>
				</c:if>
				<th>이름</th>
				<th>가격</th>
				<th>재고</th>
				<th>관리</th>
			</tr>
			<c:choose>
				<c:when test="${pageInfo.totalCount == 0}">
					<tr>
						<td colspan="5" class="no-products">상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="prd" items="${products}">
						<tr>
							<td>${prd.pnum}</td>
							<c:if test="${loginInfo.id == 'admin' }">
								<td>${prd.id }</td>
							</c:if>
							<td><a
								href="detail.prd?pnum=${prd.pnum}&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${prd.pname}</a></td>
							<td>${prd.price}</td>
							<td>${prd.stock}</td>
							<td><input type="hidden" name="pnum" value="${prd.pnum}">
								<input type="button" value="삭제"
								onClick="confirmDelete('${prd.pnum}','${pageInfo.pageNumber}')">
								<c:if test="${!isAdmin}">
									<input type="button" value="수정"
										onClick="goUpdate('${prd.pnum}','${pageInfo.pageNumber}')">
								</c:if></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<c:if test="${loginInfo.id == 'admin' }">
			<div class="search-form">
				<form action="list.prd" method="get">
					<select name="whatColumn">
						<option value="all">전체검색</option>
						<option value="id">등록자</option>
					</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">
				</form>
			</div>
		</c:if>
	</div>
	<br>
	<center>${pageInfo.pagingHtml }</center>
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
				<a href="list.prd?pageNum=${startPage-1}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="list.prd?pageNum=${i}"
					class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="list.prd?pageNum=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>