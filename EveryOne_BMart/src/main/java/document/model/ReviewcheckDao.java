package document.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class ReviewcheckDao {

	String namespace = "document.Document";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertReviewCheck(ReviewcheckBean reviewcheck) {
		sqlSessionTemplate.insert(namespace + ".insertReviewCheck", reviewcheck);
	}

	public String whatRnumber() {
		String maxNum = "0";
		if(sqlSessionTemplate.selectOne(namespace + ".whatRnumber") == null) {
			System.out.println("Ã¹¹øÂ°");
			maxNum = "0";
		} else {
			maxNum = sqlSessionTemplate.selectOne(namespace + ".whatRnumber"); 
		}
		return maxNum; 
	}

	public int getRTotalCount(Map<String, String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getRTotalCount", map);
		
		return totalCount;
	}//getRTotalCount

	public List<ReviewcheckBean> getAllReviewCheck(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ReviewcheckBean> lists = new ArrayList<ReviewcheckBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllReviewCheck", map, rowbounds);
		
		return lists;
	}//getAllReviewCheck
}
