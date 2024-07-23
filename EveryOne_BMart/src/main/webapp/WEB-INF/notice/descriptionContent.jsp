<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<style>

	body {
		font-family: Arial, sans-serif;
		background-color: #F5F5F5;
		color: #262626;
	}
	
	table {
		width: 80%;
		height: 370;
		margin: 20px auto;
		border-collapse: collapse;
		text-align: center
	}
	
	th, td {
		border: 1px solid #CCCCCC;
		text-align: center;
		width: 25%
	}
	
	th {
		padding: 10px;
		background: rgba(42, 193, 188, 0.7); 
		color: white;
	}
	
	td {
		background-color: white;
	}

</style>

<%@include file="../common/common.jsp"%>

<c:if test="${id eq 'admin'}">
	<%@ include file="../admin/a_top.jsp"%>
</c:if>
<c:if test="${id ne 'admin'}">
	<%@ include file="../member/owner/o_top.jsp"%>
</c:if>

<!-- Begin Page Content -->
<div class="card shadow mx-auto py-5" style="width :80%; margin-top: 100px; margin-bottom: 120px">
	<div class="text-center my-3">
		<h3 style="font-weight: bold">글 상세보기</h3>
	</div>
	
	<div class="container">
		<table class="table-bordered">
			<tr height="60">
				<th>글번호</th>
				<td colspan="3">${db.dnum }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${db.id }</td>
				<th>작성일</th>
				<td>${db.ddate }</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="4">${db.dsubject }</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="4">${db.dcontent }</td>
			</tr>
			<tr class="text-center">
				<td colspan="4">
					<input type="button" value="글수정" class="btn btn-primary btn-sm" 
						onClick="location.href='dupdate.nt?dnum=${db.dnum }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
						
					<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#descriptionDelete">글삭제</button>
						
					<input type="button" value="답글쓰기" class="btn btn-primary btn-sm" 
						onClick="location.href='dreply.nt?ref=${db.ref }&re_step=${db.re_step }&re_level=${db.re_level }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
						
					<input type="button" value="글목록" class="btn btn-primary btn-sm" 
						onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
				</td>
			</tr>
		</table>
	</div>
</div>

<!-- 삭제 클릭했을 때 비밀번호 입력 모달 -->
<div class="modal fade" id="descriptionDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body text-center py-5">
			  	<form action="ddelete.nt" method="POST">
			  		<input type="hidden" name="dnum" value="${db.dnum }">
					<input type="hidden" name="pageNumber" value="${param.pageNumber}">
					<input type="hidden" name="whatColumn" value="${param.whatColumn}">
					<input type="hidden" name="keyword" value="${param.keyword}">
					
					<p style="font-size: 20; font-weight: bold">
						비밀번호를 입력해 주세요.
						
					<p style="font-size: 17">
						비밀번호 : <input type="password" name="password">
						
					<p>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

<c:if test="${id eq admin}">
	<%@ include file="../admin/a_bottom.jsp"%>
</c:if>
<c:if test="${id ne admin}">
	<%@ include file="../member/owner/o_bottom.jsp"%>
</c:if>