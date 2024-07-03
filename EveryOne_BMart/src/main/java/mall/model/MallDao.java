package mall.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utility.Paging;

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

	public ProductBean getProductInfo(int pnum) {
		ProductBean productInfo = new ProductBean();
		productInfo = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return productInfo;
	}

	public List<InterestBean> getInterestLists(String id) {
		List<InterestBean> ilists = new ArrayList<InterestBean>();
		ilists = sqlSessionTemplate.selectList(interest+".getInterestLists", id);
		return ilists;
	}

	public List<ProductBean> getProductByCategory(String category) {
		List<ProductBean> plists = new ArrayList<ProductBean>();
		plists = sqlSessionTemplate.selectList(product+".getProductByCategory", category);
		return plists;
	}

	public int getTotalCount(SearchBean sb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(product+".getTotalCount", sb);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	public List<ProductBean> getProductRange(SearchBean sb, Paging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> plistsRange = new ArrayList<ProductBean>();
		plistsRange = sqlSessionTemplate.selectList(product+".getProductRange", sb, rb);
		System.out.println("plistsRange.size: "+plistsRange.size());
		return plistsRange;
	}

}
