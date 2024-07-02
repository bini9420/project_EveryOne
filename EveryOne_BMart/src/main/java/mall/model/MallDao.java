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
	
	private String product = "product.Product";
	private String category = "category.Category";
	
	public List<String> getAllCategory() {
		List<String> categoryLists = new ArrayList<String>();
		categoryLists = sqlSessionTemplate.selectList(category+".getAllCategory");
		return categoryLists;
	}

	public List<String> getBestProduct() {
		List<String> bestProducts = new ArrayList<String>();
		bestProducts = sqlSessionTemplate.selectList(product+".getBestProduct");
		return bestProducts;
	}
	
	
}
