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
	#updateFile {
		margin-left: -10px;
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
	    document.myform.action = "document_write.dc";
	    document.myform.dispatchEvent(new Event('submit', { cancelable: true }));
	}
	
	//임시저장 클릭
    function tempSave(dnum) {
	    // select 요소의 유효성 검사 수행
	    var selectElement = document.getElementById('documentCategory');
	    if (!selectElement.checkValidity()) {
	        // 유효성 검사 실패 시 처리 (예: 경고 메시지 출력)
	        alert('결재문서 종류를 선택해주세요.');
	        return;
	    }
	
	    // select 요소의 유효성 검사가 통과되면 폼을 제출
	    document.myform.action = "document_update.dc?dnum=" + dnum;
	    document.myform.submit();
	}

</script>
<!-- document_writeForm.jsp<br> -->
<body onload="load()">
<%
	String[] category = {"상품등록", "광고요청", "폐업신청"};
%>
<div class="modal-header d-flex align-items-center"> 
    <!-- Font Awesome Icon for Pen, remove margin for close alignment -->
    <i class="fas fa-pen fa-2x text-gray-500"></i>
    <!-- Modal Title with no margin to align closely with the icon -->
    <h5 class="modal-title mb-0" id="exampleModalLabel"><b>결재 문서 작성</b></h5>
</div>
 
      <div class="modal-body">
	      <form name="myform" class="row g-3 needs-validation" method="post" enctype="multipart/form-data" novalidate>
				<div class="col-md-6">
					<label for="documentCategory" class="form-label">결재문서 종류 <font color="red">*</font></label>
					<select class="form-select form-select-sm" aria-label="Default select example" name="dcategory" id="documentCategory" onchange="handleCategoryChange(this.value)" required>
						<option value="">선택</option>
						<c:forEach var="category" items="<%=category%>">
							<option value="${category}" <c:if test="${document.dcategory eq category}">selected</c:if>>${category}</option>
						</c:forEach>
					</select>
					<div class="invalid-feedback">
						결재문서 종류는 필수입니다
					</div>
				</div>
			  
			  <div class="col-md-6">
			    <label for="documentApprover" class="form-label">승인·알림 대상 <font color="red">*</font></label>
			    <div class="box" style="background: #BDBDBD;">
			    	<img class="profile" src="<%=request.getContextPath()%>/resources/images/dang.jpg">
			    </div>
			  </div>
			  
			  <div class="col-md-6">
			    <label for="documentWriter" class="form-label">작성자 </label>
			    <input type="text" class="form-control form-control-sm" value="${document.writer}" name="writer" id="documentWriter" disabled>
			  </div>
			  
			  <c:set var="now" value="<%=new Date()%>"/>
			  <div class="col-md-6">
			    <label for="documentWriteday" class="form-label">기안일 </label>
			    <input type="text" class="form-control form-control-sm" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" name="writeday" id="documentWriteday" disabled>
			  </div>
			  
			  <div class="col-md-12">
			    <label for="documentTitle" class="form-label">제목 <font color="red">*</font></label>
			    <input type="text" class="form-control form-control-sm" name="title" id="documentTitle" required>
			    <div class="invalid-feedback">
			    	제목 입력은 필수입니다
			    </div>
			  </div>
			  
			  <div class="col-12">
			  	<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        #상품등록 작성 예시
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body text-gray-700">
				        B-마트 <code>상품 등록 권한</code>을 요청하오니 검토 후 재가하여 주시기 바랍니다.<br><br>
				        - 업종: 전자기기<br><br>
				        감사합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        #광고요청 작성 예시
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body text-gray-700">
				        <code>○○상품 광고</code>를 요청하오니 검토 후 재가하여 주시기 바랍니다.<br><br>
				        - 광고 목적: 현 시점 판매율이 평균보다 저조하여 해당 상품 판매율을 높이고자 함<br><br>
				        감사합니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        #폐업신청 작성 예시
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body text-gray-700">
				        폐업 신청을 요청합니다. 검토 후 승인하여 주시기 바랍니다.<br><br>
				        ※ 문의사항 있으신 경우 연락 부탁드립니다.<br><br>
				        감사합니다.
				      </div>
				    </div>
				  </div>
				</div>
			  </div>
			  
			  <div class="col-12">
			  	<label for="documentContent" class="form-label">내용 <font color="red">*</font></label>
			  	<textarea class="form-control" id="documentContent" style="height: 170px" id="documentContent" name="dcontent" required><c:if test="${document.dcontent ne ''}">${document.dcontent}</c:if></textarea>
			  	<div class="invalid-feedback">
			    	내용 입력은 필수입니다
			    </div>
			  </div>
			  
			 <!-- 상품등록 관련 카테고리 입력란 -->  
			 <c:if test="${document.prdcategory ne 'X'}">
				 <div class="col-md-12" id="insertPrdcategory">
				     <label for="productCategory" class="form-label">상품 카테고리 <font color="red">*</font></label>
				     <input type="text" class="form-control form-control-sm" value="${document.prdcategory}" name="prdcategory">
				     <div class="invalid-feedback">
				         상품등록 신청시 카테고리 입력은 필수입니다
				     </div>
				 </div>
			 </c:if>
			
			 <!-- 광고요청 관련 상품명 입력란 -->
			 <c:if test="${document.prdname ne 'X'}"> 
				 <div class="col-md-12" id="insertPrdname">
				     <label for="productName" class="form-label">상품명 <font color="red">*</font></label>
				     <input type="text" class="form-control form-control-sm" value="${document.prdname}" name="prdname">
				     <div class="invalid-feedback">
				         광고요청 신청시 카테고리 입력은 필수입니다
				     </div>
				 </div>
			 </c:if>
	 	 </form>
      </div>
      
      <div class="modal-footer">
      	<!-- 닫기 버튼 -->
      	<a href="" class="btn btn-primary btn-icon-split" id="closeBtn">
            <span class="text">닫기</span>
        </a>
        
        <!-- 임시저장 버튼 -->
      	<a href="javascript:tempSave()" class="btn btn-warning btn-icon-split" id="tempBtn">
            <span class="text">임시저장</span>
        </a>
        
        <!-- 요청 버튼 -->
	    <a href="javascript:send()" class="btn btn-primary btn-icon-split" id="requestBtn">
            <i class="fas fa-paper-plane"></i>
            <span class="text">요청</span>
        </a>
      </div>
</body>      