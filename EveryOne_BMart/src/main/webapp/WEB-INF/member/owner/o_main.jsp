<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="o_top.jsp"%>
<style>
<<<<<<< HEAD
	h6 {
		display: inline-block;
	}
	#requestDocument:hover {
		background-color: #7dc9c6 !important;
		border-color: #bae8e6 !important;
	}
=======
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
>>>>>>> refs/remotes/origin/CHO
</style>

<<<<<<< HEAD
<div class="container-fluid h-100">
=======
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function show() {
		$('#documentWrite .modal-content').load("document_write.dc");
		$('#documentWrite').modal();
		$('#requestDocument').css('bgcolor', '#2ac1bc');
		$('#requestDocumnet').css('border-color', '#bae8e6');
	}
</script>

<%@ include file="o_top.jsp"%>
<div class="container-fluid">
>>>>>>> refs/remotes/origin/CHO

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-3">
		<h1 class="h3 mb-0 text-gray-800"></h1>
<<<<<<< HEAD
		<a href="javascript:show()" data-bs-toggle="modal" data-bs-target="#documentWrite"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50" id="requestDocument"></i> 결재 요청
		</a>
=======
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
>>>>>>> refs/remotes/origin/CHO
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-md-3 sm-6">
<<<<<<< HEAD
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
=======
			<!-- 매출관리 -->
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">매출관리</h6>
					<button type="button"
						class="btn float-right btn-sm btn-outline-primary"
						onclick="location.href='list.od'">+</button>
>>>>>>> refs/remotes/origin/CHO
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
					<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
						Illustrations on unDraw &rarr;</a>
				</div>
			</div>
		</div>

		<div class="col-md-3 sm-6">
<<<<<<< HEAD
				<!-- 재고관리 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">재고관리</h6>
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
=======
			<!-- 재고관리 -->
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">재고관리</h6>
					<button type="button"
						class="btn float-right btn-sm btn-outline-primary"
						onClick="location.href='list.prd'">+</button>
>>>>>>> refs/remotes/origin/CHO
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
					<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
						Illustrations on unDraw &rarr;</a>
				</div>
			</div>
		</div>

		<div class="col-md-3 sm-6">
<<<<<<< HEAD
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
=======
			<!-- Illustrations -->
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">게시판</h6>
					<button type="button"
						class="btn float-right btn-sm btn-outline-primary"
						onClick="location.href='dlist.nt'">+</button>
>>>>>>> refs/remotes/origin/CHO
				</div>
				<div class="card-body">
					<div class="text-center">
						<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
							style="width: 25rem;"
							src="<%=request.getContextPath()%>/resources/img/undraw_posting_photo.svg"
							alt="...">
					</div>
					<p>
						Add some quality, svg illustrations to your project courtesy of <a
							target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
						a constantly updated collection of beautiful svg images that you
						can use completely free and without attribution!
					</p>
					<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
						Illustrations on unDraw &rarr;</a>
				</div>
			</div>
		</div>

		<div class="col-md-3 sm-6">
<<<<<<< HEAD
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
=======
			<!-- 결재함 -->
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재함</h6>
					<button type="button"
						class="btn float-right btn-sm btn-outline-primary"
						onclick="location.href='document_box.dc'">+</button>
>>>>>>> refs/remotes/origin/CHO
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
					<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
						Illustrations on unDraw &rarr;</a>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
</div>

<!-- End of Main Content -->

<%@ include file="o_bottom.jsp"%> 