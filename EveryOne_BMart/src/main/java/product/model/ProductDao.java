package product.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("ProductDao")
public class ProductDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "product.model.Product";
	
	public List<ProductBean> selectAllProducts(Map<String, String> map,Paging pageInfo) {
        RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
        return sqlSessionTemplate.selectList(namespace + ".selectAllProducts", map, rowBounds);
    }
	
	public List<ProductBean> selectProductsByUser(Paging pageInfo, String id) {
        RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
        return sqlSessionTemplate.selectList(namespace + ".selectProductsByUser", id, rowBounds);
    }
	
	public ProductBean getProductById(int pnum) {
		return sqlSessionTemplate.selectOne(namespace + ".selectProductById", pnum);
	}
	
	public int updateStock(ProductBean pb) {
		int cnt = -1;
        cnt = sqlSessionTemplate.update(namespace + ".updateStock", pb);
        return cnt;
	}

	public int getProductCount(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".getProductCount", id);
		return cnt;
	}

	public int deleteProduct(int pnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".deleteProduct", pnum);
		return cnt;
	}

	public ProductBean detailViewByNum(int pnum) {
		ProductBean pb = null;
		pb = sqlSessionTemplate.selectOne(namespace + ".detailViewByNum", pnum);
		return pb;
	}
	
	public int updateProduct(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateProduct", product);
		return cnt;
	}

	public int insertProduct(ProductBean pb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertProduct", pb);
		return cnt;
	}

	public int getTotalProductCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace + ".getTotalProductCount",map);
	}	
	
}
