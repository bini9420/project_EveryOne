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
	
	private String namespace = "mall";
	
	public List<CategoryBean> getAllCategory() {
		List<CategoryBean> categoryLists = new ArrayList<CategoryBean>();
		categoryLists = sqlSessionTemplate.selectList(namespace+".getAllCategory");
		return categoryLists;
	}

	public List<ProductBean> getBestProduct() {
		List<ProductBean> bestProducts = new ArrayList<ProductBean>();
		bestProducts = sqlSessionTemplate.selectList(namespace+".getBestProduct");
		return bestProducts;
	}
	
	
}
