<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<%@ include file="../member/owner/o_top.jsp"%>
<!-- document_allBox.jsp -->

<style>
	#allBoxContainer {
		 margin-left: 15px;
		 margin-right: 15px;
	}
	#boxName {
		margin: 25px 0px;
	}
	i, h3 {
		display: inline-block;
		margin-right: 10px;
		vertical-align: middle;
	}
	#allDocument {
		padding-top: 10px;
	}
</style>
<br>
<div class="container-fruid" id="allBoxContainer">
	<div class="row">
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-body">
					<i class="fas fa-list fa-2x text-gray-500"></i>
					<h3 class="text-gray-800" id="allDocument">전체문서함</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
	
	<!-- 결재대기함 -->
		<div class="col-lg-6 mb-4">
             <div class="card shadow mb-4">
                   <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">결재대기함</h6>
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
				                     	  <span class="text-secondary fs-7">Web, UI Design</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${waitDocument.title}</h6>
					                    </td>
					                    <td>
					                      <h6 class="mb-1">${waitDocument.writeday}</h6>
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
					<h6 class="m-0 font-weight-bold text-primary">결재완료함</h6>
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
				                     	  <span class="text-secondary fs-7">Web, UI Design</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${approveDocument.title}</h6>
					                    </td>
					                    <td>
					                      <h6 class="mb-1">${approveDocument.writeday}</h6>
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
					<h6 class="m-0 font-weight-bold text-primary">임시저장함</h6>
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
				                     	  <span class="text-secondary fs-7">Web, UI Design</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${tempDocument.title}</h6>
					                    </td>
					                    <td>
					                      <h6 class="mb-1">${tempDocument.writeday}</h6>
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
					<h6 class="m-0 font-weight-bold text-primary">반려함</h6>
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
				                     	  <span class="text-secondary fs-7">Web, UI Design</span>
				                		</td>
				                		<td>
					                      <h6 class="mb-1">${returnDocument.title}</h6>
					                    </td>
					                    <td>
					                      <h6 class="mb-1">${returnDocument.writeday}</h6>
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