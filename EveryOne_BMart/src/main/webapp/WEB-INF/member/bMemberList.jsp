<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">B마트 점주 목록</h1>
<div class="card shadow mx-auto" style="width :80%">
	<div class="card-header py-3">
		<div class="search">
			<form action="bMemberList.mb"
				class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
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
	<div class="card-body">
		<table class="table table-bordered text-center" id="dataTable">
			<thead>
				<tr class="bg-secondary text-white">
					<th>bcode</th>
					<th>id</th>
					<th>카테고리</th>
					<th>우편주소</th>
					<th>주소</th>
					<th>상세주소</th>
				</tr>
			</thead>
			<c:forEach var="bm" items="${bmemLists }">
				<tr>
					<th>${bm.bcode }</th>
					<th>${bm.id }</th>
					<th>${bm.type }</th>
					<th>${bm.post }</th>
					<th>${bm.addr1 }</th>
					<th>${bm.addr2 }</th>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<div class="text-center my-3">
	${pageInfo.pagingHtml }
</div>

<%@include file="../admin/a_bottom.jsp"%>

