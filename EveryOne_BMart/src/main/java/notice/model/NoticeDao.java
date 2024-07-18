package notice.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.NoticeBean;
import utility.Paging;

@Component("NoticeDao")
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "notice.model.Notice";

	public int getNoticeCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".getNoticeCount",map);
		return cnt;
	}
	

	public List<NoticeBean> getNotice(Map<String, String> map, Paging pageInfo) {
		List<NoticeBean> lists = new ArrayList<NoticeBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
        lists = sqlSessionTemplate.selectList(namespace + ".getNotice", map, rowBounds);
        return lists;
	}
	
	public List<NoticeBean> getNoticeY(Map<String, String> map) {
		List<NoticeBean> lists2 = new ArrayList<NoticeBean>();
		lists2 = sqlSessionTemplate.selectList(namespace + ".getNoticeY", map);
		return lists2;
	}

	public int getReadCount(int nnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".getReadCount",nnum);
		return cnt;
	}


	public int updateReadCount(int readcount) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateReadCount",readcount);
		return cnt;
	}

	public NoticeBean viewContent(int nnum) {
		NoticeBean nb = new NoticeBean();
		nb = sqlSessionTemplate.selectOne(namespace + ".viewContent", nnum);
		return nb;
	}


	public int insertNotice(NoticeBean notice) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertNotice", notice);
		return cnt;
	}

	public int deleteNotice(int nnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteNotice", nnum);
		return cnt;
	}

	public int updateNotice(NoticeBean nb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateNotice", nb);
		return cnt;
	}
	

}
