<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ include file="a_top.jsp"%>








                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                <h5><a href="aMemberList.mb">회원</a>/<a href="productList.prd">상품 관리</a></div></h5>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
  
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                               <h5><a href="top.sale">월간수입</a></h5></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1"> 
                                            <h5><a href="">결재함</a></h5>
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" >
                                               <h5><a href="">게시판</a></h5></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

               
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800 title">Charts</h1>
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

				<!-- Bar Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
					</div>
					<div class="card-body">
						<div class="chart-container">
							<canvas id="myBarChart"></canvas>
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

	


                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Server Migration <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Sales Tracking <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Customer Database <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Payout Details <span
                                            class="float-right">80%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Account Setup <span
                                            class="float-right">Complete!</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
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
        var barJsonString = ${barJson};
        var bjsonObject = JSON.stringify(barJsonString);
        var barData = JSON.parse(bjsonObject);
        

        var cateList = [];
        var orderList = [];

        // 데이터 파싱
        for (var i = 0; i < barData.length; i++) {
            var c = barData[i];
            cateList.push(c.pcategory);
            orderList.push(c.ordercount);
            console.log("orderList: " + orderList);
        }

        new Chart(document.getElementById("myBarChart"), {
            type: 'bar',
            data: {
                labels: cateList,
                datasets: [{
                    data: orderList,
                    label: "카테고리별 매출",
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',   // 빨강
                    'rgba(54, 162, 235, 0.2)',   // 파랑
                    'rgba(255, 206, 86, 0.2)',   // 노랑
                    'rgba(75, 192, 192, 0.2)',   // 초록
                    'rgba(153, 102, 255, 0.2)'   // 보라
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',    // 빨강
                    'rgba(54, 162, 235, 1)',    // 파랑
                    'rgba(255, 206, 86, 1)',    // 노랑
                    'rgba(75, 192, 192, 1)',    // 초록
                    'rgba(153, 102, 255, 1)'    // 보라
                ],
                borderWidth: 1
            }]
        },
               
            options: {
                title: {
                    display: true,
                    text: ''
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
<%@include file="a_bottom.jsp" %>

            

                      

         