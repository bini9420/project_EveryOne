<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="cs_top.jsp"%>

<div class="mx-auto h-75 my-5" style="width:90%">
	<div class="row">
		<div class="col-sm-3">
			<div class="card bg-light">
				<div class="card-body">
					<nav class="nav flex-column">
						<div class="search-form">
							<form action="list.nt" method="get">
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
						<a class="nav-link text-primary" aria-current="page" href="main.mall"> 배민 B마트로 돌아가기 </a>
						<c:if test="${loginInfo.id == 'admin'}">
							<a class="nav-link text-primary" aria-current="page" href="adminMain.ad"> 관리자페이지로 돌아가기 </a>
						</c:if>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<form:form action="insert.nt" method="post" class="form-container">
				<table class="p-4">
					<tr>
						<td class="radio-group">
							상단고정 
							<input type="radio" name="noti" value="y" required>Y 
							<input type="radio" name="noti" value="n">N
						</td>
					</tr>
					<tr>
						<td>
							카테고리 
							<select name="category">
								<option value="공지사항">공지사항</option>
								<option value="FAQ">FAQ</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							제목 
							<input type="text" name="subject" value="${notice.subject}" required> 
							<form:errors path="subject" class="err" />
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="content" rows="5" cols="50" required>${notice.content}</textarea>
							<form:errors path="content" class="err" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="id" value="${loginInfo.id}">
							<input type="submit" value="추가"  class='plus_btn'>
							<button  class='plus_btn'
								onClick="location.href='list.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">글목록</button>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="cs_bottom.jsp"%>
