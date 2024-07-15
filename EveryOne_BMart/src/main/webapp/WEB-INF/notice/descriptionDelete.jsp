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
<h2></h2>
<form action="ddelete.nt" method="POST">
	<table border="1" align="center">
		<tr>
			<td>비밀번호를 입력해 주세요.</td>
		</tr>
		<tr>
			<td>
				비밀번호 : <input type="password" name="password">
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="dnum" value="${param.dnum }">
			    <input type="hidden" name="pageNumber" value="${param.pageNumber}">
			    <input type="hidden" name="whatColumn" value="${param.whatColumn}">
			    <input type="hidden" name="keyword" value="${param.keyword}">
				<input type="submit" value="글삭제">
				<input type="button" value="글목록" onClick="location.href='dlist.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
			</td>
		</tr>
	</table>
</form>    