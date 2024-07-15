<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="member_top.jsp" %>

<body class="bg-primary">
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
							<div class="col-lg-6 mx-auto py-5">
								<div class="p-5">
									<div class="text-center">
										<h3 class="text-muted mb-4">로그인</h3>
									</div>
									<form class="user" method="post" action="login.mb">
										<div class="form-group">
											<input type="text" class="form-control form-control-user" name="id" placeholder="아이디(Id)">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" name="password" placeholder="비밀번호(Password)">
										</div>
										<input type="submit" value="로그인" class="btn btn-primary btn-user btn-block">

									</form>
									
									<hr>
									<form class="user text-center">
										<a id="kakao-login-btn" class="p-2" 
										href="https://kauth.kakao.com/oauth/authorize?client_id=f851426109160a96d2785229bdb40d68&redirect_uri=http://localhost:8080/ex/kakaoLogin.mb&response_type=code&prompt=login">
										<img src="resources/img/kakao.png" style="height:45px; width: 230px" alt="kakao login btn"></a>  
									</form>
									<hr>
									
									<div class="text-center text-primary">
										<a class="small" data-bs-toggle="modal" data-bs-target="#findId">아이디 찾기</a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
										<a class="small" data-bs-toggle="modal" data-bs-target="#findPw">비밀번호 찾기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- 아이디 찾기 모달 -->
<div class="modal fade" id="findId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mx-2 my-4">
					<form class="user" action="find.mb">
						<div class="form-group row">
							이름 : <input type="text" name="name" class="form-control col-sm-6 mx-1">
						</div>
						<div class="form-group row">
							전화번호 : 
								<select name="phone1" class="form-control col-sm-3 mx-1">
									<option value="">선택 안 함
									<option value="010">010
									<option value="011">011
								</select> 
								<input type="text" class="form-control col-sm-3 mx-1" name="phone2">
                                <input type="text" class="form-control col-sm-3 mx-1" name="phone3">
						</div>
						
						<div class="text-center">
							<input type="submit" value="아이디찾기" class="btn btn-sm btn-primary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div class="modal fade" id="findPw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mx-2 my-4">
					<form class="user" action="find.mb" method="post">
						<div class="form-group row">
							아이디 : <input type="text" name="id" class="form-control col-sm-6 mx-1">
						</div>
						<div class="form-group row">
							이름 : <input type="text" name="name" class="form-control col-sm-6 mx-1">
						</div>
						
						<div class="text-center">
							<input type="submit" value="비밀번호찾기" class="btn btn-sm btn-primary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="member_bottom.jsp" %>
