package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doc.model.DocBean;
import model.MemberBean;

@Service
public class AdminDao {
	
	private String namespace = "admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(namespace + ".getMember", id);
		
		return mb;
	}//getMember
	
	public List<DocBean> getDocumentList() {
		List<DocBean> lists = new ArrayList<DocBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAdminDocument");
		
		System.out.println("Dao에서 list개수: " + lists.size());
		return lists;
	}//getAllDocument
	
	//★ 결재대기중인 일반문서의 전체 개수 구하기
	public int getWaitDocumentCountForAdmin() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitDocumentCountForAdmin");
		System.out.println("wait count: "+count);
		return count;
	}//getWaitDocumentCountForAdmin


	//★ 결재대기중인 입점요청의 전체 개수 구하기
	public int getWaitEnterCountForAdmin() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitEnterCountForAdmin");
		
		return count;
	}//getWaitEnterCountForAdmin


	public int getAllMemberCount() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getAllMemberCount");
		
		return count;
	}//getAllMemberCount


	public int getAllProductCount() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getAllProductCount");
		
		return count;
	}//getAllProductCount

}
