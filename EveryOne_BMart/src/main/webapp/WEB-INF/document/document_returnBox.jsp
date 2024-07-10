<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">

<style>
	.justify-content-center {
		margin: 40px 0px;
	}
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
	.dateSize {
		width: 50%;
		display: inline-block;
	}
	#searchBtn {
		margin-left: 20px;
	}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	function detailDocument(dnum) {
	    //alert("선택한 문서 번호: " + dnum);
 		$('.modal-content').load("document_detail.dc?dnum="+dnum);
		$('#staticBackdrop').modal();
	}
</script>

<%@ include file="../member/owner/o_top.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-md-6 mb-4">
             <div class="card border-left-danger shadow h-100 py-2">
                  <div class="card-body">
                       <div class="row no-gutters align-items-center">
                       		<div class="col-auto">
	              			    <i class="fas fa-ban fa-2x text-gray-500"></i>
	         			    </div>
                            <div class="col mr-2">
                                <div class="text-lg font-weight-bold text-danger text-uppercase mb-1" id="boxname"><h3><b>반려함</b></h3></div>
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
				<table align="center">
					<tr onclick="detailDocument('${tempDocument.dnum}')" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						<td class="searchTd spaceTd">
							<select class="form-select form-select-sm" name="whatColumn">
								<option value="all">전체검색
								<option value="dcategory">문서종류
								<option value="dnum">문서번호
								<option value="title">제목
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
				</div>
			</div>
		</div>
	</div>
	
</div>

   
<!-- 결재대기 문서 -->
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
                    <th>반려사유</th>
                    <th>반려일</th>
                  </tr>
                </thead>
                <tbody>
              		<c:forEach var="returnDocument" items="${lists}">
              			<tr>
              				<td> 
              					<h6 class="mb-1">[${returnDocument.dcategory}]</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${returnDocument.dnum}</h6>
              				</td> 
              				<td>
              					<h6 class="mb-1">${returnDocument.title}</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${returnDocument.writeday}</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${returnDocument.reason}</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${returnDocument.approveday}</h6>
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
<%@ include file="../member/owner/o_bottom.jsp" %>