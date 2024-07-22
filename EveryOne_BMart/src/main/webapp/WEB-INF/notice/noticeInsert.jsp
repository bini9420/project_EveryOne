<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../mall/cs_top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
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
								<br> <input type="text" name="keyword"
									placeholder="검색어를 입력하세요"> <input type="submit"
									value="검색">
							</form>
						</div>
						<hr>
						<font class="my-2" color="#186E6A">배민 B마트</font> <a
							class="nav-link text-muted" aria-current="page"
							href="list.nt?whatColumn=category&keyword=FAQ"> FAQ </a> <a
							class="nav-link text-muted" aria-current="page"
							href="list.nt?whatColumn=category&keyword=공지사항"> 공지사항 </a>
						<hr>
						<!-- <font class="my-2" color="#186E6A">배민상회</font> <a
							class="nav-link text-muted" aria-current="page" href="#"> F&A
						</a> <a class="nav-link text-muted" aria-current="page" href="#">
							공지사항 </a>
						<hr>  -->
						<a class="nav-link text-primary" aria-current="page"
							href="main.mall"> 배민 B마트로 돌아가기 </a>
						<c:if test="${loginInfo.id == 'admin'}">
							<a class="nav-link text-primary" aria-current="page"
								href="adminMain.ad"> 관리자페이지로 돌아가기 </a>
						</c:if>
						<!-- <a
							class="nav-link text-primary" aria-current="page" href="#">
							배민 상회로 돌아가기 </a> -->
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card bg-light" style="border: 0px">
				<form:form action="insert.nt" method="POST" class="form-container">
					<table>
						<br>
						<tr>
							<td class="radio-group">상단고정 <input type="radio" name="noti"
								value="y" required>Y <input type="radio" name="noti"
								value="n">N
							</td>
						</tr>
						<tr>
							<td>카테고리 <select name="category">
									<option value="공지사항" ${category == '공지사항' ? 'selected' : ''}>공지사항</option>
                                    					<option value="FAQ" ${category == 'FAQ' ? 'selected' : ''}>FAQ</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>제목 <input type="text" name="subject"
								value="${notice.subject}" required> <form:errors
									path="subject" class="err" />
							</td>
						</tr>
						<tr>
							<td><textarea name="content" rows="5" cols="50" required>${notice.content}</textarea>
								<form:errors path="content" class="err" /></td>
						</tr>
						<tr>
							<td><input type="hidden" name="id" value="${loginInfo.id}">
								<input type="submit" value="추가">
								<button class='plus_btn'
									onClick="location.href='list.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">글목록</button>
							</td>
						</tr>
					</table>
				</form:form>
				<br>
			</div>
		</div>
	</div>
</div>

<%@ include file="../mall/cs_bottom.jsp"%>
