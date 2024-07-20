package document.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.ProductBean;
import model.ReviewBean;
import model.ReviewcheckBean;
import utility.Paging;

@Component
public class ReviewcheckDao {

	String namespace = "reviewCheck";
	
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
		System.out.println("rcheck: " + rcheck);
		return rcheck;
	}//getRcheckByRnum

	public void deleteReviewCheck(String rnum) {
		sqlSessionTemplate.delete(namespace + ".deleteReviewCheck", rnum);
	}//deleteReviewCheck

	public void tempSaveRCheck(ReviewcheckBean reviewcheck) {
		sqlSessionTemplate.insert(namespace + ".tempSaveRCheck", reviewcheck);
	}//tempSaveRCheck

	public void updateApproval(String rnum) {
		sqlSessionTemplate.update(namespace + ".updateApproval", rnum);
	}//updateApproval

	public void updateReason(Map<String, String> map) {
		sqlSessionTemplate.update(namespace + ".updateReason", map);
	}//updateReason

	public int getRcheckTotalCountForAdmin(Map<String, String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getRcheckTotalCountForAdmin", map);
		
		return totalCount;
	}//getRcheckTotalCountForAdmin

	public List<ReviewcheckBean> getAllRcheckDocumentForAdmin(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ReviewcheckBean> lists = new ArrayList<ReviewcheckBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllRcheckDocumentForAdmin", map, rowbounds);
		
		return lists; 
	}//getAllRcheckDocumentForAdmin

	public ReviewBean getReview(String rnum) {
		ReviewBean rb = sqlSessionTemplate.selectOne(namespace + ".getReview", rnum);
		
		return rb;
	}//getReview

	public void insertRcheck(Map<String, String> map) {
		sqlSessionTemplate.insert(namespace + ".insertRcheck", map);
	}//insertRcheck

	public String whatRcheckNumber() {
		String maxNum = "0";
		if(sqlSessionTemplate.selectOne(namespace + ".whatRcheckNumber") == null) {
			maxNum = "0";
		} else {
			maxNum = sqlSessionTemplate.selectOne(namespace + ".whatRcheckNumber"); 
		}
		return maxNum; 
	}//whatRcheckNumber

	public void deleteReview(Map<String, String> map) {
		int count = sqlSessionTemplate.delete(namespace + ".deleteReview", map);
		//System.out.println("count: " + count);
	}//deleteReview

	public ProductBean getProductName(String pnum) {
		ProductBean pb = sqlSessionTemplate.selectOne(namespace + ".getProductName", pnum);
		
		return pb;
	}//getProductName

}
