<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800 title">B마트 회원목록</h1>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<div class="card-body">

			<div class="search">
				<form action="aMemberList.mb"
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
	</div>

	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>회원아이디</th>
						<th>회원이름</th>
						<th>전화번호</th>
						<th>이메일주소</th>
					</tr>
				</thead>

				<c:forEach var="mb" items="${memberLists }">
					<tr>
						<th>${mb.id }</th>
						<th>${mb.name }</th>
						<th>${mb.phone1 }-${mb.phone2 }-${mb.phone3 }</th>
						<th>${mb.email1 }${mb.email2 }</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>


<div class="pagination-wrapper">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">${pageInfo.pagingHtml }</li>
		</ul>
	</nav>
</div>

<%@include file="../admin/a_bottom.jsp"%>
