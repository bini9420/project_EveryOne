package document.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import document.model.DocumentBean;
import model.EnterBean;
import utility.Paging;

@Component
public class EnterDao {
	String namespace = "enter";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public String whatEnumber() {
		String maxNum = "0";
		if(sqlSessionTemplate.selectOne(namespace + ".whatEnumber") == null) {
			maxNum = "0";
		} else {
			maxNum = sqlSessionTemplate.selectOne(namespace + ".whatEnumber"); 
		}
		return maxNum; 
	}

	public int insertEnter(EnterBean enter) {
		int cnt = -1;
		sqlSessionTemplate.insert(namespace + ".insertEnter", enter);
		
		return cnt;
	}//insertEnter

	public int checkEnter(String id) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".checkEnter", id);
		
		return count;
	}//getEnter

	public void deleteEnter(String eno) {
		sqlSessionTemplate.delete(namespace + ".deleteEnter", eno);
	}//deleteEnter

	//★ 관리자용 결재함 > 입점신청함
	public List<DocumentBean> getAllEnterDocumentForAdmin(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>(); 
		lists = sqlSessionTemplate.selectList(namespace + ".getAllEnterDocumentForAdmin", map, rowBounds);
		
		return lists;	
	}//getAllEnterDocumentForAdmin

	
	//★ 관리자용 입점신청문서 개수 구하기 
	public int getEnterTotalCountForAdmin(Map<String, String> map) {
		int totalCount = -100;  
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getEnterTotalCountForAdmin", map);
		
		return totalCount;
	}//getEnterTotalCountForAdmin

	public EnterBean getEnterByEno(String eno) {
		EnterBean list = sqlSessionTemplate.selectOne(namespace + ".getEnterByEno", eno);
		
		return list;
	}//getEnterByEno

	public void updateApproval(String eno) {
		sqlSessionTemplate.update(namespace + ".updateApproval", eno);
	}//updateApproval

	public void updateReason(Map<String, String> map) {
		sqlSessionTemplate.update(namespace + ".updateReason", map);
	}//updateReason

	public void insertBusiness(EnterBean eb) {
		sqlSessionTemplate.insert(namespace + ".insertBusiness", eb);
	}//insertBusiness
}
 