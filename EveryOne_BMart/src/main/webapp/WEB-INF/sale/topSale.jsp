<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/a_top.jsp"%>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 ">매출그래프</h1>
	<p class="mb-4"></p>

	<!-- Content Row -->
	<div class="row">

		<div class="col-xl-8 col-lg-7">

			<!-- Area Chart -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">매출현황</h6>
				</div>
				<div class="card-body">
					<div class="chart-container">
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
					<div class="chart-container">
						<canvas id="logNameChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
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
             		<c:forEach var="ams" items="${adminMonthlySale.keySet()}">
             			<td>${adminMonthlySale.get(ams)}개</td>
             		</c:forEach>
             	</tr>
             	<tr>
             		<td>총수입</td>
             		<c:forEach var="amsl" items="${adminMonthlySale2.keySet()}">
             			<td>${adminMonthlySale2.get(amsl)}원</td>	
             		</c:forEach>
             	</tr>      
               </tbody>
			</table>
					
	
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
            type: 'line',
            data: {
                labels: monthList,
                datasets: [{
                    data: priceList,
                    label: "월별 매출",
                    borderColor: "#e8c3b9",
                    fill: false
                }]
            },
            options: {
                title: {
                    display: true,
                    text: '월별 매출'
                }
            }
        }); 
        
       
   
        // JSON 데이터를 JSP에서 안전하게 전달
         var pieJsonString = ${pieJson};
        var piejsonObject = JSON.stringify(pieJsonString);
        var pieData = JSON.parse(piejsonObject);

        var labelList = [];
        var valueList = [];
        var colorList = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'];

        // 데이터 파싱
        for (var i = 0; i < pieData.length; i++) {
            var d = pieData[i];
            labelList.push(d.pname);
            valueList.push(d.ordercount);
            console.log("labelList: " + labelList);
        }

        // 차트 데이터 설정
        var data = {
            labels: labelList,
            datasets: [{
                backgroundColor: colorList.slice(0, pieData.length),
                data: valueList
            }]
        };

        // 차트 옵션 설정
        var options = {
            title: {
                display: true,
                text: '인기 상품 TOP5'
            }
        };

        // 차트 생성
        var ctx1 = document.getElementById('logNameChart').getContext('2d');
        new Chart(ctx1, {
            type: 'doughnut',
            data: data,
            options: options
        });
       
    </script>
  
    
<%@include file="../admin/a_bottom.jsp"%>