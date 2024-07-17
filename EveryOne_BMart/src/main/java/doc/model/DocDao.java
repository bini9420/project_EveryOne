package doc.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.MemberListPaging;


@Component
public class DocDao {

	String namespace = "doc";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<DocBean> getDocumentList() {
		
		
		List<DocBean> lists = new ArrayList<DocBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAdminDocument");
		
		System.out.println("Dao에서 list개수: " + lists.size());
		return lists;
	}//getAllDocument




}