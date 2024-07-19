package review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mall.model.ProductBean;


@Component("ReviewDao")
public class ReviewDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "review.model.Review";
	private String product = "product";
	
	public List<ReviewBean> getReviewsByProduct(int pnum) {
		return sqlSessionTemplate.selectList(namespace + ".getReviewsByProduct",pnum);
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
    
    public int insertReview(ReviewBean rb) {
    	int cnt = -1;
    	cnt = sqlSessionTemplate.insert(namespace+".insertReview", rb);
    	return cnt;
    }
    
	//상품 정보 조회
	public ProductBean getProductInfo(int pnum) {
		ProductBean pb = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return pb;
	}
    
    
    
}
