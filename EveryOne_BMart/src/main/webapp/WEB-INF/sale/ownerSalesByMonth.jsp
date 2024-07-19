<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>	
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/tables/table-1/assets/css/table-1.css">    
<style>
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
</style>	

<%@ include file="../member/owner/o_top.jsp"%>
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
                                <div class="text-lg font-weight-bold text-warning text-uppercase mb-1" id="boxname"><h3><b>상품별 매출현황</b></h3></div>
                            </div>
                  		</div>
             	  </div>
        	</div>
    	</div>	
	</div>
	
	<div class="row">
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
	//JSON 데이터를 JSP에서 안전하게 전달
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

<%@ include file="../member/owner/o_bottom.jsp"%>