package schedule.model;

import java.util.ArrayList;
import java.util.List;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mall.model.ProductBean;


@Repository
public class CalendarDao {
	
	

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "schedule";
	
	public List<CalendarBean> showSchedule(){
		List<CalendarBean> slists = new ArrayList<CalendarBean>();
	  slists=sqlSessionTemplate.selectList(namespace + ".showSchedule");
	  return slists;
	}
	public void addSchedule(CalendarBean cb) {
		sqlSessionTemplate.insert(namespace+".addSchedule",cb);
	}
	public int deleteSchedule(String title) {        
		
		int cnt=-1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteSchedule",title);
		return cnt;
	}
}

