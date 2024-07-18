<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<style>
	.table-responsive {
		width: 100%;
	}
	.col-auto, .mr-2 {
		display: inline-block;
		float: left;
	}
	#boxname {
		margin-left: 20px;
		margin-top: 10px;
	}
	.searchTd {
		padding: 5px;
	}
	.spaceTd {
		margin-right: 20px;
	}
	#searchBtn {
		margin-left: 20px;
	}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	function detailDocument(rnum) {
	    //alert("선택한 문서 번호: " + dnum);
 		$('#staticBackdrop .modal-content').load("rcheckDetail.dc?rnum="+rnum);
		$('#staticBackdrop').modal();
	}
</script>

<%@ include file="../member/owner/o_top.jsp" %>
<!-- 결재대기함-->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-md-6 mb-4">
             <div class="card border-left-info shadow h-100 py-2">
                  <div class="card-body">
                       <div class="row no-gutters align-items-center">
                       		<div class="col-auto">
	              			    <i class="fas fa-comments fa-2x text-gray-500"></i>
	         			    </div>
                            <div class="col mr-2">
                                <div class="text-lg font-weight-bold text-info text-uppercase mb-1" id="boxname"><h3><b>리뷰검토함</b></h3></div>
                            </div>
                  		</div>
             	  </div>
        	</div>
    	</div>	
	</div>
	
	<!-- 검색 -->
	<div class="row">
		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-body">
				<form action="rcheckList.dc">
				<table align="center">
					<tr>
						<td class="searchTd spaceTd">
							<select class="form-select form-select-sm" name="whatColumn">
								<option value="all">전체검색
								<option value="rnum">문서번호
								<option value="title">제목
								<option value="prdnum">상품번호
							</select>
						</td>
						<td class="searchTd spaceTd" colspan="3">
							<input type="text" class="form-control form-control-sm" name="keyword">
						</td>
						<td align="center">
							<a href="#" class="btn btn-primary btn-sm" id="searchBtn">Search</a>
						</td>
					</tr>
				</table>
				</form>
				</div>
			</div>
		</div>
	</div>
	
</div>

   
<!-- 리뷰검토 문서 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
        <div class="card shadow mb-4">
        
		<div class="card-body">
            <div class="table-responsive">
              <table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
                <thead>
                  <tr>
                    <th>문서종류</th>
                    <th>문서번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>상품명</th>
                    <th>결재상태</th>
                  </tr>
                </thead>
                <tbody>
              		<c:forEach var="rcheckDocument" items="${lists}">
              			<tr onclick="detailDocument('${rcheckDocument.rnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
              				<td> 
              					<h6 class="mb-1">[리뷰검토]</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${rcheckDocument.rnum}</h6>
              				</td> 
              				<td>
              					<h6 class="mb-1">${rcheckDocument.title}</h6>
              				</td>
              				<td>
              					<fmt:parseDate value="${rcheckDocument.writeday}" var="writeday" pattern="yyyy-MM-dd HH:mm"/>
              					<h6 class="mb-1"><fmt:formatDate value="${writeday}" pattern="yyyy-MM-dd HH:mm"/></h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${rcheckDocument.prdnum}</h6>
              				</td>
              				<!-- 
							 -1: 반려 / 0: 대기(결재진행중) / 1: 승인(결재완료) / 10: 임시저장
							-->
							<td id="documentStatus" align="left">
							    <c:if test="${rcheckDocument.dstatus eq -1}">
							          <span class="badge rounded-pill bg-danger">반려</span>
							    </c:if>
							    <c:if test="${(rcheckDocument.dstatus eq 0) && (rcheckDocument.request eq 1)}">
							          <span class="badge rounded-pill bg-info">대기</span>
							    </c:if>
							    <c:if test="${rcheckDocument.dstatus eq 1}">
							          <span class="badge rounded-pill bg-success">승인</span>
							    </c:if>
							    <c:if test="${(rcheckDocument.request eq 0) && (rcheckDocument.dstatus eq 0)}">
							          <span class="badge rounded-pill bg-warning">임시저장</span>
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
     
<div class="pagination-wrapper">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item">&nbsp;<font class='btn btn-primary'>1</font>&nbsp;</li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</div>
<%@ include file="../member/owner/o_bottom.jsp" %>