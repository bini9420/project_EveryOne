<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="cs_top.jsp"%>
<div class="container my-5 p-4">
	<div class="row">
		<div class="col-sm-4">
			<div class="card bg-light">
				<div class="card-body">
					<nav class="nav flex-column">
						<!-- <form action="" method="post" class="d-flex">
							<input type="text" name="keyword" class="form-control w-75"
								placeholder="search">
							<button type="button" class="btn btn-secondary ms-2">검색</button>
						</form> -->
						<div class="search-form">
							<form action="list.nt" method="get">
								<!-- <select name="whatColumn">
									<option value="all">전체검색</option>
									<option value="subject">제목</option>
									<option value="category">구분</option>
								</select> -->
								<input type="hidden" name="whatColumn" value="subject">
								<br> 
								<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
								<input type="submit" value="검색">
							</form>
						</div>
						<hr>
						<font class="my-2" color="#186E6A">배민 B마트</font> 
						<a class="nav-link text-muted" aria-current="page" href="list.nt?whatColumn=category&keyword=FAQ"> FAQ </a> 
						<a class="nav-link text-muted" aria-current="page" href="list.nt?whatColumn=category&keyword=공지사항"> 공지사항 </a>
						<hr>
						<!-- <font class="my-2" color="#186E6A">배민상회</font> <a class="nav-link text-muted" aria-current="page" href="#"> F&A
						</a> <a class="nav-link text-muted" aria-current="page" href="#"> 공지사항 </a>
						<hr>  -->
						<a class="nav-link text-primary" aria-current="page" href="main.mall"> 배민 B마트로 돌아가기 </a>
						<c:if test="${loginInfo.id == 'admin'}">
							<a class="nav-link text-primary" aria-current="page" href="adminMain.ad"> 관리자페이지로 돌아가기 </a>
						</c:if>
						<!-- <a class="nav-link text-primary" aria-current="page" href="#"> 배민 상회로 돌아가기 </a> -->
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card bg-light" style="border: 0px">
				<h1>Update Notice</h1>
				<form action="update.nt" method="post" class="form-container">
					<input type="hidden" name="nnum" value="${notice.nnum}"> 
					<input type="hidden" name="pageNumber" value="${pageNumber}"> 
					<label for="noti">중요게시물 등록</label> 
					<input type="radio" name="noti" value="y" ${notice.noti == 'y' ? 'checked' : ''}>Y 
					<input type="radio" name="noti" value="n" ${notice.noti == 'n' ? 'checked' : ''}>N<br> 
					<label for="category">카테고리:</label> 
					<select id="category" name="category" required>
						<option value="공지사항" ${notice.category == '공지사항' ? 'selected' : ''}>공지사항</option>
						<option value="FAQ" ${notice.category == 'FAQ' ? 'selected' : ''}>FAQ</option>
					</select> 
					<br> 
					<label for="subject">제목:</label> 
					<input type="text" id="subject" name="subject" value="${notice.subject}" required> 
					<br> 
					<label for="content">내용:</label>
					<textarea id="content" name="content" rows="10" cols="50" required>${notice.content}</textarea>
					<br>
					<br>
					<button type="submit" class="plus_btn">수정</button>
					<button type="button" class="plus_btn" onClick="location.href='list.nt?pageNumber=${param.pageNumber}'">돌아가기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="cs_bottom.jsp"%>
