<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>	
<%@ include file="../common/common.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="documentStyle.css">
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	#exampleModalLabel, .form-label {
		font-family: "Spoqa Han Sans Neo", sans-serif;
	} 
	.form-label {
		font-size: small;
	}
	#documentContent {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		font-size: small;
		text-align: left;
	}
	#requestBtn {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		font-size: small;
		background-color: #2ac1bc;
		border-color: #2ac1bc;
		padding: 3px;
		width: 18%;
		color: white;
	}
	#closeBtn {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		font-size: small;
		background-color: #d1d3e2!important;
		border-color: #d1d3e2!important;
		padding: 3px;
		width: 18%;
		color: white;
	}
	.err {
		font-family: "Spoqa Han Sans Neo", sans-serif;
		font-size: x-small;
		color: red;
	}
	.box {
	    width: 30px;
	    height: 30px; 
	    border-radius: 70%;
	    overflow: hidden;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	#requestBtn, #closeBtn {
		float: left;
	}
	#documentImg {
    margin-right: 0; /* 이미지 오른쪽 여백 제거 */
    padding-right: 0; /* 이미지 오른쪽 패딩 제거 */
	}
	
	.modal-header h5 {
	    margin-left: 0; /* 제목의 왼쪽 여백 제거 */
	    padding-left: 0; /* 제목의 왼쪽 패딩 제거 */
	}
	.err {
		color: #e74a3b;
		font-size: small;
	}
	#postBtn {
		margin-left: -8px;
	}
	#postBtn:hover {
		font-weight: bold;
		background-color: #27B5B0;
		border-color: #27B5B0;
	}
	#sample6_postcode, #postBtn, #addrLabel {
		margin-bottom: -3px;
	}
	#sample6_address {
		margin-bottom: -12px;
	}
	#sample6_detailAddress {
		margin-bottom: -10px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	//요청 클릭
	function send() {
	    (() => {
	        'use strict'
	
	        // Fetch all the forms we want to apply custom Bootstrap validation styles to
	        const forms = document.querySelectorAll('.needs-validation')
	
	        // Loop over them and prevent submission
	        Array.from(forms).forEach(form => {
	            form.addEventListener('submit', event => {
	                if (!form.checkValidity()) {
	                    event.preventDefault()
	                    event.stopPropagation()
	                } else {
	                    form.submit(); 
	                }
	
	                form.classList.add('was-validated')
	            }, false)
	        })
	    })()
	
	    // 폼의 제출을 트리거
	    document.myform.action = "enter_write.dc";
	    document.myform.dispatchEvent(new Event('submit', { cancelable: true }));
	}
	
	//임시저장 클릭
    function tempSave() {
	    // select 요소의 유효성 검사 수행
	    var selectElement = document.getElementById('documentCategory');
	    if (!selectElement.checkValidity()) {
	        // 유효성 검사 실패 시 처리 (예: 경고 메시지 출력)
	        alert('결재문서 종류를 선택해주세요.');
	        return;
	    }
	
	    // select 요소의 유효성 검사가 통과되면 폼을 제출
	    document.myform.action = "enter_temp.dc";
	    document.myform.submit();
	}
</script>

<!-- enter_writeForm.jsp<br> -->
<div class="modal-header d-flex align-items-center"> 
    <!-- Font Awesome Icon for Pen, remove margin for close alignment -->
    <i class="fas fa-pen fa-2x text-gray-500"></i>
    <!-- Modal Title with no margin to align closely with the icon -->
    <h5 class="modal-title mb-0" id="enterModalLabel"><b>결재 문서 작성</b></h5>
</div>

      <div class="modal-body">
	      <form name="myform" class="row g-3 needs-validation" method="post" enctype="multipart/form-data" novalidate>
			  <!-- 결재문서 종류(입점신청) -->
			  <div class="col-md-6">
			    <label for="enterCategory" class="form-label">결재문서 종류 <font color="red">*</font></label>
			    <input type="text" class="form-control form-control-sm" value="입점신청" disabled="disabled">
				<div class="invalid-feedback">
			    	결재문서 종류는 필수입니다
			    </div>
			  </div>
			   
			  <!-- 승인·알림 대상 -->
			  <div class="col-md-6">
			    <label for="enterApprover" class="form-label">승인·알림 대상 <font color="red">*</font></label>
			    <div class="box" style="background: #BDBDBD;">
			    	<img class="profile" src="<%=request.getContextPath()%>/resources/images/dang.jpg">
			    </div>
			  </div>
			  
			  <!-- 작성자 -->
			  <div class="col-md-6">
			    <label for="enterWriter" class="form-label">작성자 </label>
			    <input type="text" class="form-control form-control-sm" value="${param.id}" name="writer" id="documentWriter" disabled>
			  </div>
			  
			  <!-- 작성일 -->
			  <c:set var="now" value="<%=new Date()%>"/>
			  <div class="col-md-6">
			    <label for="enterWriteday" class="form-label">작성일 </label>
			    <input type="text" class="form-control form-control-sm" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" name="writeday" id="documentWriteday" disabled>
			  </div>
			  
			  <!-- 제목 입력 -->
			  <div class="col-md-12">
			    <label for="enterTitle" class="form-label">제목 <font color="red">*</font></label>
			    <input type="text" class="form-control form-control-sm" name="title" id="documentTitle" required>
			    <div class="invalid-feedback">
			    	제목 입력은 필수입니다
			    </div>
			  </div>
			  
			   <!-- 사업자번호 입력 -->
			  <div class="col-md-12">
			    <label for="enterBusinesscode" class="form-label">사업자번호 <font color="red">*</font></label>
			    <input type="text" class="form-control form-control-sm" name="businesscode" id="enterBusinesscode" required>
			    <div class="invalid-feedback">
			    	사업자번호 입력은 필수입니다
			    </div>
			  </div>
			  
			  <!-- 주소지 입력 -->
			  <div class="col-12">
			  	<label for="documentTitle" class="form-label" id="addrLabel">주소지 <font color="red">*</font></label>
			  </div>
			  <div class="col-9">
				<input type="text" class="form-control form-control-sm" name="postnum" id="sample6_postcode" placeholder="우편번호" required>
					<div class="invalid-feedback">
						주소지 입력은 필수입니다
					</div>
			  </div>
			  <div class="col-3">
			    	<button class="btn btn-primary btn-sm" type="button" onclick="sample6_execDaumPostcode()" id="postBtn">우편번호 찾기</button>
			  </div>
			  <div class="col-12">
			  		<input type="text" class="form-control form-control-sm" name="addr1" id="sample6_address" placeholder="주소" required><br>
			  		<input type="text" class="form-control form-control-sm" name="addr2" id="sample6_detailAddress" placeholder="상세주소" required><br>
			  </div>
			  
			  <!-- 파일 첨부 -->
			  <div class="col-12">
				 <input class="form-control form-control-sm" id="formFileSm" type="file" name="upload" required>
				 <div class="invalid-feedback">
			    	사업자등록증 및 통장사본을 첨부 해주세요
			    </div>
			  </div>
	 	 </form>
      </div>
      
      <div class="modal-footer">
      	<!-- 닫기 버튼 -->
      	<a href="" class="btn btn-primary btn-icon-split" id="closeBtn">
            <span class="text">닫기</span>
        </a>
        
        <!-- 요청 버튼 -->
	    <a href="javascript:send()" class="btn btn-primary btn-icon-split" id="requestBtn">
            <i class="fas fa-paper-plane"></i>
            <span class="text">요청</span>
        </a>
        
      </div>