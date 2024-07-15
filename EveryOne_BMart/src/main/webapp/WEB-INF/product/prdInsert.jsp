<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
    <h1>상품 추가</h1>
    <form action="insert.prd" method="post" enctype="multipart/form-data">
        
        <label for="pname">상품 이름:</label>
        <input type="text" id="pname" name="pname" value="${product.pname}" required>
        <br>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" value="${product.price}" required>
        <br>

        <label for="stock">재고:</label>
        <input type="number" id="stock" name="stock" value="${product.stock}" required>
        <br>

        <label for="capacity">용량:</label>
        <input type="text" id="capacity" name="capacity" value="${product.capacity}" required>
        <br>

        <label for="pcontent">설명:</label>
        <textarea id="pcontent" name="pcontent" required>${product.pcontent}</textarea>
        <br>

        <label for="expritydate">유통기한:</label>
        <input type="text" id="expritydate" name="expritydate" value="${product.expritydate}" required>
        <br>

        <label for="origin">원산지:</label>
        <input type="text" id="origin" name="origin" value="${product.origin}" required>
        <br>

        <label for="pcategory">카테고리:</label>
        <input type="text" id="pcategory" name="pcategory" value="${product.pcategory}" required>
        <br>

        <label for="upload">이미지:</label>
        <input type="file" id="upload" name="upload">
        <br>
        <br>
		<input type="hidden" name="id" value="${loginInfo.id }">
        <button type="submit">추가</button>
        <input type="button" value="돌아가기" onClick="location.href='list.prd?pageNumber=${param.pageNumber}'">
    </form>
</body>
</html>
