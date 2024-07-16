package admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberBean;

@Service
public class AdminDao {

	public AdminDao() {
		System.out.println("AdminDao()");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String member = "member";
	
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(member + ".getMember", id);
		return mb;
	}
	
}
