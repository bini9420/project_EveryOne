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
    private SqlSessionTemplate sqlSessionTemplate;

    private final String namespace = "schedule";

    public List<CalendarBean> showSchedule() {
        return sqlSessionTemplate.selectList(namespace + ".showSchedule");
    }

    public int addSchedule(CalendarBean calendarBean) {
        return sqlSessionTemplate.insert(namespace + ".addSchedule", calendarBean);
    }

    public int deleteSchedule(String title, String startDate) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("title", title);
        params.put("startDate", startDate);
        return sqlSessionTemplate.delete(namespace + ".deleteSchedule", params);
    }

    public int updateSchedule(CalendarBean calendarBean) {
        return sqlSessionTemplate.update(namespace + ".updateSchedule", calendarBean);
    }
}
