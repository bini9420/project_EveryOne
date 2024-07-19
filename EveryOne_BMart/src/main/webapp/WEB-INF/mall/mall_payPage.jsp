<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- jquery추가 -->
<!-- 포트원 결제 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
	    IMP.init("imp60158017"); 
	    var payname = "${payname}";
	    var totalAmount = "${totalAmount}";
	    var id = "${mb.id}";
	    var name = "${mb.name}";
	    var email = "${mb.email}";
	    var pnum = ${pnumList};
	    var qty = ${qtyList};
	    var way = "${way}";
	    var message = "${message}";
	    var orderprice = ${orderPriceList};
	    var payment = "${payment}";
	    
	    IMP.request_pay(
	    		  {
	    		    pg: "html5_inicis",
	    		    pay_method: "card",
	    		    merchant_uid: "pay"+new Date().getTime(), // 주문 고유 번호
	    		    name: payname,
	    		    amount: 100,
	    		    buyer_email: email,
	    		    buyer_name: name
	    		  },function (rsp) {
	    	            if (rsp.success) {
	    	            console.log(rsp);
	    	            var payRequest = {
   	                        id: id,
   	                        pnum: pnum,
   	                        qty: qty,
   	                        orderprice: orderprice,
   	                        contents: message,
   	                        way: way,
   	                        status: "배송 준비 중",
   	                        payment: payment	    	            		
	    	            }
	    	                $.ajax({
	    	                    url:'pay.mall',
	    	                    type:'POST',
	    	                    contentType: 'application/json',
	    	                    data: JSON.stringify(payRequest),
	    	                    success: function (rsp) {
	    	                      console.log(rsp);
	    	                    },
	    	                    error: function (err) {
	    	                      console.err(err);
	    	                    }
	    	                  }); //ajax
	    	                var msg = '결제가 완료되었습니다.';
	    	                } else {
	    	                    var msg = '결제 실패';
    	                  }
	    	            alert(msg);
	    	            window.opener.location.href="orderList.mall";
	    		  }
	    		);
	</script>
</head>
</html>
