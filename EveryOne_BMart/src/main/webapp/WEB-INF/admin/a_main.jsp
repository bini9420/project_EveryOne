<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="a_top.jsp"%>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								<h5>
									<a href="aMemberList.mb">회원</a>/<a href="productList.prd">상품
										관리</a>
								</h5>

							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								<h5>
									<a href="top.sale">월간수입</a>
								</h5>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">
								<h5>
									<a href="">결재함</a>
								</h5>
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 50%" aria-valuenow="50" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								<h5>
									<a href="">게시판</a>
								</h5>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800 "></h1>
		<p class="mb-4"></p>

		<!-- Content Row -->
		<div class="row">

			<div class="col-xl-8 col-lg-7">












				<!-- Area Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">매출현황</h6>
					</div>
					<div class="card-body">
						<div class="chart-container">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>

				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">일정표</h6>
					</div>
					<div id='external-events'>



						<div id='calendar-container'>
							<div id='calendar'></div>
							  
						</div>
<div id='calendar-container'>
    <div id='calendar'></div>
</div>

					</div>
				</div>
			</div>
			<!-- 결재 문서함 -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">결재 문서</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-container">
							<div class="table-responsive">
								<table
									class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
									<thead>
										<tr>
											<th>문서종류</th>
											<th>문서번호</th>
											<th>제목</th>
											<th>작성일자</th>
											<th>결재상태</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="doc" items="${docList}">
											<tr onclick="detailDocument('${doc.dnum}')"
												data-bs-toggle="modal" data-bs-target="#staticBackdrop">
												<td>[${doc.dcategory}]</td>
												<td>
													<h6 class="mb-1">${doc.dnum}</h6>

												</td>
												<td>
													<h6 class="mb-1">${doc.title}</h6>
												</td>
												<td>
													<h6 class="mb-1">${fn:substring(doc.writeday, 0, 10)}</h6>
												</td>
												<!-- 
							                    	-1: 반려 / 0: 대기(결재진행중) / 1: 승인(결재완료) / 10: 임시저장
							                     -->
												<td id="documentStatus" align="left"><c:if
														test="${doc.dstatus eq -1}">
														<span class="badge rounded-pill bg-danger">반려</span>
													</c:if> <c:if test="${(doc.dstatus eq 0) && (doc.request eq 1)}">
														<span class="badge rounded-pill bg-info">대기</span>
													</c:if> <c:if test="${doc.dstatus eq 1}">
														<span class="badge rounded-pill bg-success">승인</span>
													</c:if> <c:if test="${(doc.request eq 0) && (doc.dstatus eq 0)}">
														<span class="badge rounded-pill bg-warning">임시저장</span>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<!-- document_DetailView.jsp가 들어올 부분 -->
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<%@include file="a_bottom.jsp"%>