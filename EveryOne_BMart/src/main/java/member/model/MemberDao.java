package member.model;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("MemberDao")
public class MemberDao {

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	private String namespace = "member.model.Member";
	public MemberBean getMember(String id) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace + ".getMember", id);

		return member;
	}

}