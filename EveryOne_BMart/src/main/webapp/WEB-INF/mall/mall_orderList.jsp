<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>  
<%@ include file="../mall/mall_top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<style type="text/css">
	table{
		width: 90%;
		margin: auto;
		border: 0px;
		color: #414141;
		text-align: center;
	}
	th{
		padding: 15px;
	}
	td{
		padding: 7px;
		width: 20px;
	}
	.pname_Td{
		width: 50px;
	}
	.padrentDiv{
		margin-top: 50px;
		position: relative;
	}
	.productImg_Td{
		width: 10px;
	}
	.orderDiv{
		border: 3px solid #f0f0f0;
		border-radius: 10px;
		width: 80%;
		margin: auto;
	}
	.reviewTd{
		text-align: center;
	}
	.reviewBtn{
		border: 2px solid #2e59d9;
		border-radius: 5px;
		color: #2e59d9;
		width: 100px;
		height: 35px;
		font-size: 15px;
		background-color: inherit;
	}
	.orderCancel, .orderModify{
		border: 2px solid #3d404d;
		border-radius: 5px;
		color: #3d404d;
		width: 100px;
		height: 35px;
		font-size: 15px;
		background-color: inherit;
	}
	.titleDiv{
		margin-top: 50px;
	}
	.titleDiv p{
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: #414141;
	}
	
	.productImg_Td img{
		width: 50px;
		height: 50px;
	}
	.reviewTd input{
		font-weight: bold;
	}
    .elements_div {
        display: none;
        padding: 10px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
    }
	.product_Th{
		text-align: center;
	}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	function openReviewPopup(pnum, onum, id, pname) {
	    const options = 'width=900, height=300, top=100, left=500, scrollbars=yes';
	    const url = 'insertForm.rv?pnum=' + pnum + '&onum=' + onum + '&id=' + id+'&pname='+pname;
	    window.open(url, '_blank', options);
	}
	
	function deleteOrder(onum, pnum, pamount){
		location.href="deleteOrder.mall?onum="+onum+"&pnum="+pnum+"&pamount="+pamount;
	}
</script>

<body>
<div class="titleDiv">
	<p>주문 내역<p>
</div>
<div class="padrentDiv">
<c:forEach var="i" begin="0" end="${fn:length(olist) - 1}" items="${olist}" step="1" varStatus="status">
	<div class="orderDiv">
	<form action="insertForm.rv" method="post">
	<input type="hidden" name="pnum" value="${i.pnum}">
	<input type="hidden" name="onum" value="${i.onum}">
	<input type="hidden" name="id" value="${i.id}">
		<table>
			<tr>
				<th class="product_Th" colspan="2">
					상품
				</th>
				<th>
					가격
				</th>
				<th>
					수량
				</th>
				<th>
					결제금액
				</th>
				<th>
					결제일
				</th>
				<th>
					배송현황
				</th>
			</tr>
			<tr>
				<td class="productImg_Td">
					<img src="<%=path%>/resources/img/${plist[status.index].pimage}">
				</td>
				<td class="pname_Td">
					<span>${plist[status.index].pname}</span>
				</td>
				<td>
					<fmt:formatNumber value="${plist[status.index].price}" pattern="###,###"></fmt:formatNumber>원
				</td>
				<td>
					${i.pamount}개
				</td>
				<td>
					<fmt:formatNumber value="${i.price}" pattern="###,###"></fmt:formatNumber>원
				</td>
				<td class="orderdate">
					<fmt:parseDate pattern="yyyy-MM-dd" value="${i.orderdate}" var="ymd"/> 
					<fmt:formatDate pattern="yyyy-MM-dd" value="${ymd}" /> 
				</td>
				<td class="status">
					<c:choose>
						<c:when test="${i.status==0}">
							배송 준비 중
						</c:when>
						<c:when test="${i.status==1}">
							배송 시작
						</c:when>
						<c:otherwise>
							배송 완료
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="7" class="reviewTd">
					<input type="button" class="reviewBtn" id="reviewBtn" value="리뷰작성" onclick="openReviewPopup(${i.pnum}, ${i.onum}, '${i.id}', '${plist[status.index].pname}')">
					<input type="button" class="orderCancel" id="orderCancel" value="주문취소" onclick="deleteOrder(${i.onum},${i.pnum},${i.pamount})">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<br>
</c:forEach>
</div>
</body>


