<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="cs_top.jsp"%>

<div class="container my-5 p-4">
	<div class="row">
		<div class="col-sm-4">
			<div class="card bg-light">
				<div class="card-body">
					<nav class="nav flex-column">
						<form action="" method="post" class="d-flex">
							<input type="text" name="keyword" class="form-control w-75" placeholder="search">
							<button type="button" class="btn btn-secondary ms-2">검색</button>
						</form>
						<hr>
						<font class="my-2" color="#186E6A">배민 B마트</font>
						<a class="nav-link text-muted" aria-current="page" href="#">
							F&A
						</a>
						<a class="nav-link text-muted" aria-current="page" href="#">
							공지사항
						</a>
						<hr>
						<a class="nav-link text-primary" aria-current="page" href="main.mall">
							배민 B마트로 돌아가기
						</a>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card bg-light" style="border: 0px">
				<%@ include file="cs_detail.jsp" %>
			</div>
		</div>
	</div>
</div>

<%@ include file="cs_bottom.jsp"%>