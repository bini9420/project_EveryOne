<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
</head>
<body>
    <h1>상품 수정</h1>
    <form action="${pageContext.request.contextPath}/update.prd" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pnum" value="${product.pnum}">
        <input type="hidden" name="upload2" value="${product.pimage}">
        <input type="hidden" name="pageNumber" value="${pageNumber}">

        <label for="pname">상품 이름:</label>
        <input type="text" id="pname" name="pname" value="${product.pname}" required>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" value="${product.price}" required>

        <label for="stock">재고:</label>
        <input type="number" id="stock" name="stock" value="${product.stock}" required>

        <label for="capacity">용량:</label>
        <input type="text" id="capacity" name="capacity" value="${product.capacity}" required>

        <label for="pcontent">설명:</label>
        <textarea id="pcontent" name="pcontent" required>${product.pcontent}</textarea>

        <label for="expritydate">유통기한:</label>
        <input type="text" id="expritydate" name="expritydate" value="${product.expritydate}" required>

        <label for="origin">원산지:</label>
        <input type="text" id="origin" name="origin" value="${product.origin}" required>

        <label for="pcategory">카테고리:</label>
        <select id="pcategory" name="pcategory" required>
            <option value="쌀/잡곡/견과" ${product.pcategory == '1' ? 'selected' : ''}>쌀/잡곡/견과</option>
            <option value="국/탕/찌개" ${product.pcategory == '2' ? 'selected' : ''}>국/탕/찌개</option>
            <option value="음료/커피/생수" ${product.pcategory == '3' ? 'selected' : ''}>음료/커피/생수</option>
            <option value="정육/수산/계란" ${product.pcategory == '4' ? 'selected' : ''}>정육/수산/계란</option>
            <option value="라면/면" ${product.pcategory == '5' ? 'selected' : ''}>라면/면</option>
            <option value="과일/채소" ${product.pcategory == '6' ? 'selected' : ''}>과일/채소</option>
            <option value="양념/장류/오일" ${product.pcategory == '7' ? 'selected' : ''}>양념/장류/오일</option>
            <option value="우유/유제품" ${product.pcategory == '8' ? 'selected' : ''}>우유/유제품</option>
            <option value="햄/어묵/통조림" ${product.pcategory == '9' ? 'selected' : ''}>햄/어묵/통조림</option>
            <option value="생활/기타" ${product.pcategory == '10' ? 'selected' : ''}>생활/기타</option>
        </select>

        <label for="upload">이미지:</label>
        <input type="file" id="upload" name="upload">

        <button type="submit">수정</button>
        <input type="button" value="돌아가기" onClick="location.href='list.prd?pageNumber=${param.pageNumber}'">
    </form>
</body>
</html>
