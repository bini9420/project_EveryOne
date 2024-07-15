package notice.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("DescriptionDao")
public class DescriptionDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "notice.model.Notice";

	public int getDesCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".getDesCount",map);
		return cnt;
	}

	public List<DescriptionBean> getDes(Map<String, String> map, Paging pageInfo) {
		List<DescriptionBean> dlists = new ArrayList<DescriptionBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		dlists = sqlSessionTemplate.selectList(namespace+".getDes",map,rowBounds);
		return dlists;
	}

	public int insertDes(DescriptionBean db) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertDes",db);
		return cnt;
	}

	public DescriptionBean viewDes(int dnum) {
		DescriptionBean db = new DescriptionBean();
		db = sqlSessionTemplate.selectOne(namespace+".viewDes",dnum);
		return db;
	}
	
	public int deleteDes(int dnum, String password) {
		int cnt = -1;
		String pw = sqlSessionTemplate.selectOne(namespace + ".selectPassword", dnum);
		if (pw != null && pw.equals(password)) {
			cnt = sqlSessionTemplate.delete(namespace + ".deleteDes", dnum);
		} else {
			cnt = 0;
		}
		return cnt;
	}

	public int updateDes(DescriptionBean db) {
		int cnt = -1;
		String pw = sqlSessionTemplate.selectOne(namespace + ".selectPassword", db.getDnum());
		if (pw != null && pw.equals(db.getPassword())) {
			cnt = sqlSessionTemplate.update(namespace + ".updateDes", db);
		} else {
			cnt = 0;
		}
		return cnt;
	}

	public int deleteAdmin(int dnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteAdmin",dnum);
		return cnt;
	}

	public int updateReplyStep(Map<String, Integer> map) {
		int cnt = -1;
		sqlSessionTemplate.update(namespace + ".updateReplyStep", map);
		return cnt;
	}

	public int replyDes(DescriptionBean db) {
		int cnt = -1;
        cnt = sqlSessionTemplate.insert(namespace + ".replyDes", db);
		return cnt;
	}

}
