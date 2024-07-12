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

	public void insertReviewCheck(ReviewcheckBean reviewcheck) {//리뷰검토 문서 insert
		sqlSessionTemplate.insert(namespace + ".insertReviewCheck", reviewcheck);
	}//insertReviewCheck

	public String whatRnumber() { //리뷰검토 문서번호 설정(레코드의 rownum으로 마지막에 등록된 번호 알아오기)
		String maxNum = "0";
		if(sqlSessionTemplate.selectOne(namespace + ".whatRnumber") == null) {
			maxNum = "0";
		} else {
			maxNum = sqlSessionTemplate.selectOne(namespace + ".whatRnumber"); 
		}
		return maxNum; 
	}//whatRnumber

	public int getRTotalCount(Map<String, String> map) { //리뷰검토문서 전체 개수
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

	public ReviewcheckBean getRcheckByRnum(String rnum) {
		ReviewcheckBean rcheck = null;
		rcheck = sqlSessionTemplate.selectOne(namespace + ".getRcheckByRnum", rnum);
		
		return rcheck;
	}//getRcheckByRnum

	public void deleteReviewCheck(String rnum) {
		sqlSessionTemplate.delete(namespace + ".deleteReviewCheck", rnum);
	}//deleteReviewCheck

	public void tempSaveRCheck(ReviewcheckBean reviewcheck) {
		sqlSessionTemplate.insert(namespace + ".tempSaveRCheck", reviewcheck);
	}//tempSaveRCheck
}
