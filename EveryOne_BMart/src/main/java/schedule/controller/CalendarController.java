package schedule.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import schedule.model.CalendarBean;
import schedule.model.CalendarDao;
  
@Controller
 
public class CalendarController {

    @Autowired 
    private CalendarDao calendarDao;
    
    private final String getPage="redirect:/showSchedule.scd";

    @RequestMapping(value="showSchedule.scd", produces="application/json")
    @ResponseBody
    public List<Map<String, Object>> getSchedule() {
        List<CalendarBean> scheduleList = calendarDao.showSchedule();
        List<Map<String, Object>> scheduleArray = new ArrayList<Map<String, Object>>();

        for (CalendarBean cb : scheduleList) {
            Map<String, Object> event = new HashMap<String, Object>();
            event.put("title", cb.getTitle());
            event.put("start", cb.getStartDate());
            event.put("end", cb.getEndDate());
            scheduleArray.add(event);
        }

        return scheduleArray;
    }

    @RequestMapping(value="addSchedule.scd", consumes = "application/json", produces = "application/json")
    public String addEvent(@RequestBody List<Map<String, Object>> events) {
       
            for (Map<String, Object> event : events) {
                String title = (String) event.get("title");
                String start = ((String) event.get("start")).substring(0,10);
                String end = ((String) event.get("end")).substring(0,10);

                CalendarBean calendarBean = new CalendarBean();
                calendarBean.setTitle(title);
                calendarBean.setStartDate(start);
                calendarBean.setEndDate(end);

                calendarDao.addSchedule(calendarBean);
            }
                return getPage;
            }
    

    @RequestMapping(value="updateSchedule.scd", consumes = "application/json", produces = "application/json")
    public String updateEvent(@RequestBody List<Map<String, Object>> events) {
      
            for (Map<String, Object> event : events) {
                String title = (String) event.get("title");
                String start = ((String) event.get("start")).substring(0,10);
                String end = ((String) event.get("end")).substring(0,10);
                
                CalendarBean calendarBean = new CalendarBean();
                calendarBean.setTitle(title);
                calendarBean.setStartDate(start);
                calendarBean.setEndDate(end);
                calendarDao.updateSchedule(calendarBean);
            }
            return getPage;
    }
 
        @RequestMapping(value="deleteSchedule.scd", consumes = "application/json", produces = "application/json")
        public String deleteEvent(@RequestBody List<Map<String, Object>> events) {
            for (Map<String, Object> event : events) {
                String title = (String) event.get("title");
                String start = ((String) event.get("start")).substring(0, 10);

                calendarDao.deleteSchedule(title, start);
            }
            return getPage;
        }
    }
