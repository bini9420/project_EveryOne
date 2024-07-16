package admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberBean;

@Service
public class AdminDao {
	
	private String namespace = "member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(namespace + ".getMember", id);
		
		return mb;
	}//getMember

	
	//★ 결재대기중인 문서의 전체 개수 구하기
	public int getWaitDocumentCountForAdmin() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitDocumentCountForAdmin");
		
		return count;
	}//getWaitDocumentCountForAdmin
	
}
