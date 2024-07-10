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
    function tempSave() {
	    // select 요소의 유효성 검사 수행
	    var selectElement = document.getElementById('documentCategory');
	    if (!selectElement.checkValidity()) {
	        // 유효성 검사 실패 시 처리 (예: 경고 메시지 출력)
	        alert('결재문서 종류를 선택해주세요.');
	        return;
	    }
	
	    // select 요소의 유효성 검사가 통과되면 폼을 제출
	    document.myform.action = "document_temp.dc";
	    document.myform.submit();
	}
</script>
<!-- document_writeForm.jsp<br> -->
<%
	String[] category = {"물품등록", "광고요청", "휴업신청"};
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
			    <select class="form-select form-select-sm" aria-label="Default select example" name="dcategory" id="documentCategory" required>
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
			    <input type="text" class="form-control form-control-sm" value="${name}" name="writer" id="documentWriter" disabled>
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
			  	<label for="documentContent" class="form-label">내용 <font color="red">*</font></label>
			  	<textarea required
			  	placeholder="작성예시) &#13;&#10;&#13;&#10;B-마트 물품등록 권한을 요청하오니 검토 후 재가하여 주시기 바랍니다.&#13;&#10;&#13;&#10;1. 점포명: 깨끗한나라&#13;&#10;2. 물품 카테고리: 생필품" 
			  	class="form-control" id="documentContent" style="height: 250px" id="documentContent" name="dcontent" required><c:if test="${document.dcontent ne ''}">${document.dcontent}</c:if></textarea>
			  	<div class="invalid-feedback">
			    	내용 입력은 필수입니다
			    </div>
			  </div>
			  
			  <div class="col-12">
			  	<div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        Accordion Item #1
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        Accordion Item #2
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        Accordion Item #3
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
				      </div>
				    </div>
				  </div>
				</div>
			  </div>
			  
			  
			  
			  <div class="col-12">
				 <input class="form-control form-control-sm" id="formFileSm" type="file" name="upload">
				 <div class="valid-feedback">
			    	파일 첨부는 필수 사항이 아닙니다
			    </div>
			  </div>
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