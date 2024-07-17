package schedule.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    
    private String namespace = "schedule";
    
    public List<CalendarBean> showSchedule() {
        return sqlSessionTemplate.selectList(namespace + ".showSchedule");
    }
    
    public void addSchedule(CalendarBean calendarBean) {
        sqlSessionTemplate.insert(namespace + ".addSchedule", calendarBean);
    }
    
    public int deleteSchedule(String title, String start) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("title", title);
        params.put("start", start);
        return sqlSessionTemplate.delete(namespace + ".deleteSchedule", params);
    }
    
    public int updateSchedule(CalendarBean calendarBean) {
        return sqlSessionTemplate.update(namespace + ".updateSchedule", calendarBean);
    }
}