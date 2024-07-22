<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%> 

<%
    String path = request.getContextPath();
	String path2 = pageContext.getServletContext().getRealPath(path);
	Object url = request.getRequestURL();
	Object uri = request.getRequestURI();
	String name = this.getClass().getSimpleName().replaceAll("_", ".");
	System.out.println(path2);
	System.out.println(url);
	System.out.println(uri);
	System.out.println(name);
%>
    

<style>
	#orderTable{
		margin-top:50px;
		margin-bottom: 40px;
		margin-left: 15%;
		width: 60%;
		border-collapse: collapse;
	}
	.email td:first-child{
		display: inline;
	}
	.title{
		text-align: center;
		font-weight: bold;
		color: #414141;
		margin-top: 70px;
	}
	.product{
		border-bottom: 2px solid #f8f9fc;
		font-size: 16px;
		color: #414141;
	}
	#orderTable td{
		padding: 20px;
		font-size: 14px;
		color: #414141;
	}
	.memberInfoTb, .delieveryInfoTb, .paymentInfoTb{
		text-align: left;
	}
	.productInfoTr, .memberInfoTr, .delieveryInfoTr, .paymentInfoTr{
		border-bottom: 2px solid #808080;
	}
	span{
		font-size: 16px;
		font-weight: bold;
	}
	.delieveryInfoTb input, .paymentInfoTb input{
		background-color: inherit;
		border-radius: 3px;
		border: 1px solid #dddddd;
		font-size: 12px;
		font-weight: bold;
		color: #414141;
		width: 50px;
		height: 25px;
	}
	.sideBanner {
		position: fixed;
		width: 20%;
		height: 400px;
		top: 300px;
		left: 79%;
		font-size: 15px;
		font-weight: bold;
	}
	.sideBanner input{
		border: none;
		text-align: center;
		width: 80px;
		font-size: 17px;
		font-weight: bold;
		color: #414141;
		background-color: inherit;
	}
	.sideBannerDiv, .sideBannerDiv2, .sideBannerDiv3{
		background-color: #f8f9fc;
		padding-left: 50px;
		padding-right: 50px;
		padding-top: 20px;
		padding-bottom: 20px; 
	}
	.sideBannerDiv div, .sideBannerDiv2 div, .sideBannerDiv3 div{
		width: 200px;
		text-align: center;
	}
	.orderPriceDiv, .delieveryFeeDiv, .resultDiv, .payDiv{
		 display: flex;
		 justify-content: space-between;
	}
	.resultDiv{
		padding: 10px;
		border-top: 1px solid #f4f4f4;
	}
	.payDiv input{
		text-align: center;
		height: 50px;
		width: 190px;
		font-size: 20px;
		font-weight: bold;
		color: #ffffff;
		background-color: #2ac1bc;
	}
/* 	.tossPayment{
		visibility: visible;
		position: absolute;
		opacity: 0;
	} */
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    var totalAmount = 0;
    var delieveryFee = $('.dFee').val();
    $('.amount').each(function() {
        var amount =  parseInt($(this).text().replace(/[^0-9]/g, '')); // 숫자만 추출
       totalAmount += amount;
    });
    var result = parseInt(totalAmount+delieveryFee);
    $(".amount2").val(totalAmount.toLocaleString("ko-KR"));
    $(".orderprice").val(result.toLocaleString("ko-KR"));
    
});
function payButton(){
	const options = 'width=900, height=600, top=100, left=500, scrollbars=yes'
	const payment = $('input[name=payment]:checked').val();
	var message = document.querySelector('textarea[name="message"]').value;
	var way = $('input[name=way]:checked').val();
	var mid = $('input[name=mid]').val();
	var mname = $('input[name=mname]').val();
	var prdnum = $('input[name=pnum]').val();
	var pnum =[];
	var qty =[];
	
    // 각 상품의 pnum을 배열에 추가
    $('input[name=pnum]').each(function() {
        pnum.push($(this).val());
    });
    
    // 각 상품의 qty를 배열에 추가
    $('input[name=qty]').each(function() {
        qty.push($(this).val());
    });
	
	if(payment==null){
		alert("결제수단을 선택해주세요.");
		return;
	}else if(payment=='신용카드'){
		window.open('paypage.mall?pnum='+pnum+'&message='+message+'&way='+way+'&payment='+payment+'&qty='+qty+'&mid='+mid+'&mname='+mname, '_blank', options);
	}else if(payment=='무통장입금'){
		
	}
	
}
</script>

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

<body>
<h4 class="title">주문서</h4>
<form:form id="paymentForm" action="paymentpage.ct" method="get"> 
<table id="orderTable">
	<tr class="productInfoTr">
		<td colspan="4">
			<span>주문 상품</span>
		</td>
	</tr>
<c:forEach var="i" begin="0" end="${fn:length(plist)-1}" items="${plist}" step="1" varStatus="status">
	<input type="hidden" name="pnum" value="${i.pnum}">
	<input type="hidden" name="qty" value="${qty[status.index]}">
	<input type="hidden" name="mid" value="${id}">
	<tr class="product">
		<td class="productImg">
				<img src="<%=path%>/resources/img/no-pictures.png" width="50px" height="50px"> 
		</td>
		<td>
			${i.pname}
		</td>
		<td>
			${qty[status.index]}개
		</td>
		<td>
			<span class="amount">
				<fmt:formatNumber value="${i.price*qty[status.index]}" type="number" pattern="#,###"/>
			</span>
		</td>
	</tr>
	</c:forEach>
</table>
<table class="memberInfoTb" id="orderTable">
		<tr class="memberInfoTr">
			<td>
				<span>주문자 정보</span>
			</td>
		</tr>
		<tr>
			<td>
				주문자
			</td>
			<td>
				<input type="hidden" name="mname" value="${member.name}">
				${member.name}
			</td>
		</tr>
		<tr>
			<td>
				휴대폰
			</td>
			<td>
				${member.phone1}${member.phone2}-${member.phone3}
			</td>
		</tr>
		<tr>
			<td>
				이메일
			</td>
			<td>
				<p>${member.email1}@${member.email2}</p>
				<p>이메일을 통해 주문처리과정을 보내드립니다.<br>
				정보 변경은 마이페이지 > 개인정보 수정 메뉴에서 가능합니다.</p>
			</td>
		</tr>
</table>
<table class="delieveryInfoTb" id="orderTable">
		<tr class="delieveryInfoTr">
			<td>
				<span>배송 정보</span>
			</td>
		</tr>
		<tr>
			<td>
				배송지
			</td>
			<td>
			<c:if test="${fn:length(alists) > 0}">
			<c:forEach var="addr" begin="0" end="${fn:length(alists)-1}" items="${alists}" step="1" varStatus="status">
				<input type="radio" name="addr" value="${addr.alias}">${addr.alias}
			</c:forEach>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>
				배송 방법
			</td>
			<td>
				<input type="radio" name="way" value="배달"> 배달&ensp; 
				<input type="radio" name="way" value="방문포장"> 방문포장
			</td>
		</tr>
		<tr>
			<td>
				배송 요청사항
			</td>
			<td>
				<textarea rows="1" cols="30" name="message"></textarea>
			</td>
		</tr>
</table>
<table class="paymentInfoTb" id="orderTable">
		<tr class="paymentInfoTr">
			<td>
				<span>결제 수단</span>
			</td>
		</tr>
		<tr>
			<td>
				결제수단 선택
			</td>
			<td>
				<input type="radio" id="payment" name="payment" value="신용카드">신용카드&ensp; 
				<input type="radio" id="payment" name="payment" value="무통장입금">무통장입금
			</td>
		</tr>
		<tr>
			<div class="tossPayment" id="tossPayment">
			</div>
		</tr>
</table>
<div class="sideBanner">
	<div class="sideBannerDiv">
		<div class="orderPriceDiv">
			<div class="orderPrice">
				주문 금액
			</div>
			<div class="orderPrice2">
				<input type="text" class="amount2" name="oPrice" value="">
			</div>
		</div>
		<div class="delieveryFeeDiv">
			<div class="delieveryFee">
				배송 금액
			</div>
			<div class="delieveryFee2">
				<input type="text" class="dFee" name="dFee" value="">
			</div>
		</div>
	</div>
	<div class="sideBannerDiv2">
		<div class="resultDiv">
			<div class="result">
				결제 금액
			</div>
			<div class="result2">
				<input type="text" class="orderprice" name="orderprice" value="">
			</div>
		</div>
	</div>
	<div class="sideBannerDiv3">
		<div class="payDiv">
			<div class="pay2">
				<input type="button" class="payBtn" value="결제하기" onclick="payButton()">
			</div>
		</div>
	</div>
</div>
</form:form>
</body>

<%@ include file="mall_bottom.jsp"%>  