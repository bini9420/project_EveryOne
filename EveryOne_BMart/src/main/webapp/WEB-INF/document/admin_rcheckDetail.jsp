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
		margin-left: 30px;
	}
	.btn-secondary {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		margin: auto;
	}
	.table {
		margin: auto;
	}
	#table2 {
		text-align: center;
	}
	#table3 td {
        width: 100%; 
    }
    #table4 {
    	border-radius: 40px;
    }
	.selectedTh {
		background-color: #9ad5d4;
	}
	#writeBtn {
		margin: auto;
	}
	#minusTd {
		margin-right: -40px !important;
	}
</style>    

<!-- 모달 본문 -->
<div class="modal-header">
    <h1 class="modal-title fs-5" id="staticBackdropLabel" align="left"><b>[리뷰검토] ${review.rnum} </b></h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
    <div class="container">
        <!-- 문서 정보, 승인 테이블 -->
        <div class="row">
            <div class="col-md-6">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table1">
                    <tr>
                        <th class="selectedTh">
                            <label for="documentRnum" class="form-label">작성자명</label>
                        </th>
                        <td>
                            <label class="form-label">${review.writer}</label>
                        </td> 
                        <th class="selectedTh">
                            <label for="documentWriteday" class="form-label">작성일자</label>
                        </th>
                        <td>
                        	<fmt:parseDate value="${review.writeday}" var="writeday" pattern="yyyy-MM-dd HH:mm"/>
                            <label class="form-label"><fmt:formatDate value="${writeday}" pattern="yyyy-MM-dd HH:mm"/></label>
                        </td> 
                    </tr>
                    
                    <tr>
                        <th class="selectedTh">
                            <label for="documentRnum" class="form-label">결재상태</label>
                        </th>
                        <td>
                            <c:if test="${review.dstatus eq -1}">
                                <label class="form-label text-md font-weight-bold text-danger">반려</label>
                            </c:if>
                            <c:if test="${review.dstatus eq 0 && review.request eq 1}">
                                <label class="form-label text-md font-weight-bold text-info">대기</label>
                            </c:if>
                            <c:if test="${review.dstatus eq 1}">
                                <label class="form-label text-md font-weight-bold text-success">승인</label>
                            </c:if>
                            <c:if test="${review.request eq 0}">
                                <label class="form-label text-md font-weight-bold text-warning">임시저장</label>
                            </c:if>
                        </td> 
                        <th class="selectedTh">
                            <label for="documentWriteday" class="form-label">문서번호</label>
                        </th>
                        <td>
                            <label class="form-label">${review.rnum}</label>
                        </td> 
                    </tr>
                </table>
            </div>
            
            <div class="col-md-3"></div>
            
            <div class="col-md-3">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table2">
                    <tr id="approvalText">
                        <th>승인</th>
                    </tr>
                    <c:if test="${review.dstatus eq 1}">
                        <tr>
                            <td>
                                <i class="fas fa-user-check fa-2x text-gray-800"></i>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${review.dstatus eq -1}">
                    	 <tr>
                            <td>
                                <i class="fas fa-ban fa-2x text-gray-800"></i>
                            </td>
                        </tr>
                    </c:if>
                </table>
            </div>     
        </div>   
            
        <!-- 상품리뷰정보 테이블 -->
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table3">
                    <tr>
                        <th>상품명</th>
                        <td id="title" colspan="3">${review.prdnum}</td>
                    </tr>
                    <tr>
                    	<th>리뷰작성자</th>
                    	<td id="minusTd">${review.re_writer}</td>
                    	<fmt:parseDate value="${review.re_writeday}" var="re_writeday" pattern="yyyy-MM-dd"/>
                    	<th>리뷰작성일</th>
                    	<td><fmt:formatDate value="${re_writeday}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </table>	 
            </div>
        </div>
        
        <!-- 내용 테이블 -->
        <div class="row mt-2">
            <div class="col-md-12">
                <table class="table bsb-table-xl text-nowrap align-middle m-0" id="table4" border=1>
                    <tr>
                        <td><pre><c:out value="${review.content}"/></pre></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <c:if test="${review.approval eq 1}">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
    </c:if>
    
    <c:if test="${review.approval eq 0 }">
        <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">닫기</button>
        <button type="button" id="approveBtn" onclick="approve('${review.rnum}')" class="btn btn-primary me-2">승인</button>
        <button type="button" id="returnBtn" onclick="returnReason('${review.rnum}')" class="btn btn-danger">반려</button>
    </c:if>
</div>

<script>
	function approve(rnum) {
		var result = confirm('선택하신 문서에 대한 결재를 하시겠습니까?');
		if(result) {
			location.href='admin_approval.dc?rnum=' + rnum;
		}
	}
	
	function returnReason(rnum) {
		var result = prompt('반려사유를 입력하세요');
		if(result != null) {
			location.href='admin_return.dc?rnum=' + rnum + '&reason=' + result;
		}		
	}
</script>                