<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
 #approveBox:hover {
 	cursor: pointer;
 }
 #approvalRequest {
 	display: inline;
 }
</style>
<%@ include file="../common/common.jsp"%>
<%@ include file="a_top.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">
     
	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								<h4>
									<a href="aMemberList.mb">회원</a>/<a href="adminProductList.prd">상품관리</a>
								</h4>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">100명</div>
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
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								<h4>
									<a href="top.sale">월간수입</a>
								</h4>
							</div>
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
			<div class="card border-left-info shadow h-100 py-2" onclick="location.href='admin_allBox.dc'" id="approveBox">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
								<h5 id="approvalRequest">결재 요청</h5>
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${documentCount}건</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-danger" role="progressbar"
                                             style="width: ${documentCount*10}" aria-valuenow="${documentCount}" aria-valuemin="0"
                                             aria-valuemax="10"></div>
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
							<div
								class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								<h4>
									<a href="adlist.nt">게시판</a>
								</h4>
							</div>
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

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">매출현황</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">Dropdown Header:</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Aria Chart -->
				<div class="card-body">
					<div class="chart-container">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">일정표</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">Dropdown Header:</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div id='calendar-container'>
						<div id='calendar'></div>
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

						<!-- Bar Chart -->

						<div class="chart-container">
							<canvas id="myBarChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 mb-4">

				<!-- Illustrations -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">결재함</h6>
					</div>
					<div class="card-body">
						<div class="text-center">
							<!-- 결재 문서함 -->

							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-container">
									<div class="table-responsive">
										<table
											class="table table-borderless bsb-table-xl text-nowrap align-middle m-0 table-hover">
											<thead>
												<tr>
													<th>문서종류</th>
													<th>문서번호</th>
													<th>제목</th>
													<th>작성일자</th>
													<th>결재상태</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="doc" items="${docList}">
													<tr onclick="detailDocument('${doc.dnum}')"
														data-bs-toggle="modal" data-bs-target="#staticBackdrop">
														<td>[${doc.dcategory}]</td>
														<td>
															<h6 class="mb-1">${doc.dnum}</h6>

														</td>
														<td>
															<h6 class="mb-1">${doc.title}</h6>
														</td>
														<td>
															<h6 class="mb-1">${fn:substring(doc.writeday, 0, 10)}</h6>
														</td>
														<!-- 
							                    	-1: 반려 / 0: 대기(결재진행중) / 1: 승인(결재완료) / 10: 임시저장
							                     -->
														<td id="documentStatus" align="left"><c:if
																test="${doc.dstatus eq -1}">
																<span class="badge rounded-pill bg-danger">반려</span>
															</c:if> <c:if test="${(doc.dstatus eq 0) && (doc.request eq 1)}">
																<span class="badge rounded-pill bg-info">대기</span>
															</c:if> <c:if test="${doc.dstatus eq 1}">
																<span class="badge rounded-pill bg-success">승인</span>
															</c:if> <c:if test="${(doc.request eq 0) && (doc.dstatus eq 0)}">
																<span class="badge rounded-pill bg-warning">임시저장</span>
															</c:if></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		</div>
</div>		
		<!-- End of Main Content -->

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
</script>

<script>
var calendar = null;
var initialLocaleCode = 'ko';

$(document).ready(function () {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
        initialDate: '2024-07-16',
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay,listWeek'
        },
     
      
        navLinks: true,
        editable: true,
        selectable: true,
        droppable: true, // allows things to be dropped onto the calendar
        
       /*  events: function(fetchInfo, successCallback, failureCallback) {
            $.ajax({
                url: "/schedule/showSchedule",
                method: "GET",
                dataType: "json",
                success: function(data) {
                    successCallback(data);
                },
                error: function() {
                    failureCallback();
                }
            });
        },
         */
       
        eventDrop: function (info) {
            if (confirm("'" + info.event.title + "' 일정을 수정하시겠습니까?")) {
                var events = [{
                    title: info.event.title,
                    start: info.event.start.toISOString(),
                    end: info.event.end ? info.event.end.toISOString() : null
                }];

                $.ajax({
                    url: "/schedule/updateSchedule",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                })
                .done(function (result) {
                    console.log("Event updated successfully:", result);
                })
                .fail(function (request, status, error) {
                    console.error("Error updating event:", error);
                });
            }
        },

        select: function (arg) {
            var title = prompt('일정을 입력해주세요.');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                });

                var events = [{
                    title: title,
                    start: arg.start.toISOString(),
                    end: arg.end ? arg.end.toISOString() : null
                }];

                $.ajax({
                    url: "/schedule/addSchedule",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                })
                .done(function (result) {
                    console.log("Event added successfully:", result);
                })
                .fail(function (request, status, error) {
                    console.error("Error adding event:", error);
                });

                calendar.unselect();
            }
        },
        
       
    
        eventClick: function (info) {
            if (confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")) {
                info.event.remove();

                var events = [{
                    title: info.event.title,
                    start: info.event.start.toISOString()
                }];

                $.ajax({
                    url: "/schedule/deleteSchedule",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                })
                .done(function (result) {
                    console.log("Event deleted successfully:", result);
                })
                .fail(function (request, status, error) {
                    console.error("Error deleting event:", error);
                });
            }
        }
    });



    
    
    calendar.render();
});

</script>