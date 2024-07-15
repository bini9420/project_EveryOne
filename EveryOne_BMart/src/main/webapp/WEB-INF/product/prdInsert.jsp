<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
</head>
<body>
    <h1>상품 추가</h1>
    <form action="insert.prd" method="post" enctype="multipart/form-data">
        <label for="pname">상품 이름:</label>
        <input type="text" id="pname" name="pname" required>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" required>

        <label for="stock">재고:</label>
        <input type="number" id="stock" name="stock" required>

        <label for="capacity">용량:</label>
        <input type="text" id="capacity" name="capacity" required>

        <label for="pcontent">설명:</label>
        <textarea id="pcontent" name="pcontent" required></textarea>

        <label for="expritydate">유통기한:</label>
        <input type="text" id="expritydate" name="expritydate" required>

        <label for="origin">원산지:</label>
        <input type="text" id="origin" name="origin" required>

        <label for="pcategory">카테고리:</label>
        <select id="pcategory" name="pcategory" required>
            <option value="쌀/잡곡/견과">쌀/잡곡/견과</option>
            <option value="국/탕/찌개">국/탕/찌개</option>
            <option value="음료/커피/생수">음료/커피/생수</option>
            <option value="정육/수산/계란">정육/수산/계란</option>
            <option value="라면/면">라면/면</option>
            <option value="과일/채소">과일/채소</option>
            <option value="양념/장류/오일">양념/장류/오일</option>
            <option value="우유/유제품">우유/유제품</option>
            <option value="햄/어묵/통조림">햄/어묵/통조림</option>
            <option value="생활/기타">생활/기타</option>
        </select>

        <label for="upload">이미지:</label>
        <input type="file" id="upload" name="upload">

        <input type="hidden" name="id" value="${loginInfo.id}">
        <button type="submit">추가</button>
        <input type="button" value="돌아가기" onClick="location.href='list.prd?pageNumber=${param.pageNumber}'">
    </form>
</body>
</html>
