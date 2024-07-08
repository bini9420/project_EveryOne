<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>	
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	#staticBackdropLabel {
		margin: auto;
	}
	.btn-secondary {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		margin: auto;
	}
	.table {
		margin: auto;
	}
	#table2 {
		margin-left: 25px;
	}
	#approvalText {
		font-size: small;
	}
	.selectedTh {
		background-color: #9ad5d4;
	}
</style>    
<!-- document_box.jsp(+dnum) => DocumentDetailController.java(+dnum) => document_detailView.jsp -->

	  <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">[${document.dcategory}] ${document.title}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      	<div class="container">
      	<div class="row">
        <div class="col-md-6">
        <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table1">
        	<tr>
        		<th class="selectedTh">
        			<label for="documentDnum" class="form-label">작성자명</label>
        		</th>
        		<td>
        			<label class="form-label"></label>
        		</td> 
        		<th class="selectedTh">
        			<label for="documentWriteday" class="form-label">작성일자</label>
        		</th>
        		<td>
        			<label class="form-label">${document.writeday}</label>
        		</td> 
        	</tr>
        	
        	<tr>
        		<th class="selectedTh">
        			<label for="documentDnum" class="form-label">결재상태</label>
        		</th>
        		<td>
        			<label class="form-label">
        			<c:if test="${document.dstatus eq -1}">
        				반려
        			</c:if>
        			<c:if test="${document.dstatus eq 0 && document.request eq 1}">
        				대기
        			</c:if>
        			<c:if test="${document.dstatus eq 1}">
        				승인
        			</c:if>
        			</label>
        		</td> 
        		<th class="selectedTh">
        			<label for="documentWriteday" class="form-label">문서번호</label>
        		</th>
        		<td>
        			<label class="form-label">${document.dnum}</label>
        		</td> 
        	</tr>
		</table>
		</div>
		
		<div class="col-md-4">
		<table class="table bsb-table-xl text-nowrap align-middle m-0" id="table2">
			<tr id="approvalText">
				<th class="selectedTh">승인</th>
			</tr>
			<tr>
				<td>
					<c:if test="${document.approval eq 1}">
						<i class="fas fa-user-check fa-2x text-gray-800"></i>
					</c:if>
				</td>
			</tr>
		</table>
		</div>        
		
		<div class="row mt-5">
		<div class="col-md-12">
		 <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table3">
		 	<tr>
		 		<th class="selectedTh">제목</th>
		 		<td>${document.title}</td>
		 	</tr>
		 	<tr>
		 		<td>${document.dcontent}</td>
		 	</tr>
		 </table>	 
        </div>
        </div>
        </div>
        </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <!-- <button type="button" class="btn btn-primary">Understood</button> -->
      </div>