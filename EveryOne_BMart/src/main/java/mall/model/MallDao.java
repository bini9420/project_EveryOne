package mall.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	private String watch = "watch";
	private String interest = "interest.Interest";
	private String cart = "cart.Cart";
	private String address = "address.Address";
	
	//ī�װ� ����
	public List<CategoryBean> getAllCategory() {
		List<CategoryBean> categoryLists = new ArrayList<CategoryBean>();
		categoryLists = sqlSessionTemplate.selectList(category+".getAllCategory");
		return categoryLists;
	}
	
	//�α������ ����
	public List<ProductBean> getBestProductByBmart() {
		List<ProductBean> bMartBestProducts = new ArrayList<ProductBean>();
		bMartBestProducts = sqlSessionTemplate.selectList(product+".getBestProductByBmart");
		return bMartBestProducts;
	}
	
	//�ֱ� �� ��ǰ ���
	public List<WatchBean> getWatchLists(String id) {
		System.out.println("watchLists id : "+id);
		List<WatchBean> wlists = new ArrayList<WatchBean>();
		wlists = sqlSessionTemplate.selectList(watch+".getWatchLists", id);
		return wlists;
	}

	//�ش��ϴ� ��ǰ ���� ���
	public ProductBean getProductInfo(int pnum) {
		ProductBean productInfo = new ProductBean();
		productInfo = sqlSessionTemplate.selectOne(product+".getProductInfo", pnum);
		return productInfo;
	}

	//���ɻ�ǰ ���
	public List<InterestBean> getInterestLists(String id) {
		List<InterestBean> ilists = new ArrayList<InterestBean>();
		ilists = sqlSessionTemplate.selectList(interest+".getInterestLists", id);
		return ilists;
	}

	//ī�װ��� ��ǰ ��� ��
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

	public List<ProductBean> getNewProductRange(SearchBean sb, Paging pageInfo) {
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

	public List<ProductBean> getKeywordRange(SearchBean sb, Paging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> keyProduct = new ArrayList<ProductBean>();
		keyProduct = sqlSessionTemplate.selectList(product+".getKeywordRange", sb, rb);
		//System.out.println("keyProduct.size: "+keyProduct.size());
		return keyProduct;
	}

	public void deleteInterest(InterestBean ib) {
		sqlSessionTemplate.delete(interest+".deleteInterest", ib);
	}

	public void insertInterest(InterestBean ib) {
		sqlSessionTemplate.insert(interest+".insertInterest", ib);
	}
	
	public List<AddressBean> getAddressList(String id) {
		List<AddressBean> alists = new ArrayList<AddressBean>();
		alists = sqlSessionTemplate.selectList(address+".getAddressList", id);
		return alists;
	}
}
