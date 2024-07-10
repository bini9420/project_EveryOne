<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">
<%@ include file="../member/owner/o_top.jsp" %>
<style>
	.justify-content-center {
		margin: 40px 0px;
	}
	.table-responsive {
		width: 100%;
	}
	#boxName {
		margin: 25px 0px;
	}
	i, h3 {
		display: inline-block;
		margin-right: 5px;
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

<div class="container-fluid">
	<div id="boxName">
		<i class="fas fa-check fa-2x text-gray-500"></i>
		<h3 class="text-gray-800">결재완료함</h3>
	</div>
	
	<!-- 검색 -->
	<div class="row">
		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-body">
				<form action="document_approve.dc">
				<table align="center">
					<tr>
						<td class="searchTd spaceTd">
							<select class="form-select form-select-sm" name="whatColumn">
								<option value="all">전체검색</option>
								<option value="dcategory">문서종류</option>
								<option value="dnum">문서번호</option>
								<option value="title">제목</option>
							</select>
						</td>
						<td class="searchTd spaceTd" colspan="3">
							<input type="text" class="form-control form-control-sm" name="keyword">
						</td>
						<td align="center">
							<input type="submit" class="btn btn-primary btn-sm" id="searchBtn" value="Search">
						</td>
					</tr>
				</table>
				</form>
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
                    <th>승인유무</th>
                    <th>승인일</th>
                  </tr>
                </thead>
                <tbody>
              		<c:forEach var="approveDocument" items="${lists}">
              			<tr>
              				<td> 
              					<h6 class="mb-1">[${approveDocument.dcategory}]</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${approveDocument.dnum}</h6>
              				</td> 
              				<td>
              					<h6 class="mb-1">${approveDocument.title}</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${approveDocument.writeday}</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">
              						<span class="badge rounded-pill bg-success">승인</span>
              					</h6>
              				</td>
              				<td>
              					<h6 class="mb-1">${approveDocument.approveday}</h6>
              				</td>
              			</tr>
              		</c:forEach>
                </tbody>
              </table>
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