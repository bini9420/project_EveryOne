<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../common/common.jsp" %>

<style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5;
            color: #333333;
        }
        table {
            width: 500px;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #CCCCCC;
            background-color: white;
        }
        th, td {
            padding: 10px;
            text-align: left;
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
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin: 4px 0;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
        }
        input[type="submit"], input[type="button"] {
            padding: 10px 20px;
            margin: 5px;
            background-color: #48D1CC;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #36b3a9;
        }
        .err {
            font-size: 9pt;
            color: red;
            font-weight: bold;
        }
        a {
            text-decoration: none;
            color: #48D1CC;
        }
        a:hover {
            text-decoration: underline;
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
