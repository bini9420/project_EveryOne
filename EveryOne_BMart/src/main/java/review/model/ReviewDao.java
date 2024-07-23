package review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.ProductBean;
import model.ReviewBean;


@Component("ReviewDao")
public class ReviewDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "review";
	private String product = "product";
	
	public List<ReviewBean> getReviewsByProduct(int pnum,String id) {
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("pnum", pnum);
	    params.put("id", id);
		return sqlSessionTemplate.selectList(namespace + ".getReviewsByProduct",params);
	}

	public double getAverageScore(int pnum) {
	    Double avgScore = sqlSessionTemplate.selectOne(namespace + ".getAverageScore", pnum);
	    return avgScore != null ? avgScore : 0.0;
	}
	
	public ReviewBean getReview(int rnum) {
        return sqlSessionTemplate.selectOne(namespace + ".getReview", rnum);
    }

    public int deleteReview(int rnum) {
    	int cnt = -1;
        cnt = sqlSessionTemplate.delete(namespace + ".deleteReview", rnum);
        return cnt;
    }

    public void adminDeleteReview(int rnum) {
        sqlSessionTemplate.delete(namespace + ".adminDeleteReview", rnum);
    }

	public List<ReviewBean> getAllReviews(String id) {
		List<ReviewBean> reviews = sqlSessionTemplate.selectList(namespace + ".getAllReviews", id);
		return reviews;
	}
    public int insertReview(ReviewBean rb) {
    	int cnt = -1;
    	cnt = sqlSessionTemplate.insert(namespace+".insertReview", rb);
    	return cnt;
    }
	public ProductBean getProductInfo(int pnum) {
		ProductBean pb = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return pb;
	}
    
    
}
