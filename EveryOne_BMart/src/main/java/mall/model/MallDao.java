package mall.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MallDao {

	public MallDao() {
		System.out.println("MallDao()");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String category = "category.Category";
	private String product = "product.Product";
	private String watch = "watch.Watch";
	private String interest = "interest.Interest";
	
	public List<CategoryBean> getAllCategory() {
		List<CategoryBean> categoryLists = new ArrayList<CategoryBean>();
		categoryLists = sqlSessionTemplate.selectList(category+".getAllCategory");
		return categoryLists;
	}

	public List<ProductBean> getBestProduct() {
		List<ProductBean> bestProducts = new ArrayList<ProductBean>();
		bestProducts = sqlSessionTemplate.selectList(product+".getBestProduct");
		return bestProducts;
	}

	public List<WatchBean> getWatchLists(String id) {
		List<WatchBean> watchLists = new ArrayList<WatchBean>();
		watchLists = sqlSessionTemplate.selectList(watch+".getWatchLists", id);
		return watchLists;
	}

	public ProductBean getWatchProductInfo(int pnum) {
		ProductBean watchProductInfo = new ProductBean();
		watchProductInfo = sqlSessionTemplate.selectOne(product+".getWatchProductInfo", pnum);
		return watchProductInfo;
	}

	public List<InterestBean> getInterestLists(String id) {
		List<InterestBean> interestLists = new ArrayList<InterestBean>();
		interestLists = sqlSessionTemplate.selectList(interest+".getInterestLists", id);
		return interestLists;
	}

	public InterestBean getInterestProductInfo(int pnum) {
		InterestBean interestProductInfo = new InterestBean();
		interestProductInfo = sqlSessionTemplate.selectOne(product+".getInterestProductInfo", pnum);
		return interestProductInfo;
	}

	
}
