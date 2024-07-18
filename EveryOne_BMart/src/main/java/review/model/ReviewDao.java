package review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.ReviewBean;


@Component("ReviewDao")
public class ReviewDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "review";
	
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
    
    
}
