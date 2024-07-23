<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Begin Page Content -->
<style>
	h6 {
		display: inline-block;
	}
	#requestDocument:hover {
		background-color: #7dc9c6 !important;
		border-color: #bae8e6 !important;
	}
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script>
    document.getElementById('yearSelect').addEventListener('change', function() {
        document.getElementById('dateForm').submit();
    });
    document.getElementById('monthSelect').addEventListener('change', function() {
        document.getElementById('dateForm').submit();
    });
</script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container">
    <!-- Content Row -->
    <div class="row justify-content-center">
        <form id="dateForm" action="list.od" method="get" class="d-flex justify-content-center align-items-center">
             <select id="yearSelect" name="year" class="form-select me-2" style="width: 20%">
                 <c:forEach var="year" begin="2020" end="2024">
                     <option value="${year}" <c:if test="${selectedYear == year}">selected</c:if>>${year}년</option>
                 </c:forEach>
             </select>
             <select id="monthSelect" name="month" class="form-select me-2" style="width: 20%">
                 <c:forEach var="month" begin="1" end="12">
                     <option value="${month}" <c:if test="${selectedMonth == month}">selected</c:if>>${month}월</option>
                 </c:forEach>
             </select>
             <button type="submit" class="btn btn-outline-primary">조회</button>
        </form>
    </div>
</div>

	
		
<div class="container h-100">		
	<div class="row">
		<div class="col-xl-12">
		<div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">등록한 상품 전체 리뷰</h6>
	        </div>
	                                
			<div class="card-body">
	        <div class="table-responsive">
				<table class="table bsb-table-xl text-nowrap align-middle m-0">
					<thead>
					<tr>
						<th>주문번호</th>
						<th>고객 ID</th>
						<th>상품번호</th>
						<th>수량</th>
						<th>금액</th>
						<th>상태</th>
						<th>관리</th>
					</tr>
					</thead>
					
					<tbody>
					<c:choose>
						<c:when test="${pageInfo.totalCount == 0}">
							<tr>
								<td colspan="7" align="center">주문이 없습니다.</td>
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
					</tbody>
				</table>
			</div>
			</div>
		</div>
		</div>
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
				<a href="list.od?pageNum=${i}" class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
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
