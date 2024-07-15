package schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import schedule.model.CalendarBean;
import schedule.model.CalendarDao;

@Controller
public class CalendarController {

	
	  private final String command="schedule.scd"; 
	  private final String getPage="a_main";
	  
	  
	  @Autowired CalendarDao calendarDao;
	  
	
	  
	  @ResponseBody
	  
	  @RequestMapping(value=command, method=RequestMethod.POST) //ajax 데이터 전송 URL
	  public String addCalendar(Model model,HttpServletRequest request){
		  
			List<CalendarBean> calendar = calendarDao.showSchedule();
			request.setAttribute("calendarList", calendar);
			
			
			return getPage;
			
			
	  }
		  
		  
		  
	  }
	  /*
		  List<CalendarBean> scheduleList = calendarDao.showSchedule();
		  
		  
		  Gson gson = new Gson();
		  JsonArray scheduleArr = new JsonArray();
		  
	
	  
	  
	  for(CalendarBean cb : scheduleList) {
		  
		  JsonObject object = new JsonObject();
			object.addProperty("title", cb.getTitle());
			object.addProperty("start", cb.getStartDate());
			scheduleArr.add(object);
	  }
		 
	 String scheduleJson = gson.toJson(scheduleArr);
	 model.addAttribute("scheduleJson",scheduleJson);
	  
	 
	 return getPage;
	 
	  }
	  
	 
}
*/

/*
 * 
 * @RequestMapping(value=command, method=RequestMethod.POST) //ajax 데이터 전송 URL
 * public Map<Object, Object> addCalendar(CalendarBean cb){
 * 
 * Map<Object,Object>map = new HashMap<Object,Object>();
 * 
 * calendarDao.addSchedule(cb);
 * 
 * return map; }
 * 
 * @RequestMapping(value=command) public String schecule(Model model) {
 * model.addAttribute("showSchedule",calendarDao.showSchedule()); return
 * "schedule"; }
 */
