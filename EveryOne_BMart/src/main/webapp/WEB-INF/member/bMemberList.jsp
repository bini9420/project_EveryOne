
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>



<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">B마트 점주 목록</h1>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<div class="card-body">
			<div class="search">
				<form action="bMemberList.mb" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="keyword"
							class="form-control bg-white border-0 small reading"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>bcode</th>
						<th>id</th>
						<th>카테고리</th>
						<th>우편주소</th>
						<th>주소</th>
						<th>상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty bmemLists}">
							<tr>
								<td colspan="6" class="text-center">목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="bm" items="${bmemLists}">
								<tr>
									<td>${bm.bcode}</td>
									<td>${bm.id}</td>
									<td>${bm.type}</td>
									<td>${bm.post}</td>
									<td>${bm.addr1}</td>
									<td>${bm.addr2}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="pagination-wrapper">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">${pageInfo.pagingHtml}</li>
		</ul>
	</nav>
</div>

<%@include file="../admin/a_bottom.jsp"%>

