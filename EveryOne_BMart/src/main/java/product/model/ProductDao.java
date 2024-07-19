package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import document.model.DocumentBean;
import model.EnterBean;
import model.ProductBBean;
import model.ProductBean;
import utility.MemberListPaging;
import utility.PagingPlus;

@Component
public class ProductDao {

	private String namespace = "product";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ProductDao() {
		System.out.println("ProductDao 생성자");
	}
 
	public List<ProductBean> getProductList(Map<String, String> map, MemberListPaging pageInfo) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		System.out.println(map.get("keyword"));
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		System.out.println(pageInfo.getOffset());
		System.out.println(pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".getProductList", map, rowBounds);

		System.out.println("lists.size() : " + lists.size());
		return lists;
	}//getProductList

	public int getTotalCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".adminTotalCount", map);
		System.out.println("count : " + count);
		
		return count;
	}// getTotalCount

	public int insertProduct(ProductBean pb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertProduct", pb);
		System.out.println("insertProduct cnt : " + cnt);
		
		return cnt;
	}//insertProduct

	// 3번(,,)
	public ProductBean detailViewByNum(int pnum) {
		ProductBean pb = null;
		pb = sqlSessionTemplate.selectOne(namespace + ".detailViewByNum", pnum);
		return pb;
	}//detailViewByNum

	public int deleteProduct(int delno) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".deleteProduct", delno);
		System.out.println("deleteProduct cnt:"+cnt);
		
		return cnt;
	}//deleteProduct


	public int updateProduct(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".updateProduct", product);
		System.out.println("updateProduct cnt : " + cnt);

		return cnt;
	}//updateProduct

	public int insertCategory(String type) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertCategory", type);
		System.out.println("insertCategory cnt : " + cnt);
		
		return cnt;
	}//insertCategory
	
	public int insertProductByOwner(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertProductByOwner", product);
		
		return cnt;
	}//insertProductByOwner

	public int getTotalCountForOwner(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getTotalCountForOwner", map);
		
		return count;
	}//getTotalCountForOwner

	public List<ProductBean> getAllProductForOwner(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllProductForOwner", map, rowBounds);
		
		return lists;
	}//getAllProductForOwner

	//★ o_top.jsp에서 상품등록 클릭시 로그인한 id를 조건으로 입점요청 승인여부 확인
	public DocumentBean checkProductApproval(String id) {
		DocumentBean db = null;
		db = sqlSessionTemplate.selectOne(namespace + ".checkProductApproval", id);
		 
		return db;
	}//checkEnterApproval

	public ProductBean getProductByPnum_Owner(String pnum) {
		ProductBean pb = null;
		pb = sqlSessionTemplate.selectOne(namespace + ".getProductByPnum_Owner", pnum);
		
		return pb;
	}//getProductByPnum_Owner

	public ProductBean getProductById(int pnum) {
		return sqlSessionTemplate.selectOne(namespace + ".selectProductById", pnum);
	}

	public int updateOwnerProduct(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".updateOwnerProduct", product);
		return cnt;
	}

	

}