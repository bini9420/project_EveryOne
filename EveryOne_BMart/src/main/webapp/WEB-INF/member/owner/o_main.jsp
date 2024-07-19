<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="o_top.jsp"%>
<style>
	h6 {
		display: inline-block;
	}
	#requestDocument:hover {
		background-color: #7dc9c6 !important;
		border-color: #bae8e6 !important;
	}
</style>

<div class="container-fluid h-100">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-3">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="javascript:show()" data-bs-toggle="modal" data-bs-target="#documentWrite"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50" id="requestDocument"></i> 결재 요청
		</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-md-3 sm-6">
				<!-- 매출관리 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">매출관리</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary" onclick="location.href='list.od'">+</button>
					</div>
					<div class="card-body">
						<div class="text-center">
							<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
								style="width: 25rem;"
								src="<%=request.getContextPath()%>/resources/images/sales.png"
								alt="...">
						</div>
						<p>
							Add some quality, svg illustrations to your project courtesy of <a
								target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
							a constantly updated collection of beautiful svg images that you
							can use completely free and without attribution!
						</p>
						<a target="_blank" rel="nofollow" href="https://undraw.co/">Go to the Page &rarr;</a>
					</div>
				</div>
		</div>
		
		<div class="col-md-3 sm-6">
				<!-- 재고관리 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">상품관리</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary" onClick="location.href='productList_owner.prd'">+</button>
					</div>
					<div class="card-body">
						<div class="text-center">
							<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
								style="width: 25rem;"
								src="<%=request.getContextPath()%>/resources/images/stock.png"
								alt="...">
						</div>
						<p>
							Add some quality, svg illustrations to your project courtesy of <a
								target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
							a constantly updated collection of beautiful svg images that you
							can use completely free and without attribution!
						</p>
						<a target="_blank" rel="nofollow" href="https://undraw.co/">Go to the Page &rarr;</a>
					</div>
				</div>
		</div>
		
		<div class="col-md-3 sm-6">
				<!-- 게시판 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">게시판</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary" onClick="location.href='dlist.nt'">+</button>
					</div>
					<div class="card-body">
						<div class="text-center">
							<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
								style="width: 25rem;"
								src="<%=request.getContextPath()%>/resources/images/board.png"
								alt="...">
						</div>
						<p>
							Add some quality, svg illustrations to your project courtesy of <a
								target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
							a constantly updated collection of beautiful svg images that you
							can use completely free and without attribution!
						</p>
						<a target="_blank" rel="nofollow" href="https://undraw.co/">Go to the Page &rarr;</a>
					</div>
				</div>
		</div>
		
		<div class="col-md-3 sm-6">
				<!-- 결재함 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">결재함</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary" onclick="location.href='document_box.dc'">+</button>
					</div>
					<div class="card-body">
						<div class="text-center">
							<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
								style="width: 25rem;"
								src="<%=request.getContextPath()%>/resources/images/document_box.png"
								alt="...">
						</div>
						<p>
							Add some quality, svg illustrations to your project courtesy of <a
								target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
							a constantly updated collection of beautiful svg images that you
							can use completely free and without attribution!
						</p>
						<a target="_blank" rel="nofollow" href="document_box.dc">Go to the Page &rarr;</a>
					</div>
				</div>
		</div>

	</div>
	<!-- /.container-fluid -->
</div>

<!-- End of Main Content -->

<%@ include file="o_bottom.jsp"%> 