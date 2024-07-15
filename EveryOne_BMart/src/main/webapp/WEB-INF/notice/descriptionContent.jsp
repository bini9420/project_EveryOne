<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../common/common.jsp" %>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5;
            color: #333333;
        }
        table {
            width: 600px;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #CCCCCC;
            background-color: white;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #CCCCCC;
        }
        th {
            background-color: #48D1CC;
            color: white;
        }
        h1 {
            text-align: center;
            color: #48D1CC;
        }
        input[type="button"] {
            padding: 10px;
            margin: 5px;
            background-color: #48D1CC;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #36b3a9;
        }
    </style>

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


