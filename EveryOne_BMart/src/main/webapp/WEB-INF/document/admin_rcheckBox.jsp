<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
	function detailDocument(rnum) {
		$('.modal-content').load("adminDocument_detail.dc?rnum="+rnum);
		$('#staticBackdrop').modal('show');
	}
</script>

<!-- document_box.jsp<br> -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<div class="row">
                    <!-- Page Heading -->
                    <div class="d-flex align-items-center justify-content-start mb-4">
                        <i class="fas fa-folder-open fa-2x text-gray-500 me-2"></i>
                        <h1 class="h3 mb-0 text-gray-800">리뷰검토함</h1>
                    </div>
                    </div>
                </div>

				<!-- 검색 -->
				<div class="container-fluid">					
					<div class="row">
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-body">
								<form action="admin_rcheckBox.dc">
									<table align="center">
										<tr>
											<td class="searchTd spaceTd">
												<select class="form-select form-select-sm" name="whatColumn">
													<option value="all">전체검색
													<option value="rnum">문서번호
													<option value="prdnum">상품번호
													<option value="writer">작성자
												</select>
											</td>
											<td class="searchTd spaceTd" colspan="3">
												<input type="text" class="form-control form-control-sm" name="keyword">
											</td>
											<td align="center">
												<input type="submit" class="btn btn-primary" id="searchBtn" value="Search">
												<!-- <a href="#" class="btn btn-primary btn-sm" id="searchBtn">Search</a> -->
											</td>
										</tr>
									</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<!-- 결재문서 목록-->
				<div class="container-fluid">
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
						                    <th>상품번호</th>
						                    <th>작성자</th>
						                    <th>작성일자</th>
						                    <th>결재상태</th>
						                  </tr>
						                </thead>
						                <tbody>
						                
						                <c:forEach var="rcheck" items="${lists}">
						                	<tr onclick="detailDocument('${rcheck.rnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						                		<td>
						                		  <h6 class="mb-1">${rcheck.rnum}</h6>
						                		</td>
						                		<td>
						                		  <h6 class="mb-1">${rcheck.prdnum}</h6>
						                		</td>
						                		<td>
						                		  <h6 class="mb-1">${rcheck.writer}</h6>
						                		</td>
						                		<td>
						                		  <fmt:parseDate value="${rcheck.writeday}" var="writeday" pattern="yyyy-MM-dd HH:mm"/>
							                      <h6 class="mb-1"><fmt:formatDate value="${writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
							                    </td>
							                    <td id="rcheckStatus" align="left">
							                    	<c:if test="${rcheck.dstatus eq -1}">
							                    		<span class="badge rounded-pill bg-danger">반려</span>
							                    	</c:if>
							                    	<c:if test="${(rcheck.dstatus eq 0) && (rcheck.request eq 1)}">
							                    		<span class="badge rounded-pill bg-info">대기</span>
							                    	</c:if>
							                    	<c:if test="${rcheck.dstatus eq 1}">
							                    		<span class="badge rounded-pill bg-success">승인</span>
							                    	</c:if>
							                    </td>
						                	</tr>
						                </c:forEach>
						                </tbody>
						              </table>
 										
 									  <!-- Modal -->
									  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
            <!-- End of Main Content -->
            
     <div class="container-fluid">
     	<div class="row">
     		<p align="center">${pageInfo.pageNumber}</p>
     	</div>
     </div>
     
<%@ include file="../admin/a_bottom.jsp" %>