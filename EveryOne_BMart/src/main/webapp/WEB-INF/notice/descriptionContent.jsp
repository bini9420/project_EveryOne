<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../common/common.jsp" %>

<table border="1" width="600">
	<tr align="center" height="30">
		<td width="150">글번호</td>
		<td width="150">${db.dnum }</td>
	</tr>
	<tr>
		<td width="150">작성자</td>
		<td width="150">${db.id }</td>
		<td width="150">작성일</td>
		<td width="150">${db.ddate }</td>
	</tr>
	<tr>
		<td width="150">글제목</td>
		<td width="150" colspan="4">${db.dsubject }</td>
	</tr>
	<tr>
		<td width="150">글내용</td>
		<td width="150" colspan="4">${db.dcontent }</td>
	</tr>
	<tr align="center" height="30">
    <td colspan="4">
        <c:if test="${loginInfo.id == db.id}">
            <input type="button" value="글수정"
                onClick="location.href='dupdate.nt?dnum=${db.dnum }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
        </c:if>
        <c:if test="${loginInfo.id == db.id || loginInfo.id == 'admin'}">
            <input type="button" value="글삭제"
                onClick="location.href='ddelete.nt?dnum=${db.dnum }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
        </c:if>
        <input type="button" value="답글쓰기"
            onClick="location.href='dreply.nt?ref=${db.ref }&re_step=${db.re_step }&re_level=${db.re_level }&whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
        <input type="button" value="글목록"
            onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
    </td>
</tr>

</table>


