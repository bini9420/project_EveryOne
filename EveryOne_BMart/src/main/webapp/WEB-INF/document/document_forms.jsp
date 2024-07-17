<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- document_Forms.jsp<br> -->
<%@ include file="../member/owner/o_top.jsp" %>    
<style>
	#topRow {
		padding-top: 60px;
		padding-left: 100px;
		padding-right: 100px;
		padding-bottom: 20px;
	}
	#middleRow {
		padding: 25px;
	}
	h2 {
		display: inline-block;
		margin-left: 3px;
	}
	#top2 {
		background-color: #ECEDF0;
		border-radius: 10px;
		width: 70%;
	}
	#col1, #col2, #col3 {
		position:relative;
		top: 3px;
		right: 5px;
	}
	.smallFont {
		font-size: small;
	}
</style>
<div class="container-fruid">
<div class="row" id="topRow">
	<div class="col-sm-4" id="top1">
		<img src="<%=request.getContextPath()%>/resources/images/document2.png" width="40px" height="40px">
		<h2 class="text-gray-800">결재작성</h2>
	</div>
	<div class="col-sm-8" id="top2">
		<div class="row row-cols-3">
			<div class="col">
				<a href="#" class="btn btn-light btn-icon-split" id="col1">
	            	<span class="text text-gray-800"><b>작성하기</b></span>
	            </a>
			</div>
			<div class="col">
			<a href="#" class="btn btn-light btn-icon-split" id="col2">
            	<span class="text text-gray-800"><b>임시저장함</b></span>
            </a>
			</div>
			<div class="col">
			<a href="#" class="btn btn-light btn-icon-split" id="col3">
            	<span class="text text-gray-800"><b>전체보관함</b></span>
            </a>
            </div>
		</div>
	</div>
</div>


<div class="row" id="middleRow">
  <div class="col-sm">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-gray-800"><b>물품 등록</b></h5>
        <p class="card-text">신청·보고</p>
        <a href="#" class="btn btn-primary smallFont">작성하기</a>
      </div>
    </div>
  </div>
  <div class="col-sm">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-gray-800"><b>리뷰 검토</b></h5>
        <p class="card-text">신청·보고</p>
        <a href="#" class="btn btn-primary smallFont">신청하기</a>
      </div>
    </div>
  </div>
  <div class="col-sm">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-gray-800"><b>게시판</b></h5>
        <p class="card-text">신청·보고</p>
        <a href="#" class="btn btn-primary smallFont">작성하기</a>
      </div>
    </div>
  </div>
  <div class="col-sm">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-gray-800"><b>폐점 신청</b></h5>
        <p class="card-text">신청·보고</p>
        <a href="#" class="btn btn-primary smallFont">작성하기</a>
      </div>
    </div>
  </div>

</div>
</div>


<%@ include file="../member/owner/o_bottom.jsp" %>