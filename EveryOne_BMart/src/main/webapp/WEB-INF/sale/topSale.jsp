<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/a_top.jsp"%>

<%@ include file="../common/common.jsp"%>



<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Charts</h1>
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



				<script>
        // JSP에서 전달된 JSON 데이터를 JavaScript 변수로 할당
        var json = ${json};
        var jsonObject = JSON.stringify(json);
        var jsonData = JSON.parse(jsonObject);
       
        var monthList = [];
        var priceList = [];
      
       
       
        // 데이터 파싱
        for (var i = 0; i < jsonData.length; i++) {
            var j = jsonData[i];
            monthList.push(j.orderdate);
            priceList.push(j.totalPrice);
           
            
            
            console.log("monthList"+monthList);
        }

       new Chart(document.getElementById("myAreaChart"),{
    	   type:'line',
       		data:{
       			labels:monthList,
       			datasets:[{
       				data:priceList,
       				label:"월별 매출",
       				borderColor:"#e8c3b9",
       				fill:false
       			}
       			]
       		},
       
       
      
        // 차트 옵션 설정
        options : {
            title: {
                display: true,
                
            }
        }     
        }); 
        
	
    </script>


				<!-- Bar Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
					</div>
					<div class="card-body">
						<div class="chart-container">
							<canvas id="myBarChart"></canvas>
						</div>
						<hr>
						Styling for the bar chart can be found in the
						<code>/js/demo/chart-bar-demo.js</code>
						file.
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


	<script>
        // JSP에서 전달된 JSON 데이터를 JavaScript 변수로 할당
        var jsonData = ${json};
        var jsonObject = JSON.stringify(jsonData);
        var jData = JSON.parse(jsonObject);
       
        var labelList = [];
        var valueList = [];
        var colorList = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'];
       
        
       /*  
        function colorize(index) {
        	return colors[index % colors.length];
        }
 */
        // 데이터 파싱
        for (var i = 0; i < jData.length; i++) {
            var d = jData[i];
            labelList.push(d.pname);
            valueList.push(d.ordercount);
           
            
            
            console.log("labelList"+labelList);
        }

        // 차트 데이터 설정
        var data = {
            labels: labelList,
            datasets: [{
            	 backgroundColor: colorList.slice(0, jData.length),
                data: valueList
            }]
        };

        // 차트 옵션 설정
        var options = {
            title: {
                display: true,
               // text: '인기상품'
            }
        };

        // 차트 생성
        var ctx1 = document.getElementById('logNameChart').getContext('2d');
        new Chart(ctx1, {
            type: 'pie',
            data: data,
            options: options
        });
    </script>
</body>
</html>
