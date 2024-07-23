<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">    
<style>
    body {
        font-family: "Spoqa Han Sans Neo", sans-serif;
    }
    .table-responsive {
        width: 100%;
    }
    .col-auto, .mr-2 {
        display: inline-block;
        float: left;
    }
    #boxname {
        margin-left: 20px;
        margin-top: 10px;
    }
    .chart-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 400px; /* 차트의 높이를 지정 */
    }
    canvas {
        max-width: 100%;
        max-height: 100%;
    }
</style>    

<%@ include file="../member/owner/o_top.jsp"%>
<%
    // JSP에서 전달받은 JSON 문자열을 사용
    String pieJsonBest = (String)request.getAttribute("pieJsonBest");
    String pieJsonWorst = (String)request.getAttribute("pieJsonWorst");
%>
<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                            <i class="fas fa-coins fa-2x text-gray-500"></i>
                        </div>
                        <div class="col mr-2">
                            <div class="text-lg font-weight-bold text-warning text-uppercase mb-1" id="boxname">
                                <h3><b>상품별 매출현황</b></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
    
    <div class="row">
        <!-- Best5 Product -->
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">BEST 5 상품</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="best5"></canvas>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Worst5 Product -->
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">WORST 5 상품</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="worst5"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 당해년도 상품별 누적 매출현황 -->
    <div class="row">
    	<div class="col-lg-12">
    		<div class="card shadow mb-4">
            	<div class="card-header py-3">
                	<h6 class="m-0 font-weight-bold text-info">2024년 상품별 누적 매출현황</h6>
                </div>
                
                <div class="card-body">
                	<div class="table-responsive">
						<table class="table table-borderless bsb-table-xl text-nowrap align-middle m-0">
							<thead>
								<tr>
									<th></th>
				                    <c:forEach var="yearPname" items="${ylists}">
				                    	<th>${yearPname.pname}</th>
				                    </c:forEach>
				                </tr>
				            </thead>
				            <tbody>
								<tr>
								<th>누적 주문건수</th>
				            	<c:forEach var="sumOrdercount" items="${ylists}">
										<td>${sumOrdercount.ordercount}건</td>
				            	</c:forEach>
								</tr>
								<tr>
								<th>누적 매출액</th>
								<c:forEach var="sumSale" items="${ylists}">
										<fmt:formatNumber value="${sumSale.ordercount*sumSale.price}" var="sumPrice" pattern="###,###"/>
										<td>&#8361;${sumPrice}</td>
				            	</c:forEach>
								</tr>
				            </tbody>
				        </table>
				    </div>
				</div>
            </div>
    	</div>
    </div>
</div>  

<!-- Page level plugins -->
<script src="<%=request.getContextPath()%>/resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script>
    // BEST5 파이 차트 데이터
    var pieJsonBestString = '<%= pieJsonBest %>';
    var pieJsonBestData = JSON.parse(pieJsonBestString);

    var bestLabels = [];
    var bestValues = [];
    var colorList = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'];

    for (var i = 0; i < pieJsonBestData.length; i++) {
        var item = pieJsonBestData[i];
        bestLabels.push(item.pname);
        bestValues.push(item.ordercount);
    }

    var bestData = {
        labels: bestLabels,
        datasets: [{
            backgroundColor: colorList.slice(0, pieJsonBestData.length),
            data: bestValues
        }]
    };

    var bestOptions = {
        plugins: {
            legend: {
                display: true,
                position: 'left',
                labels: {
                    boxWidth: 20,
                    padding: 20
                }
            }
        }
    };

    var ctxBest = document.getElementById('best5').getContext('2d');
    new Chart(ctxBest, {
        type: 'doughnut',
        data: bestData,
        options: bestOptions
    });

    // WORST5 파이 차트 데이터
    var pieJsonWorstString = '<%= pieJsonWorst %>';
    var pieJsonWorstData = JSON.parse(pieJsonWorstString);

    var worstLabels = [];
    var worstValues = [];
    var colorList2 = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'];

    for (var i = 0; i < pieJsonWorstData.length; i++) {
        var item = pieJsonWorstData[i];
        worstLabels.push(item.pname);
        worstValues.push(item.ordercount);
    }

    var worstData = {
        labels: worstLabels,
        datasets: [{
            backgroundColor: colorList2.slice(0, pieJsonWorstData.length),
            data: worstValues
        }]
    };
    
    var worstOptions = {
        plugins: {
            legend: {
                display: true,
                position: 'left',
                labels: {
                    boxWidth: 20,
                    padding: 20
                }
            }
        }
    };

    var ctxWorst = document.getElementById('worst5').getContext('2d');
    new Chart(ctxWorst, {
        type: 'doughnut',
        data: worstData,
        options: worstOptions
    });
</script>    

<%@ include file="../member/owner/o_bottom.jsp"%>
