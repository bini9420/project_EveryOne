package schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import schedule.model.CalendarBean;
import schedule.model.CalendarDao;

@Controller
@RequestMapping("/schedule")
public class CalendarController {
	
	@Autowired 
    private CalendarDao calendarDao;

	@RequestMapping(value="/showSchedule", method=RequestMethod.POST)
    public ResponseEntity<List<CalendarBean>> getSchedule() {
        List<CalendarBean> scheduleList = calendarDao.showSchedule();
        return new ResponseEntity<List<CalendarBean>>(scheduleList, HttpStatus.OK);
    }

	@RequestMapping(value="/addSchedule", method=RequestMethod.POST)
	public ResponseEntity<String> addEvent(@RequestBody List<Map<String, Object>> events) {
		try {
			for (Map<String, Object> event : events) {
				String title = (String) event.get("title");
				String start = (String) event.get("start");
				String end = (String) event.get("end");

                CalendarBean calendarBean = new CalendarBean();
                calendarBean.setTitle(title);
                calendarBean.setStartDate(start);
                calendarBean.setEndDate(end);
                calendarDao.addSchedule(calendarBean);
            }
            return new ResponseEntity<String>("Event added successfully", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("Error adding event: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
		

	@RequestMapping(value="/updateSchedule", method=RequestMethod.POST)
	public ResponseEntity<String> updateEvent(@RequestBody List<Map<String, Object>> events) {
		try {
			for (Map<String, Object> event : events) {
				String title = (String) event.get("title");
				String start = (String) event.get("start");
				String end = (String) event.get("end");

                CalendarBean calendarBean = new CalendarBean();
                calendarBean.setTitle(title);
                calendarBean.setStartDate(start);
                calendarBean.setEndDate(end);
                calendarDao.updateSchedule(calendarBean);
            }
            return new ResponseEntity<String>("Event updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("Error updating event: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
				

	@RequestMapping(value="/deleteSchedule", method=RequestMethod.POST)
	public ResponseEntity<String> deleteEvent(@RequestBody List<Map<String, Object>> events) {
		try {
			for (Map<String, Object> event : events) {
				String title = (String) event.get("title");
				String start = (String) event.get("start");

                calendarDao.deleteSchedule(title, start);
            }
            return new ResponseEntity<String>("Event deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("Error deleting event: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
 