package document.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
}
 