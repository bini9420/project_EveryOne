<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../common/common.jsp" %>
 <style type="text/css">
 	.err{
		font-size : 9pt;
		color : red;
		font-weight: bold;
	}
 </style>
 
<form:form commandName="db" action="dinsert.nt" method="post">
	<table border="1" width="500">
		<tr>
			<td align="right" colspan="2"><a
				href="dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}">글목록</a>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="dsubject" value="${db.dsubject }">
				<form:errors path="dsubject" class="err" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="dcontent" rows="5" cols="50">${db.content }</textarea>
				<form:errors path="dcontent" class="err" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="글쓰기">
				<input type="button" value="다시작성" onClick="location.reload()">
				<input type="button" value="목록보기"
				onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
				<input type="hidden" name="id" value="${loginInfo.id }">
				<input type="hidden" name="password" value="${loginInfo.password }">
			</td>
		</tr>
	</table>
</form:form>