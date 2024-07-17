
package schedule.controller;

import java.util.HashMap; import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import schedule.model.CalendarDao;

@Controller public class CalendarDeleteController {


	private final String command="scheduleDelete.scd";
	
	@Autowired CalendarDao calendarDao;

	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public Map<String, Object> deleteCalendar(@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "startDate", required = false) String start

			) {
		Map<String, Object> response = new HashMap<String, Object>();

		try {
			int rowsAffected = calendarDao.deleteSchedule(title,start);

			if (rowsAffected > 0) {
				response.put("status", "success");
				response.put("message", "������ ���������� �����Ǿ����ϴ�.");
			} else {
				response.put("status", "fail");
				response.put("message", "������ ������ ã�� �� �����ϴ�.");
			}
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "���� ���� �� ������ �߻��߽��ϴ�: " + e.getMessage());
		}

		return response;
	}


}

