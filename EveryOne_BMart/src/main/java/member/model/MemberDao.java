package member.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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

	
/*
	public int updateMember(MemberBean mb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateMember",mb);
		return cnt;

	}//updateMember

	public int updateMpoint(String id, int point) {
		int cnt = -1;
		MemberBean mbean = new MemberBean();
		mbean.setId(id);
		mbean.setMpoint(point);

		cnt = sqlSessionTemplate.update(namespace+".updateMpoint", mbean);
		return cnt;
	}//updateMpoint
*/}
	
	
	
