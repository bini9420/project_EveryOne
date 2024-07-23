<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<!-- o_top.jsp => 전체문서함 클릭(document_allBox.dc 요청) => DocumentAllBoxController.java => document_allBox.jsp -->
<%@ include file="../member/owner/o_top.jsp"%>
<style>
	.table-responsive {
		width: 100%;
	}
	#allBoxContainer {
		 margin-left: 15px;
		 margin-right: 15px;
	}
	.col-auto, .mr-2 {
		display: inline-block;
		float: left;
	}
	#boxname {
		margin-left: 20px;
		margin-top: 10px;
	}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">	
	function detailDocument(dnum) {
	    //alert("선택한 문서 번호: " + dnum);
		$('.modal-content').load("document_detail.dc?dnum="+dnum);
		$('#staticBackdrop').modal('show');
	}
</script>

<div class="container-fruid h-100" id="allBoxContainer">
	<div class="row">
		<div class="col-lg-12 col-md-6 mb-4">
             <div class="card border-left-primary shadow h-100 py-2">
                  <div class="card-body">
                       <div class="row no-gutters align-items-center">
                       		<div class="col-auto">
	              			    <i class="fas fa-list fa-2x text-gray-500"></i>
	         			    </div>
                            <div class="col mr-2">
                                <div class="text-lg font-weight-bold text-primary text-uppercase mb-1" id="boxname"><h3><b>전체문서함</b></h3></div>
                            </div>
                  		</div>
             	  </div>
        	</div>
    	</div>	
	</div>
	
	<div class="row">
	
	<!-- 결재대기함 -->
		<div class="col-lg-6 mb-3">
             <div class="card shadow mb-4">
                   <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-info">결재대기함</h6>
                   </div>
                                
                   <div class="card-body">
                        <div class="table-responsive">
				              <table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
				                <thead>
				                  <tr>
				                    <th>문서종류</th>
				                    <th>문서번호</th>
				                    <th>제목</th>
				                    <th>작성일자</th>
				                  </tr>
				                </thead>
				                <tbody>
						                
				                <c:forEach var="waitDocument" items="${wlists}">
				                	<tr onclick="detailDocument('${waitDocument.dnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				                		<td>
				                			[${waitDocument.dcategory}]
				                		</td>
				                		<td>
				                		  <h6 class="mb-1">${waitDocument.dnum}</h6>
				                     	  <span class="text-secondary fs-7">작성자: ${waitDocument.writer}</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${waitDocument.title}</h6>
					                    </td>
					                    <td>
					                      <fmt:parseDate value="${waitDocument.writeday}" var="w_writeday" pattern="yyyy-MM-dd HH:mm"/>
					                      <h6 class="mb-1"><fmt:formatDate value="${w_writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
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
		
		
		<div class="col-lg-6 mb-4">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-success">결재완료함</h6>
				</div>
				<div class="card-body">
                        <div class="table-responsive">
				              <table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
				                <thead>
				                  <tr>
				                    <th>문서종류</th>
				                    <th>문서번호</th>
				                    <th>제목</th>
				                    <th>작성일자</th>
				                  </tr>
				                </thead>
				                <tbody>
						                
				                <c:forEach var="approveDocument" items="${alists}">
				                	<tr onclick="detailDocument('${approveDocument.dnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				                		<td>
				                			[${approveDocument.dcategory}]
				                		</td>
				                		<td>
				                		  <h6 class="mb-1">${approveDocument.dnum}</h6>
				                     	  <span class="text-secondary fs-7">작성자: ${approveDocument.writer}</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${approveDocument.title}</h6>
					                    </td>
					                    <td>
					                      <fmt:parseDate value="${approveDocument.writeday}" var="a_writeday" pattern="yyyy-MM-dd HH:mm"/>
					                      <h6 class="mb-1"><fmt:formatDate value="${a_writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
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
		
		<div class="col-lg-6 mb-4">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">임시저장함</h6>
				</div>
				<div class="card-body">
                        <div class="table-responsive">
				              <table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
				                <thead>
				                  <tr>
				                    <th>문서종류</th>
				                    <th>문서번호</th>
				                    <th>제목</th>
				                    <th>작성일자</th>
				                  </tr>
				                </thead>
				                <tbody>
						                
				                <c:forEach var="tempDocument" items="${tlists}">
				                	<tr onclick="detailDocument('${tempDocument.dnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				                		<td>
				                			[${tempDocument.dcategory}]
				                		</td>
				                		<td>
				                		  <h6 class="mb-1">${tempDocument.dnum}</h6>
				                     	  <span class="text-secondary fs-7">작성자: ${tempDocument.writer}</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${tempDocument.title}</h6>
					                    </td>
					                    <td>
					                      <fmt:parseDate value="${tempDocument.writeday}" var="t_writeday" pattern="yyyy-MM-dd HH:mm"/>
					                      <h6 class="mb-1"><fmt:formatDate value="${t_writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
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
		
		<div class="col-lg-6 mb-4">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-danger">반려함</h6>
				</div>
				<div class="card-body">
                        <div class="table-responsive">
				              <table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
				                <thead>
				                  <tr>
				                    <th>문서종류</th>
				                    <th>문서번호</th>
				                    <th>제목</th>
				                    <th>작성일자</th>
				                  </tr>
				                </thead>
				                <tbody>
						                
				                <c:forEach var="returnDocument" items="${rlists}">
				                	<tr onclick="detailDocument('${returnDocument.dnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				                		<td>
				                			[${returnDocument.dcategory}]
				                		</td>
				                		<td>
				                		  <h6 class="mb-1">${returnDocument.dnum}</h6>
				                     	  <span class="text-secondary fs-7">작성자: ${returnDocument.writer}</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${returnDocument.title}</h6>
					                    </td>
					                    <td>
					                      <fmt:parseDate value="${returnDocument.writeday}" var="r_writeday" pattern="yyyy-MM-dd HH:mm"/>
					                      <h6 class="mb-1"><fmt:formatDate value="${r_writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
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

 <div class="container-fluid">
     <div class="row">
     	<p align="center">${pageInfo.pageNumber}</p>
     </div>
</div>
<%@ include file="../member/owner/o_bottom.jsp"%>