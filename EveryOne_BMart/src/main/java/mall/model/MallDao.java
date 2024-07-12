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
	
	//카테고리 띄우기
	public List<CategoryBean> getAllCategory() {
		List<CategoryBean> categoryLists = new ArrayList<CategoryBean>();
		categoryLists = sqlSessionTemplate.selectList(category+".getAllCategory");
		return categoryLists;
	}
	
	//인기순으로 정렬
	public List<ProductBean> getBestProduct() {
		List<ProductBean> bestProduct = new ArrayList<ProductBean>();
		bestProduct = sqlSessionTemplate.selectList(product+".getBestProduct");
		return bestProduct;
	}
	
	//상품 정보 조회
	public ProductBean getProductInfo(int pnum) {
		ProductBean prd = null;
		prd = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return prd;
	}
	
	//최근 본 상품 목록
	public List<ProductBean> getWatchLists(String id) {
		System.out.println("watchLists id : "+id);
		List<ProductBean> wlists = new ArrayList<ProductBean>();
		wlists = sqlSessionTemplate.selectList(product+".getWatchLists", id);
		return wlists;
	}
	
	//최근 본 상품 페이지에서 목록 조회 - 정렬 가능
	public List<ProductBean> getWatch(SearchBean sb, MallPaging pageInfo) { 
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ProductBean> wlists = new ArrayList<ProductBean>(); 
		wlists = sqlSessionTemplate.selectList(product+".getWatch", sb, rb);
		return wlists; 
	}

	//찜한 상품- main session
	public List<ProductBean> getInterestLists(String id) {
		System.out.println("interestLists id : "+id);
		List<ProductBean> interestLists = new ArrayList<ProductBean>();
		interestLists = sqlSessionTemplate.selectList(product+".getInterestLists", id);
		return interestLists;
	}
	
	//찜한 상품 페이지에서 목록 조회 - 정렬 가능
	public List<ProductBean> getInterest(SearchBean sb, MallPaging pageInfo) { 
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ProductBean> ilists = new ArrayList<ProductBean>(); 
		ilists = sqlSessionTemplate.selectList(product+".getInterest", sb, rb);
		return ilists; 
	}
	

	//카테고리별 상품 띄울 때
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
	
	//장바구니에 담기
	public int insertCart(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(cart+".insertCart",map);
		return cnt;
	}

	//장바구니에 이미 있을 때 개수 수정
	public int getCart(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(cart+".getCart", map);
		return cnt;
	}

	public int updateCart(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(cart+".updateCart", map);
		return cnt;
	}

	//장바구니에 담긴 개수
	public int getCartTotalCount(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(cart+".getCartTotalCount", id);
		return cnt;
	}

	//id, pnum으로 watch 조회
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
	
	//신상품 조회
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

	//검색어 조회
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
	
	//찜 상품 추가 및 삭제
	public void deleteInterest(InterestBean ib) {
		sqlSessionTemplate.delete(interest+".deleteInterest", ib);
	}

	public void insertInterest(InterestBean ib) {
		sqlSessionTemplate.insert(interest+".insertInterest", ib);
	}
	
	//상품 리뷰 개수 조회
	public int getReviewDetailCount(SearchBean sb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(reviewDetail+".getReviewDetailCount",sb);
		return cnt;
	}
	
	//리뷰 목록 조회
	public List<ReviewDetailBean> getReviewDetail(SearchBean sb, ReviewPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ReviewDetailBean> rdetail = new ArrayList<ReviewDetailBean>();
		rdetail = sqlSessionTemplate.selectList(reviewDetail+".getReviewDetail", sb, rb);
		return rdetail;
	}
	
	//리뷰 총 개수 조회
	public int getReviewTotalCount(int pnum) {
		int rcount = -1;
		rcount = sqlSessionTemplate.selectOne(review+".getReviewTotalCount", pnum);
		return rcount;
	}

}
