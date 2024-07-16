package schedule.controller;




import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import schedule.model.CalendarBean;
import schedule.model.CalendarDao;



@Service
public class ScheduleService {
	
	@Inject
	private CalendarDao cdao;
	
	
	public List<CalendarBean> showSchedule(){
		return cdao.showSchedule();
	}
	
	public void addSchedule(CalendarBean cb) {
		cdao.addSchedule(cb);
	}
	
}
