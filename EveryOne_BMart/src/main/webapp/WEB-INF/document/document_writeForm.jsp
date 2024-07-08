<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>	
<%@ include file="../common/common.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="documentStyle.css">
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

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
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	function send() {
		//alert('여기');
		
		//▼ 결재문서 종류 선택 누락
		if($('select[name=dcategory]').val() == "") {
			$('select[name=dcategory]').css('border-color', 'pink');
			$('select[name=dcategory]').css('border-width', 'thick');
			return false;
		}
		
		//▼ 제목 입력 누락
		if($('input[name=title]').val() == "") {
			$('input[name=title]').css('border-color', 'pink');
			$('input[name=title]').css('border-width', 'thick');
			return false;
		}
		
		//▼ 내용 입력 누락
		if($('textarea[name=dcontent]').val() == "") {
			alert('내용 누락');
			$('textarea[name=dcontent]').css('border-color', 'pink');
			$('textarea[name=dcontent]').css('border-width', 'thick');
			return false;
		}
			
		
		document.myform.submit(); 
	}
</script>
<!-- document_writeForm.jsp<br> -->
<%
	String[] category = {"물품등록", "광고요청", "휴업신청"};
%>
	  <div class="modal-header">
	  	<img src="<%=request.getContextPath()%>/resources/images/document.png" width="25px" height="25px" id="documentImg">
        <h5 class="modal-title" id="exampleModalLabel"><b>결재 문서 작성</b></h5>
      </div>
      <div class="modal-body">
	      <form name="myform" class="row g-3" action="document_write.dc" method="post" enctype="multipart/form-data">
			  <div class="col-md-6">
			    <label for="documentCategory" class="form-label">결재문서 종류 <font color="red">*</font></label>
			    <select class="form-select form-select-sm" aria-label="Default select example" name="dcategory" id="documentCategory" required>
				  <option value="">선택</option>
				    <c:forEach var="category" items="<%=category%>">
	            		<option value="${category}">${category}</option>
	            	</c:forEach>
				</select><br>
				<form:errors path="dcategory" cssClass="err"/>
			  </div>
			  
			  <div class="col-md-6">
			    <label for="documentApprover" class="form-label">승인·알림 대상 <font color="red">*</font></label>
			    <div class="box" style="background: #BDBDBD;">
			    	<img class="profile" src="">
			    </div>
			  </div>
			  
			  <div class="col-md-6">
			    <label for="documentWriter" class="form-label">작성자 </label>
			    <input type="text" class="form-control form-control-sm" value="" name="writer" id="documentWriter" disabled>
			  </div>
			  
			  <c:set var="now" value="<%=new Date()%>"/>
			  <div class="col-md-6">
			    <label for="documentWriteday" class="form-label">기안일 </label>
			    <input type="text" class="form-control form-control-sm" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" name="writeday" id="documentWriteday" disabled>
			  </div>
			  
			  <div class="col-md-12">
			    <label for="documentTitle" class="form-label">제목 <font color="red">*</font></label>
			    <input type="text" class="form-control form-control-sm" name="title" id="documentTitle" required>
			    <form:errors path="title" cssClass="err"/>
			  </div>
			  
			  <div class="col-12">
			  	<label for="documentContent" class="form-label">내용 <font color="red">*</font></label>
			  	<textarea 
			  	placeholder="작성예시) &#13;&#10;&#13;&#10;B-마트 물품등록 권한을 요청하오니 검토 후 재가하여 주시기 바랍니다.&#13;&#10;&#13;&#10;1. 점포명: 깨끗한나라&#13;&#10;2. 물품 카테고리: 생필품" 
			  	class="form-control" id="documentContent" style="height: 250px" id="documentContent" name="dcontent" required></textarea>
			  	<form:errors path="dcontent" cssClass="err"/>
			  </div>
			  
			  <div class="col-12">
				  <input class="form-control form-control-sm" id="formFileSm" type="file" name="upload">
			  </div>
	 	 </form>
      </div>
      
      <div class="modal-footer">
      	<!-- 닫기 버튼 -->
      	<a href="" class="btn btn-primary btn-icon-split" id="closeBtn">
            <span class="text">닫기</span>
        </a>
        <!-- 임시저장 버튼 -->
        <a href="" onclick="return send()" class="btn btn-primary btn-icon-split" id="requestBtn">
            <i class="fas fa-paper-plane"></i>
            <span class="text">요청</span>
        </a>
        
        
        <!-- 요청 버튼 -->
        <!-- <button class="btn btn-primary" id="sendBtn" type="submit">요청</button> -->
      </div>