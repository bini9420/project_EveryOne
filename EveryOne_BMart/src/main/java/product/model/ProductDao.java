package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mall.model.ProductBean;
import utility.MemberListPaging;

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
	}

	public int getTotalCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		System.out.println("count : " + count);
		return count;
	}// getTotalCount

	public int insertProduct(ProductBean pb) {
		// TODO Auto-generated method stub
		int cnt = -1;

		cnt = sqlSessionTemplate.insert(namespace + ".insertProduct", pb);
		System.out.println("insertProduct cnt : " + cnt);
		return cnt;
	}

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
		
	}

	 
	
	
	
	

	
}