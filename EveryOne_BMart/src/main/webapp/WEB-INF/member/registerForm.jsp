<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="member_top.jsp" %>
<%@ include file="../common/common.jsp" %>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function(){
		//alert(1);
		var isCheck = false;
		var use = "";
		$('#id_check').click(function(){ //중복체크 버튼을 클릭했을 때
			//alert(2);
			isCheck = true;
			if($('input[name=id]').val() == ""){ //제목을 입력하지 않았다면
				alert('아이디를 입력하세요.');
				use = "empty";
			}else{ //제목을 입력했다면
				$.ajax({
					url: "idCheck.mb",
					data: ({
						id : $('input[name=id]').val()
					}),
					success: function(data){
						//alert(data);
						if(data == "no"){
							alert('중복된 아이디입니다.');
							use = "impossible";
						}else{
							alert('사용 가능한 아이디입니다.');
							use = "possible";
						}
					}
				});//ajax
			}//if-else
		});//click
		
		$('input[name=id]').keydown(function(){
			isCheck = false;
			use = "";
		});//keydown
		
		$('input[type=submit]').click(function(){
			if(isCheck == false){
				alert("중복체크를 하고 오세요.");
				return false;
			}
			
			if(use=="empty"){
				alert("아이디가 누락되었습니다.");
				return false;
			}else if(use=="impossible"){
				alert("중복된 아이디입니다.");
				return false;
			}
		});//submit-click
	});
</script>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5 ">
                <!-- Nested Row within Card Body -->
                    <div class="col-lg-8 mx-auto p-5">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h3 text-muted mb-5" style="font-weight: bold">
                                	<i class="fi fi-rs-user"></i>
                                	회원가입
                                </h1>
                            </div>
                            <form:form commandName="member" class="user" action="register.mb" method="post">
                            	<div class="form-group row">
                            		아이디 : 
                                    <input type="text" class="form-control col-sm-6 mx-3" name="id" value="${member.id}">
                                    <!--  -->
                                    <input type="button" class="btn btn-light" value="중복확인" id="id_check">
                                </div>
                                <!-- 에러 체크 -->
                                <div class="form-group text-danger">
                                	<form:errors path="id"/>
                                </div>
                                
                                
                                <div class="form-group row">
                                	비밀번호 : 
                                    <input type="text" class="form-control col-sm-6 mx-3" name="password" value="${member.password}">
                                </div>
                                <!-- 에러 체크 -->
                                <div class="form-group text-danger">
                                	<form:errors path="password"/>
                                </div>
                                
                                
                                <div class="form-group row">
                                	이름 : 
                                    <input type="text" class="form-control col-sm-6 mx-3" name="name" value="${member.name}">
                                </div>
                                <!-- 에러 체크 -->
                                <div class="form-group text-danger">
                                	<form:errors path="name"/>
                                </div>
                                
                                
                                <div class="form-group row">
                                	전화번호 : 
                                	<% String[] phone = {"010","011"}; %>
                                    <select name="phone1" class="form-control col-sm-3 mx-1">
                                    	<option value="">선택 안 함
                                    	<c:forEach var="p" items="<%=phone%>">
											<option value="${p}" <c:if test="${p eq member.phone1}">selected</c:if>>${p}
										</c:forEach>
                                    </select>
                                    <input type="text" class="form-control col-sm-3 mx-1" name="phone2" value="${member.phone2}">
                                    <input type="text" class="form-control col-sm-3 mx-1" name="phone3" value="${member.phone3}">
                                </div>
                                <!-- 에러 체크 -->
                                <div class="form-group text-danger">
                                	<form:errors path="phone1"/>
                                </div>
                                <div class="form-group text-danger">
                                	<form:errors path="phone2"/>
                                </div>
                                <div class="form-group text-danger">
                                	<form:errors path="phone3"/>
                                </div>
                                
                                
                                <div class="form-group row">
                                	이메일 : 
                                    <input type="email" class="form-control col-sm-3 mx-3" name="email1" value="${member.email1}"> @ 
                                    <% String[] email = {"naver.com","gmail.com","daum.net","hanmail.net"}; %>
									<select name="email2" class="form-control col-sm-4 mx-3">
										<option value="">선택 안 함
										<c:forEach var="e" items="<%=email%>">
											<option value="${e}" <c:if test="${e eq member.email2}">selected</c:if>>${e}
										</c:forEach>
									</select>
                                </div>
                                <!-- 에러 체크 -->
                                <div class="form-group text-danger">
                                	<form:errors path="email1"/>
                                </div>
                                <div class="form-group text-danger">
                                	<form:errors path="email2"/>
                                </div>
                                
                                
                                <input type="submit" value="회원가입" class="btn btn-outline-primary btn-user btn-block">
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    
<%@ include file="member_bottom.jsp" %>
