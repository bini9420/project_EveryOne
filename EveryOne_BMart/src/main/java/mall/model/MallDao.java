package mall.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.CategoryBean;
import model.InterestBean;
import model.ProductBean;
import model.ReviewDetailBean;
import model.SearchBean;
import model.WatchBean;
import utility.MallPaging;
import utility.ReviewPaging;

@Component("mall")
public class MallDao {

	public MallDao() {
		System.out.println("MallDao()");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String category = "category";
	private String product = "product";
	private String watch = "watch";
	private String interest = "interest";
	private String cart = "cart";
	private String review = "review";
	private String reviewDetail = "reviewDetail";
	
	//ī�װ� ����
	public List<CategoryBean> getAllCategory() {
		List<CategoryBean> categoryLists = new ArrayList<CategoryBean>();
		categoryLists = sqlSessionTemplate.selectList(category+".getAllCategory");
		return categoryLists;
	}
	
	//�α������ ����
	public List<ProductBean> getBestProduct() {
		List<ProductBean> bestProduct = new ArrayList<ProductBean>();
		bestProduct = sqlSessionTemplate.selectList(product+".getBestProduct");
		return bestProduct;
	}
	
	//��ǰ ���� ��ȸ
	public ProductBean getProductInfo(int pnum) {
		ProductBean prd = null;
		prd = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return prd;
	}
	
	//�ֱ� �� ��ǰ ���
	public List<ProductBean> getWatchLists(String id) {
		System.out.println("watchLists id : "+id);
		List<ProductBean> wlists = new ArrayList<ProductBean>();
		wlists = sqlSessionTemplate.selectList(product+".getWatchLists", id);
		return wlists;
	}
	
	//�ֱ� �� ��ǰ ���������� ��� ��ȸ - ���� ����
	public List<ProductBean> getWatch(SearchBean sb, MallPaging pageInfo) { 
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ProductBean> wlists = new ArrayList<ProductBean>(); 
		wlists = sqlSessionTemplate.selectList(product+".getWatch", sb, rb);
		return wlists; 
	}

	//���� ��ǰ- main session
	public List<ProductBean> getInterestLists(String id) {
		System.out.println("interestLists id : "+id);
		List<ProductBean> interestLists = new ArrayList<ProductBean>();
		interestLists = sqlSessionTemplate.selectList(product+".getInterestLists", id);
		return interestLists;
	}
	
	//���� ��ǰ ���������� ��� ��ȸ - ���� ����
	public List<ProductBean> getInterest(SearchBean sb, MallPaging pageInfo) { 
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ProductBean> ilists = new ArrayList<ProductBean>(); 
		ilists = sqlSessionTemplate.selectList(product+".getInterest", sb, rb);
		return ilists; 
	}
	

	//ī�װ��� ��ǰ ��� ��
	public int getTotalCount(SearchBean sb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(product+".getTotalCount", sb);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	public List<ProductBean> getProductRange(SearchBean sb, MallPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> plistsRange = new ArrayList<ProductBean>();
		plistsRange = sqlSessionTemplate.selectList(product+".getProductRange", sb, rb);
		System.out.println("plistsRange.size: "+plistsRange.size());
		return plistsRange;
	}
	
	//��ٱ��Ͽ� ���
	public int insertCart(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(cart+".insertCart",map);
		return cnt;
	}

	//��ٱ��Ͽ� �̹� ���� �� ���� ����
	public int getCart(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(cart+".getCart", map);
		return cnt;
	}

	public int updateCart(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(cart+".updateCart", map);
		return cnt;
	}

	//��ٱ��Ͽ� ��� ����
	public int getCartTotalCount(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(cart+".getCartTotalCount", id);
		return cnt;
	}

	//id, pnum���� watch ��ȸ
	public int getWatch(WatchBean wb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(watch+".getWatch",wb);
		return cnt;
	}

	public void insertWatch(WatchBean wb) {
		sqlSessionTemplate.insert(watch+".insertWatch", wb);
	}

	public void updateWatch(WatchBean wb) {
		sqlSessionTemplate.update(watch+".updateWatch", wb);
	}
	
	//�Ż�ǰ ��ȸ
	public int getNewProductCount(SearchBean sb) {
		int cnt= -1;
		cnt = sqlSessionTemplate.selectOne(product+".getNewProductCount", sb);
		return cnt;
	}

	public List<ProductBean> getNewProductRange(SearchBean sb, MallPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> newRange = new ArrayList<ProductBean>();
		newRange = sqlSessionTemplate.selectList(product+".getNewProductRange", sb, rb);
		System.out.println("newRange.size: "+newRange.size());
		return newRange;
	}

	//�˻��� ��ȸ
	public int getKeywordCount(SearchBean sb) {
		//System.out.println("searchKeyword: "+sb.getKeyword());
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(product+".getKeywordCount", sb);
		//System.out.println("keyword cnt: "+cnt);
		return cnt;
	}

	public List<ProductBean> getKeywordRange(SearchBean sb, MallPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> keyProduct = new ArrayList<ProductBean>();
		keyProduct = sqlSessionTemplate.selectList(product+".getKeywordRange", sb, rb);
		//System.out.println("keyProduct.size: "+keyProduct.size());
		return keyProduct;
	}
	
	//�� ��ǰ �߰� �� ����
	public void deleteInterest(InterestBean ib) {
		sqlSessionTemplate.delete(interest+".deleteInterest", ib);
	}

	public void insertInterest(InterestBean ib) {
		sqlSessionTemplate.insert(interest+".insertInterest", ib);
	}
	
	//��ǰ ���� ���� ��ȸ
	public int getReviewDetailCount(SearchBean sb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(reviewDetail+".getReviewDetailCount",sb);
		return cnt;
	}
	
	//���� ��� ��ȸ
	public List<ReviewDetailBean> getReviewDetail(SearchBean sb, ReviewPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ReviewDetailBean> rdetail = new ArrayList<ReviewDetailBean>();
		rdetail = sqlSessionTemplate.selectList(reviewDetail+".getReviewDetail", sb, rb);
		return rdetail;
	}
	
	//���� �� ���� ��ȸ
	public int getReviewTotalCount(int pnum) {
		int rcount = -1;
		rcount = sqlSessionTemplate.selectOne(review+".getReviewTotalCount", pnum);
		return rcount;
	}

}
