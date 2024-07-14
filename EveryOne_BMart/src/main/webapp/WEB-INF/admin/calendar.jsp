<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
        let calendar = null;
        let Alldata = {};
        $(function(){

            let calendarEl = $('#calendar')[0];

             calendar = new FullCalendar.Calendar(calendarEl, { 

                expandRows: true, // 화면에 맞게 높이 재설정
                slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                slotMaxTime: '20:00', // Day 캘린더에서 종료 시간

                headerToolbar: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'dayGridMonth'
                },

                initialView: 'dayGridMonth',
                editable: true,
                selectable: true, // 달력 일자 드래그 설정가능
                nowIndicator: true, // 현재 시간 마크
                dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                locale: 'ko', // 한국어 설정
                
                eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                
                	sDate = 
                        obj.event._instance.range["start"].getFullYear() + 
                        '-'+(obj.event._instance.range["start"].getMonth() +1) +
                        '-' +  obj.event._instance.range["start"].getDate();
                	
                	eDate =
                		  obj.event._instance.range["end"].getFullYear() + 
                          '-'+(obj.event._instance.range["end"].getMonth() +1) +
                          '-' +  (obj.event._instance.range["end"].getDate() -1);
                	
                	 Alldata = {
                        "start": sDate,
                        "end": eDate,
                        "title": obj.event._def["title"],
                        "allday": obj.event._def["allDay"],
                        "defId": obj.event._instance["defId"],
                        "instanceId": obj.event._instance["instanceId"]
                    };

                    let allEvent = calendar.getEvents();
                    console.log(allEvent);

                     let jsondata = JSON.stringify(Alldata);
                     console.log("jsondata : " + jsondata);

                     
                },
                eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                    console.log(obj);

                },
                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    console.log(obj);

                },
                 eventClick : function(obj){
                    console.log(obj);

                 },
                select: function(arg) { // 캘린더에서이벤트를 생성
                    let title = prompt('일정 내용을 입력하세요 :');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    }
                    calendar.unselect()
                },
            });
            // 캘린더 랜더링
            calendar.render();

        });

        function allSave() {
        	
			 console.log(allData); */
		document.getElementById("submenu").style.display = "block";

			 
             $.ajax({
                 url: "/calendar.ad",
                 type: "post",
                 data: {addEvent : JSON.stringify(Alldata)},

				 success:function(data, textStatus, xhr){
					 console.log(data);
					 
				 },
				 error:function(xhr, status, error){
					 console.log(error);
				 }
				
				 

             });
        }
        </script>