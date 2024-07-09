
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




<h1 class="h3 mb-2 text-gray-800 title">B마트 회원목록</h1>


<form action="aMemberList.mb" method="post">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">BMart Member List</h6>
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
							<th>${mb.phone }</th>
							<th>${mb.email }</th>

						</tr>

					</c:forEach>


				</table>
			</div>
		</div>
	</div>

</form>
<%@include file="../admin/a_bottom.jsp"%>
