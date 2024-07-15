<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../common/common.jsp" %>

<style type="text/css">
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>

<form:form commandName="db" action="dupdate.nt" method="post">
	<input type="hidden" name="dnum" value="${db.dnum }">
	<input type="hidden" name="pageNumber" value="${param.pageNumber }">
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
			<td><textarea name="dcontent" rows="5" cols="50">${db.dcontent }</textarea>
				<form:errors path="dcontent" class="err" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="password">
			<form:errors path="password" class="err" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="hidden" name="dnum"
				value="${param.dnum }"> <input type="hidden"
				name="pageNumber" value="${param.pageNumber}"> <input
				type="hidden" name="whatColumn" value="${param.whatColumn}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<input type="submit" value="글수정"> <input type="button"
				value="다시작성" onClick="location.reload()"> <input
				type="button" value="목록보기"
				onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
			</td>
		</tr>
	</table>
</form:form>
