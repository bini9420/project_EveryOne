<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@ include file="a_top.jsp"%>

<style>
	#approveBox:hover {
		cursor: pointer;
	}
	#approvalRequest {
		display: inline;
	}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">
     
	<!-- Content Row -->
	<div class="row">
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								<h5>
									<a href="aMemberList.mb">회원</a>/<a href="adminProductList.prd">상품관리</a>
								</h5>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${memberCount}명/${productCount}개</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								<h5>
									<a href="top.sale">연간수입</a>
								</h5>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${monthSale}" type="number" />원</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2" id="approveBox">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
								<h5 id="approvalRequest">결재 요청</h5>
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${waitCount}건</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-danger" role="progressbar"
                                             style="width: ${waitCount*10}" aria-valuenow="${waitCount}" aria-valuemin="0"
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

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								<h5><a href="dlist.nt">게시판</a></h5>
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${borderCount}개</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xl-7 col-lg-6">
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

		<div class="col-xl-5 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">일정표</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="container">
						<div id='calendar'></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xl-4 col-lg-6">
			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">상품 카테고리별 매출현황</h6>
				</div>
				<div class="card-body">
					<!-- Bar Chart -->
					<div class="chart-container">
						<canvas id="myBarChart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-8 col-lg-6 mb-4">
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
							<div class="container">
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
													<!-- -1: 반려 / 0: 대기(결재진행중) / 1: 승인(결재완료) / 10: 임시저장 -->
													<td id="documentStatus" align="left">
														<c:if test="${doc.dstatus eq -1}">
															<span class="badge rounded-pill bg-danger">반려</span>
														</c:if> 
														<c:if test="${(doc.dstatus eq 0) && (doc.request eq 1)}">
															<span class="badge rounded-pill bg-info">대기</span>
														</c:if> 
														<c:if test="${doc.dstatus eq 1}">
															<span class="badge rounded-pill bg-success">승인</span>
														</c:if> 
														<c:if test="${(doc.request eq 0) && (doc.dstatus eq 0)}">
															<span class="badge rounded-pill bg-warning">임시저장</span>
														</c:if>
													</td>
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

        $(document).ready(function(){
            function loadEvents() {
                $.ajax({
                     url: "showSchedule.scd"
                    ,method: "GET"
                    ,dataType: "json"
                    ,success: function(scheduleJson){
                        calendar.removeAllEvents(); // 모든 기존 일정을 제거
                        calendar.addEventSource(scheduleJson); // 새 일정을 추가
                    }
                    ,error: function(request, status, error){
                        console.error("Error fetching schedule:", error);
                    }
                });
            }
            var calendarEl = document.getElementById('calendar');

            calendar = new FullCalendar.Calendar(calendarEl, {
                 initialDate: '2024-07-16'
                ,initialView: 'dayGridMonth'
                ,headerToolbar: {
                     left: 'prev,next today'
                    ,center: 'title'
                    ,right: 'dayGridMonth,timeGridDay,listWeek'
                }
                ,navLinks: true
                ,editable: true
                ,selectable: true
                ,droppable: true
                ,events: [] // 초기에는 비어있음
                
                ,eventDrop: function(info) {
                    if (confirm("'" + info.event.title + "' 일정을 수정하시겠습니까?")) {
                        
                    	var events = new Array();
                    	var obj = new Object();
                    	
                    	obj.title = info.event._def.title;
                        obj.start = info.event._instance.range.start;
                        obj.end = info.event._instance.range.end;
                        
                        
                        events.push(obj);
                    }else{
                    	location.reload();
                    }
                    	

                        $.ajax({
                            url: "updateSchedule.scd",
                            method: "POST",
                            dataType: "json",
                            data: JSON.stringify(events),
                            contentType: 'application/json',
                        })
                }
                        

                ,select: function(arg) {
                    var title = prompt("일정을 입력해주세요.");
                    if (title) {
                        // 이벤트 객체 생성
                        var events = {
                            title: title,
                            start: arg.start,
                            end: arg.end
                        };

                        // 캘린더에 이벤트 추가
                        calendar.addEvent(events);

                        
                        var events = new Array();
                        var obj = new Object();
                        
                        obj.title= title;
                        obj.start= arg.start;
                        obj.end= arg.end;
                        events.push(obj);
                        
                        
                        // 서버에 이벤트 데이터 전송
                        $.ajax({
                            url: "addSchedule.scd",
                            method: "POST",
                            dataType: "json",
                            data: JSON.stringify(events),
                            contentType: 'application/json',
                            success: function(response) {
                                console.log("이벤트가 성공적으로 추가되었습니다:", response);
                            },
                            error: function(xhr, status, error) {
                                console.error("이벤트 추가 실패:", error);
                            }
                        });

                        // 캘린더 선택 해제
                        calendar.unselect();
                    } else {
                        // 제목이 입력되지 않은 경우 처리
                        
                        calendar.unselect(); // 제목이 없더라도 선택 해제
                    }
                }

               

                ,eventClick: function(info)
                {
                    if (confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")) {
                        // 이벤트를 삭제하는 부분
                        console.log(info.event);
                        
                        var events = new Array();
                        var obj = {
                            title: info.event._def.title,
                            start: info.event._instance.range.start,
                            end: info.event._instance.range.end
                        };
                        events.push(obj);
                        console.log(events);

                        // 서버로 Ajax 요청을 보냄
                        $.ajax({
                            url: "deleteSchedule.scd",
                            method: "POST",
                            dataType: "json",
                            data: JSON.stringify(events), // 배열로 전달
                            contentType: 'application/json',
                        });
                        info.event.remove(); // 클라이언트에서 이벤트 제거
                        loadEvents(); // 페이지 로드 시 일정을 다시 불러옴
                        calendar.render();
                    }
                }
            });
            loadEvents(); // 페이지 로드 시 일정을 불러옴
            calendar.render();
        });

    </script>

<%@ include file="a_bottom.jsp" %>