package document.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StateDao {
	
	String namespace = "state.State";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public StateDao( ) {
		System.out.println("StateDao()");
	}//»ý¼ºÀÚ
}
