<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@ include file="../admin/a_top.jsp"%>


<!-- Begin Page Content -->
<div class="mx-auto my-5" style="width: 90%">

	<div class="text-center my-4"><h2>매출 관리</h2></div>
	
	<!-- Content Row -->
	<div class="row">
		<div class="col-xl-8 col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">매출현황</h6>
				</div>
				<!-- Aria Chart -->
				<div class="card-body">
					<div class="container">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Donut Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">인기 상품 TOP5</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<canvas id="logNameChart"></canvas>
				</div>
			</div>
		</div>
		
		<!-- <div class="col-xl-7">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">상품 카테고리별 매출현황</h6>
				</div>
				<div class="card-body">
					<canvas id="myBarChart"></canvas>
				</div>
			</div>
		</div> -->
	</div>
	
	<% String months[] = {"1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"}; %>
	
	<table class="table bg-white">
	    <thead>
	        <tr>
	            <th></th>
	            <c:forEach var="month" items="<%=months %>">
					<th>${month }</th>                    
				</c:forEach>
	    	</tr>
		</thead>
		<tbody>
		 	<tr>
			 	 <td>총 주문수</td>
        <c:forEach var="amsMap" items="${monthSumCount}">
            <c:forEach var="entry" items="${amsMap.entrySet()}">
                <td>${entry.value}개</td>
            </c:forEach>
        </c:forEach>
    </tr>
    <!-- 총 수입을 표시하는 행 -->
    <tr>
        <td>총수입</td>
        <c:forEach var="amslMap" items="${monthSumCount2}">
            <c:forEach var="entry" items="${amslMap.entrySet()}">
                <td><fmt:formatNumber value="${entry.value}" type="number"/>원</td>
            </c:forEach>
        </c:forEach>
			</tr>      
		</tbody>
	</table>
	
</div>
		
		


<script>
	// JSON 데이터를 JSP에서 안전하게 전달
	var areaJsonString = ${areaJson};
	var jsonObject = JSON.stringify(areaJsonString);
	var areaData = JSON.parse(jsonObject);

	var monthList = [];
	var priceList = [];

	// 데이터 파싱
	for (var i = 0; i < areaData.length; i++) {
		var j = areaData[i];
		monthList.push(j.orderdate);
		priceList.push(j.totalPrice);
		console.log("monthList: " + monthList);
	}

	new Chart(document.getElementById("myAreaChart"), {
		type : 'line',
		data : {
			labels : monthList,
			datasets : [ {
				data : priceList,
				label : "월별 매출",
				borderColor : "#e8c3b9",
				fill : false
			} ]
		},
		options : {
			title : {
				display : true,
				text : '월별 매출'
			}
		}
	});

	// JSON 데이터를 JSP에서 안전하게 전달
	var pieJsonString = ${pieJson};
	var piejsonObject = JSON.stringify(pieJsonString);
	var pieData = JSON.parse(piejsonObject);

	var labelList = [];
	var valueList = [];
	var colorList = [ '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF' ];

	// 데이터 파싱
	for (var i = 0; i < pieData.length; i++) {
		var d = pieData[i];
		labelList.push(d.pname);
		valueList.push(d.ordercount);
		console.log("labelList: " + labelList);
	}

	// 차트 데이터 설정
	var data = {
		labels : labelList,
		datasets : [ {
			backgroundColor : colorList.slice(0, pieData.length),
			data : valueList
		} ]
	};

	// 차트 옵션 설정
	var options = {
		title : {
			display : true,
			text : '인기 상품 TOP5'
		}
	};

	// 차트 생성
	var ctx1 = document.getElementById('logNameChart').getContext('2d');
	new Chart(ctx1, {
		type : 'doughnut',
		data : data,
		options : options
	});
</script>


<%@include file="../admin/a_bottom.jsp"%>

