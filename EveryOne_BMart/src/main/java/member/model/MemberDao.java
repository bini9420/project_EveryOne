package member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.MemberListPaging;


@Component("MemberDao")
public class MemberDao {


	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	private String namespace = "member";
	public MemberBean getMember(String id) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace + ".getMember", id);

		return member;
	}//getMember






	public int getTotalCount(Map<String,String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
		return cnt;
	}//getTotalCount

	public List<MemberBean> getMemberList(Map<String,String> map, MemberListPaging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace + ".getMemberList", map, rowbounds);
	}
	public List<BusinessBean> getBMemList(Map<String,String> map, MemberListPaging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace + ".getBMemList", map, rowbounds);
	}


	public int insertBMember(BusinessBean business) {
		int cnt = -1;

		cnt = sqlSessionTemplate.insert(namespace+".insertBMember",business);

		return cnt;
	}//insertMember


	public int deleteMember(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".deleteMember", id);
		System.out.println("deleteMember cnt:"+cnt);
		return cnt;

	}//deleteMember


	
 }



