<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function show() {
		$('#documentWrite .modal-content').load("document_write.dc");
		$('#documentWrite').modal();
		$('#requestDocument').css('bgcolor', '#2ac1bc');
		$('#requestDocumnet').css('border-color', '#bae8e6');
	}
</script>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-3">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="javascript:show()" data-bs-toggle="modal" data-bs-target="#documentWrite"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50" id="requestDocument"></i> 결재 요청</a>
			
		<div class="modal fade" id="documentWrite" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">

		    </div>
		  </div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-md-3 sm-6">
				<!-- 매출관리 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">매출관리</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary">+</button>
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
				<!-- 재고관리 -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">재고관리</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary">+</button>
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
				<!-- Illustrations -->
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">게시판</h6>
						<button type="button" class="btn float-right btn-sm btn-outline-primary">+</button>
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
						<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
							Illustrations on unDraw &rarr;</a>
					</div>
				</div>
		</div>

	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

