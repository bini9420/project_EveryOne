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
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
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

									<hr>
									
										<button type="submit" class="btn btn-warning btn-user btn-block" id="kakao-login-btn">
											<i class="fab fa-google fa-fw"></i> 카카오로 로그인하기
										</button>
										
										<button type="submit" class="btn btn-google btn-user btn-block"> 
											<i class="fab fa-google fa-fw"></i> 구글로 로그인하기
										</button>
									</form>
									
									<hr>
									
									<div class="text-center">
										<a class="small" href="findId.mb">아이디 찾기</a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
										<a class="small" href="findPw.mb">비밀번호 찾기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="member_bottom.jsp" %>
