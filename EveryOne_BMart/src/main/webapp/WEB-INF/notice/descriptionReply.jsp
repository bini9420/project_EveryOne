<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #F5F5F5;
		color: #333333;
	}
	
	select, input[type="text"], textarea {
		padding: 5px;
		border: 1px solid #CCCCCC;
		border-radius: 5px;
		margin: 5px;
	}
	
	table {
		width: 90%;
		height: 400;
		margin: 20px auto;
		border-collapse: collapse;
		text-align: center
	}
	
	td {
		padding: 5px;
		background-color: white;
		text-align: left;
	}
	
	th {
		width: 120;
		background: rgba(42, 193, 188, 0.7);
		color: white;
	}
</style>

<%@ include file="../admin/a_top.jsp"%>

<div class="card shadow mx-auto my-3" style="width :60%">
	
	<div class="card-header text-center">
		<h3 style="font-weight: bold" class="my-2">답글 작성하기</h3>
	</div>
	
	<div class="w-75 my-4 py-5 mx-auto">

		<form:form commandName="db" action="dreply.nt" method="post">
			<input type="hidden" name="ref" value="${param.ref}"> 
			<input type="hidden" name="re_step" value="${param.re_step}"> 
			<input type="hidden" name="re_level" value="${param.re_level}"> 
			<input type="hidden" name="id" value="${loginInfo.id }"> 
			<input type="hidden" name="password" value="${loginInfo.password }">
			<input type="hidden" name="pageNumber" value="${param.pageNumber}" />
			<input type="hidden" name="whatColumn" value="${param.whatColumn}" />
			<input type="hidden" name="keyword" value="${param.keyword}" />
		
			<table class="table-bordered">
				<tr>
					<th>제목</th>
					<td><input type="text" name="dsubject" value="${db.dsubject }"
						required> <form:errors path="dsubject" class="err" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="dcontent" rows="5" cols="50" required>${db.dcontent }</textarea>
						<form:errors path="dcontent" class="err" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input type="submit" value="답글등록하기" class="btn btn-primary"> 
						
						<input type="button" value="다시작성" class="btn btn-primary" onClick="location.reload()"> 
						
						<input type="button" value="목록보기" class="btn btn-primary" 
							onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
<%@include file="../admin/a_bottom.jsp"%>