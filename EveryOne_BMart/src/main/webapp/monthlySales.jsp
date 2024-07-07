<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="WEB-INF/common/common.jsp" %>
<%@include file="WEB-INF/admin/a_top.jsp"%>

<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top 5 Products</title>
  
    
</head>
    <script>
    var jsonData = ${json}
    var jsonObject = JSON.stringify(jsonData);
    var jData = JSON.parse(jsonObject);
    
    		
    var labelList = new Array();
    var valueList = new Array();
    var colorList = new Array();
    		
    for(var i = 0; i<jData.length; i++) {
    	var d = jData[i];
    	labelList.push(d.pnum);
    	valueList.push(d.ordercount);
    	colorList.push(colorize());
    }
    
    function colorize() {
    	var r = Math.floor(Math.random()*200);
    	var g = Math.floor(Math.random()*200);
    	var b = Math.floor(Math.random()*200);
    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
    	return color;
    }
    
    var data = {
			labels: labelList,
			datasets: [{
					backgroundColor: colorList,
					data : valueList
			}],
			options : {
					title : {
					display : true,
					text: '유저별 접속 횟수'
					}
			}
};

    
    
	
    var ctx1 = document.getElementById('logNameChart').getContext('2d');
    new Chart(ctx1, {
    	      type: 'pie',
    		  data: data
    });
    
    </script>



<body>

   <script

	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script

	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>





                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the area chart can be found in the
                                    <code>/js/demo/chart-area-demo.js</code> file.
                                </div>
                            </div>


  <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the bar chart can be found in the
                                    <code>/js/demo/chart-bar-demo.js</code> file.
                                </div>
                            </div>

                        </div>


<div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="logNameChart">
    
                                        
                                 
                                        
                                        </canvas>
	
		


                                        
                                        
                                        
                                    </div>
                                    <hr>
                                    Styling for the donut chart can be found in the
                                    <code>/js/demo/chart-pie-demo.js</code> file.
                                </div>
                            </div>
</div>
</body>