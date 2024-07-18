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
/* New CSS rules for sales management section */
.sales-management {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

.sales-management th, .sales-management td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.sales-management th {
	background-color: #f2f2f2;
	color: black;
}

.sales-management tr:hover {
	background-color: #f1f1f1;
}

.sales-management .no-orders {
	text-align: center;
	color: red;
}

.sales-management .pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: #007bff;
}

.sales-management .pagination a.active {
	font-weight: bold;
	color: #0056b3;
}

.sales-management .total-row {
	font-weight: bold;
	background-color: #f9f9f9;
}

.year-filter, .month-filter {
	margin-bottom: 10px;
}

.year-filter a, .month-filter a {
	margin-right: 10px;
	text-decoration: none;
	color: #007bff;
}

.year-filter a.active, .month-filter a.active {
	font-weight: bold;
	color: #0056b3;
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
    document.getElementById('yearSelect').addEventListener('change', function() {
        document.getElementById('dateForm').submit();
    });
    document.getElementById('monthSelect').addEventListener('change', function() {
        document.getElementById('dateForm').submit();
    });
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid">

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
		<form id="dateForm" action="list.od" method="get">
			<select id="yearSelect" name="year">
				<c:forEach var="year" begin="2020" end="2024">
					<option value="${year}"
						<c:if test="${selectedYear == year}">selected</c:if>>${year}년</option>
				</c:forEach>
			</select> <select id="monthSelect" name="month">
				<c:forEach var="month" begin="1" end="12">
					<option value="${month}"
						<c:if test="${selectedMonth == month}">selected</c:if>>${month}월</option>
				</c:forEach>
			</select>
			<button type="submit">조회</button>
		</form>
		<table class="sales-management">
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
					<tr>
						<td colspan="7" class="no-orders">주문이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:set var="totalAmount" value="0" />
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.onum}</td>
							<td>${order.id}</td>
							<td>${order.pnum}</td>
							<td>${order.pamount}</td>
							<td><fmt:formatNumber value="${order.price}" pattern="#,###" /></td>
							<td>${order.status}</td>
							<td><a href="detail.od?onum=${order.onum}">상세보기</a></td>
						</tr>
						<c:set var="totalAmount" value="${totalAmount + order.price}" />
					</c:forEach>
					<tr class="total-row">
						<td colspan="4">총 금액</td>
						<td colspan="3"><fmt:formatNumber value="${totalAmount}"
								pattern="#,###" />원</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<center>${pageInfo.pagingHtml }</center>
	<br>
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
<!-- /.container-fluid -->

<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>
