<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<style>
	.fa-folder-open {
		float: left;
		margin-right: 5px;
	}
	h1 {
		float: left;
	}
	.searchTd {
		padding: 5px;
	}
	.spaceTd {
		padding-right: 70px;
	}
	.testSize {
		width: 120px;
	}
	#pageNation {
		text-align: center;
	}
	#waitBox:hover, #tempBox:hover, #returnBox:hover, #approveBox:hover {
		cursor: pointer;
	}
</style>
<%@ include file="../admin/a_top.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function detailDocument(eno) {
		$('.modal-content').load("adminDocument_detail.dc?eno="+eno);
		$('#staticBackdrop').modal('show');
	}
</script>

<!-- document_box.jsp<br> -->
<!-- Begin Page Content -->
<div class="mx-auto" style="width: 85%">
	<div class="row">
		<!-- Page Heading -->
		<div class="d-flex align-items-center justify-content-start mb-4">
			<i class="fas fa-folder-open fa-2x text-gray-500 me-2"></i>
			<h1 class="h3 mb-0 text-gray-800">입점신청함</h1>
		</div>
	</div>

<!-- 검색 -->
	<div class="row">
		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-body">
					<form action="admin_enterBox.dc">
						<table class="mx-auto">
							<tr>
								<td class="searchTd spaceTd">
									<select class="form-select form-select-sm" name="whatColumn">
										<option value="all">전체검색
										<option value="eno">문서번호
										<option value="businesscode">사업자번호
										<option value="title">제목
									</select>
								</td>
								<td class="searchTd spaceTd" colspan="3">
									<input type="text" class="form-control form-control-sm" name="keyword">
								</td>
								<td align="center">
									<input type="submit" class="btn btn-primary" id="searchBtn" value="Search">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 결재문서 목록-->
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재 문서</h6>
				</div>

				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
							<thead>
								<tr>
									<th>문서번호</th>
									<th>사업자번호</th>
									<th>제목</th>
									<th>작성일자</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="enter" items="${lists}">
									<tr onclick="detailDocument('${enter.eno}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
										<td>
											<h6 class="mb-1">${enter.eno}</h6> 
											<span class="text-secondary fs-7">작성자: ${enter.writer}</span>
										</td>
										<td>
											<h6 class="mb-1">${enter.businesscode}</h6>
										</td>
										<td>
											<h6 class="mb-1">${enter.title}</h6>
										</td>
										<td>
											<fmt:parseDate value="${enter.writeday}" var="writeday" pattern="yyyy-MM-dd HH:mm" /> <!-- parseDate: String -> Date타입으로 변경 -->
											<h6 class="mb-1">
												<fmt:formatDate value="${writeday}" pattern="yyyy-MM-dd HH:mm" />
											</h6>
										</td>
										<td id="enterStatus" align="left">
											<c:if test="${enter.dstatus eq -1}">
												<span class="badge rounded-pill bg-danger">반려</span>
											</c:if> 
											<c:if test="${(enter.dstatus eq 0) && (enter.request eq 1)}">
												<span class="badge rounded-pill bg-info">대기</span>
											</c:if> 
											<c:if test="${enter.dstatus eq 1}">
												<span class="badge rounded-pill bg-success">승인</span>
											</c:if> 
											<c:if test="${(enter.request eq 0) && (enter.dstatus eq 0)}">
												<span class="badge rounded-pill bg-warning">임시저장</span>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

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
	<!-- 페이지 번호 -->
	<div class="text-center">
	</div>
</div>

<%@ include file="../admin/a_bottom.jsp" %>