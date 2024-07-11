<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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