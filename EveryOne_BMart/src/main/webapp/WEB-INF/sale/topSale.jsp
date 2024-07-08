<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/a_top.jsp"%>
<%@ include file="../common/common.jsp"%>


<head>
    <meta charset="UTF-8">
   
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    
    





<!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">인기 상품 TOP5</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="logNameChart" ></canvas>
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
       
        
        
        function colorize(index) {
        	return colors[index % colors.length];
        }

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
                text: '유저별 접속 횟수'
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
