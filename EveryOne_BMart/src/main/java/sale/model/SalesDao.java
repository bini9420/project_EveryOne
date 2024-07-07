package sale.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mall.model.ProductBean;

@Repository
public class SalesDao {
    
	
	private String namespace="sale";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
    
    public List<SalesData> getMonthlySales() {
    	
    	List<SalesData> lists= new ArrayList<SalesData>();
        
    	lists= sqlSessionTemplate.selectList(namespace+".monthSale");
    	return lists;
       
    }
    
    public List<ProductBean> getTopSale(){
    	
    	List<ProductBean> list = new ArrayList<ProductBean>(); 
    	list =sqlSessionTemplate.selectList(namespace+".topSale");
    	return list;
    
    }

	
    
}
