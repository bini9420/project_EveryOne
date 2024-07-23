<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>
<%@ page import = "javax.servlet.jsp.*" %>

<%
	String path = request.getContextPath();
%>
<style type="text/css">
	.cartTable{
		border-collapse: collapse;
		width: 70%;
	}
	.firstTr{
		border-bottom: 1px solid #414141;
		border-bottom-width: 2px;
		font-weight: bold;
		color: #353535;
		font-size: 14px;
	}
	.firstTr a{
	  text-decoration: none;
	  color: inherit;
	}
	.cartTable td{
		padding: 10px;
	}
	.cartTable img{
		display: block;
		margin: auto;
	}
	.cart{
		margin-top: 50px;
	}
	.d-flex input{
		margin-left: 100px;
		width: 300px;
	}
	.countBtn button {
		background-color: inherit;
		border: 0px;
	}
	.count{
		background-color: inherit;
		border: 0.5px solid #f3f5f7;
		border-radius: 5px;
	}
	.countInput{
		text-align: center;
	}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	.sum, .total{
		text-align: right;
	}
	.cartTable tr:last-child{
		border-bottom: inherit;
	}
	.cartTable tr:last-child td{
		text-align: center;
	}
	.cartTable tr:last-child input{
		border: 0px;
		border-radius: 5px;
		background-color: #2ac1bc;
		color: white;
		font-weight: bold;
		width: 150px;
		height: 50px;
		font-size: 27px;
	}
	#selectAll{
		cursor:pointer;
		width:20px;
  		height:20px;
  		border:2px solid #F47C7C;
  		border-radius: 5px;
	}
	#rowSelect{
		cursor:pointer;
		width:20px;
  		height:20px;
  		border:2px solid #F47C7C;
  		border-radius: 5px;
	}
	.count{
		margin: auto;
		padding: auto;
	}
	.dFee{
		text-align: right;
	}
	.productImg, .title, .orderAmount, .deleteBtn{
		text-align: center;
	}
	.cntBtn{
		width: 130px;
	}
	.updateBtn{
		text-align: right;
	}
	.updateBtn input{
		border: 0px;
		border-radius: 5px;
		background-color: #2ac1bc;
		color: white;
		font-weight: bold;
		width: 100px;
		height: 30px;
		font-size: 14px;
	}
	.header{
		margin-top: 40px;
		margin-bottom: 10px;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		color: #414141;
	}
	.orderTd{
		text-align: center;
		padding-bottom: 50px;
	}
	#showMoreBtn{
		border: 0px;
		border-radius: 5px;
		background-color: #3c3c3c;
		color: white;	
		font-weight: bold;
		width: 150px;
		height: 50px;
		font-size: 27px;
	}
	.dtext{
		width: 210px;
		border: 2px solid #fa622f;
		border-radius: 15px;
		color: fa622f;
		font-size: 14px;
		font-weight: bold;
		padding: 5px;
		text-align: center;
		margin-left: 84%;
	}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
    calculateTotalAmount();
    
    $('input[name="rowSelect"]').change(function() {
        calculateTotalAmount();
    });
    
    var itemsPerPage = 5;
    var $productRows = $('.countBtn'); // 품목 행 선택
    
    showHideProductRows(itemsPerPage);
    
    $('#showMoreBtn').click(function(event) {
    	event.preventDefault();
        itemsPerPage += 5; // 예시로 5개씩 더 보이도록 증가
        showHideProductRows(itemsPerPage);
    });
    
    function showHideProductRows(itemsToShow) {
        $productRows.each(function(index) {
            if (index < itemsToShow) {
                $(this).show(); // 행을 보이게 처리
            } else {
                $(this).hide(); // 행을 숨기게 처리
            }
        });
        
        if ($productRows.length > itemsToShow) {
            $('#showMoreBtn').show(); // 더보기 버튼을 보이게 처리
        } else {
            $('#showMoreBtn').hide(); // 더 이상 행이 없으면 더보기 버튼을 숨기게 처리
        }
    }
});

 	function up(index){
    // 현재 수량 가져오기
    var currentCount =  parseInt($('.countInput').eq(index).val());
    // 수량 증가
    currentCount++;
    // 증가된 수량을 입력 필드에 설정
    $('.countInput').eq(index).val(currentCount);
    // 가격 계산 로직 추가 예시
    var price = parseInt($('.price').eq(index).val());
    var totalPrice = price * currentCount; 
    
    // 계산된 가격을 화면에 출력 (예시, 실제 구현에 맞게 수정 필요)
    $('.amount').eq(index).text(totalPrice.toLocaleString("ko-KR"));
    
    calculateTotalAmount();
	} 
	
	function down(index){
	    var currentCount =  parseInt($('.countInput').eq(index).val());
	    if(currentCount>1){
	   		currentCount--;
		    $('.countInput').eq(index).val(currentCount);
		    // 가격 계산 로직 추가 예시
		    var price = parseInt($('.price').eq(index).val());
		    var totalPrice = price * currentCount; 
		    // 계산된 가격을 화면에 출력 (예시, 실제 구현에 맞게 수정 필요)
		    $('.amount').eq(index).text(totalPrice.toLocaleString("ko-KR"));
	    }else{
	    	alert("최소 주문 수량입니다.");
	    }
	    
	    calculateTotalAmount();
	}
	
	function calculateTotalAmount() {
	    var totalAmount = 0;
	    var totalprice = 0;
	    var dFee = 0;
	    // 모든 체크된 상품의 가격 합산
	    $('input[name="rowSelect"]:checked').each(function() {
	    	var amount = parseInt($(this).closest('tr').find('.amount').text().replace(/[^0-9]/g, ''));
	        totalAmount += amount;
	    });
	    
        if(totalAmount === 0 || totalAmount >= 10000){
        	dFee = 0;
        }else{
        	dFee = 3000;
        }
        $("#delieveryFee2").text(dFee.toLocaleString("ko-KR"));
	    $("#dFee2").val(dFee.toLocaleString("ko-KR"));
	    document.getElementById('dFee2').value = dFee;
        
	    var totalPrice = totalAmount + dFee;
	    $("#totalAmount").val(totalAmount.toLocaleString("ko-KR"));
	    $("#totalAmount2").text(totalPrice.toLocaleString("ko-KR"));
	}
	
	function allCheck(obj) {
	    var check = obj.checked;
	    if (check == true) {
	        $('.rowSelect').prop('checked', true);
	    } else {
	        $('.rowSelect').prop('checked', false);
	    }
	    calculateTotalAmount(); // Call the function to update the total amount
	}


	function checkTest() {
	    var rowCnt = $('input:checkbox[name="rowSelect"]').length;
	    var rowChkCnt = $('input:checkbox[name="rowSelect"]:checked').length;
	    
	    if (rowCnt != rowChkCnt) {
	        $('input:checkbox[id="selectAll"]').prop("checked", false);
	    } else {
	        $('input:checkbox[id="selectAll"]').prop("checked", true);
	    }
	    calculateTotalAmount(); // Call the function to update the total amount
	}


	
	function update(){
         var checkedBoxes = $('input:checkbox[name="rowSelect"]:checked');
        if (checkedBoxes.length === 0) {
            alert("수량 변경할 상품을 선택하세요.");
            return;
        }
        
        var pnumArray = [];
        var pqtyArray = [];
        checkedBoxes.each(function(index, checkbox){
	        var pnum = $(checkbox).closest('tr').find('.rowSelect').val();
	        var pqty = $(checkbox).closest('tr').find('.countInput').val();
	        //alert("선택한 상품의 갯수: "+ pqty);
	        //alert("선택한 상품의 번호: "+ pnum);
	        pnumArray.push(pnum);
	        pqtyArray.push(pqty);
    });
	    // 배열을 GET 방식으로 보내기 위한 URL 생성
	    var url = 'updateQty.mall?';
	    // pnumArray와 pqtyArray의 길이가 같으므로 가정하여 함께 처리.
	    for (var i = 0; i < pnumArray.length; i++) {
	        if (i > 0) {
	            url += '&'; // URL 파라미터를 연결하기 위한 '&' 추가
	        }
	        url += 'pnum=' + pnumArray[i] + '&';
	        url += 'pqty=' + pqtyArray[i];
	    }
    	location.href = url;
	}
	
	function order(){
         var checkedBoxes = $('input:checkbox[name="rowSelect"]:checked');
         
 	    if (checkedBoxes.length === 0) {
	        alert("주문할 상품을 선택하세요.");
	        return false; // 주문 중단
	    }
        
        var pnumArray = [];
        var pqtyArray = [];
        checkedBoxes.each(function(index, checkbox){
	        var pnum = $(checkbox).closest('tr').find('.rowSelect').val();
	        var pqty = $(checkbox).closest('tr').find('.countInput').val();
	        //alert("선택한 상품의 갯수: "+ pqty);
	        //alert("선택한 상품의 번호: "+ pnum);
	        pnumArray.push(pnum);
	        pqtyArray.push(pqty);
    });
	    return true;
	}
	
</script>
<p class="header">장바구니</p>
<div class="cart">
<form name="countForm" action="order.mall" method="post" onsubmit="return order();">
<table align="center" class="cartTable">
	<tr class="firstTr">
		<td colspan="5" >
			<input type="checkbox" id="selectAll" name="selectAll" onclick="allCheck(this)">&ensp;&ensp;전체선택
		</td>
		<td class="updateBtn">
			<input type="button" id="updateQty" name="updateQty" value="주문수량 수정" onclick="update()"/>
		</td>
	</tr>
<c:if test="${not empty plist}">
<c:forEach var="i" begin="0" end="${fn:length(plist)-1}" items="${plist}" step="1" varStatus="status">
	<tr class="countBtn">
		<td>
			<input type="checkbox" id="rowSelect" name="rowSelect" class="rowSelect" value="${i.pnum}" onclick="checkTest()">
		</td>
		<td class="productImg">
				<input type="hidden" id="pimage" name="pimage" value="${i.pimage}">
				<c:if test="${i.pimage eq null}">
					<a href="detail.mall?pnum=${i.pnum}">
						<img src="<%=path%>/resources/img/no-pictures.png" width="50px" height="50px" class="product2">
					</a>
				</c:if>
				<c:if test="${i.pimage ne null}">
					<a href="detail.mall?pnum=${i.pnum}">
						<img src="<%=request.getContextPath()+"/resources/uploadImage/"%>${i.pimage}" width="65px" height="65px" class="product2">
					</a>
				</c:if>
		</td>
		<td class="title">
		<input type="hidden" id="pname" name="pname" value="${i.pname}">
			${i.pname}
		</td>
		<td class="cntBtn">
			<div class="count">
			<button type="button" name="countBtn" class="upBtn" onclick="up(${status.index})">
				<img src="<%=request.getContextPath()%>/resources/img/up.png" width="20px" height="20px">
			</button>
			<input type="number" class="countInput" name="countInput" value="${qty[status.index]}" style="width: 30px; border: none;" id="countInput">
			<button type="button" name="countBtn" class="downBtn" onclick="down(${status.index})">
				<img src="<%=request.getContextPath()%>/resources/img/down.png" width="20px" height="20px">
			</button>
			</div>
		</td>
		<td class="orderAmount">
			<input type="hidden" name="price" id="price" class="price" value="${i.price}">
			<span id="amount" class="amount">
			<fmt:formatNumber value="${i.price*qty[status.index]}" type="number" pattern="#,###"/>
			</span>원<br>
		</td>
		<td class="deleteBtn">
			<a href="cartDelete.mall?pnum=${i.pnum}">
			<img src="<%=request.getContextPath()%>/resources/img/close.png" width="20px" height="20px">
			</a>
		</td>
	</tr>
		<input type="hidden" class="pnum" name="pnum" value="${i.pnum}">
</c:forEach>
</c:if>
<c:if test="${empty plist}">
	<tr>
	      <td colspan="6">
	          장바구니에 담긴 상품이 없습니다.
	      </td>
	</tr>
</c:if>
	<tr>
		<td class="dFee" colspan="6">
			<p class="dtext">1만원 이상 구매 시 무료배송</p>
			배송비: &ensp; 
			<span id="delieveryFee2" ></span>원
			<input type="hidden" id="dFee2" name="dFee2" value="">
		</td>
	</tr>
	<tr>
		<td class="total" colspan="6">
			결제 예정 금액:&ensp; 
			<input type="hidden" id="totalAmount" value="">
			<span id="totalAmount2" ></span>원<br>
		</td>
	</tr>
	<tr>
    <td colspan="6" class="orderTd">
        <button id="showMoreBtn" style="display: none;">더보기</button>
    </td>
	</tr>	
	<tr>
		<td colspan="6" class="orderTd">
			<input type="submit" class="orderBtn" value="주문하기">
		</td>
	</tr>
</table>
</form>
</div>


<%@ include file="mall_bottom.jsp"%>