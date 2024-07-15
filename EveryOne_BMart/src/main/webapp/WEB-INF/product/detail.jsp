<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
</head>
<body>
    <h1>상품 정보</h1>
    <div class="product-info">
        <div class="product-image">
            <img src="<%=request.getContextPath()+"/resources/uploadImage/"%>${product.pimage}" alt="상품 이미지" width="100" height="100">
        </div>
        <div class="product-details">
            <p>번호: ${product.pnum}</p>
            <p>이름: ${product.pname}</p>
            <p>가격: ${product.price}</p>
            <p>재고: ${product.stock}</p>
            <p>설명: ${product.pcontent}</p>
            <p>원산지: ${product.origin}</p>
            <p>유통기한: ${product.expritydate}</p>
        </div>
    </div>
    <div style="text-align: center;">
	    <input type="button" value="리뷰" onClick="location.href='list.rv?pnum=${product.pnum}'">	
	    <input type="button" value="목록으로" onClick="location.href='list.prd?pageNumber=${param.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}'">
	</div>
</body>
</html>