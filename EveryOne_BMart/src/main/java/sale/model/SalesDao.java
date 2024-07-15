package sale.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mall.model.ProductBean;

@Service
public class SalesDao {
    
	
	private String namespace="sale";
	private String namespace2="product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
    
    public List<OrderInfoBean> getMonthlySales() {
    	
    	List<OrderInfoBean> lists= new ArrayList<OrderInfoBean>();
        
    	lists= sqlSessionTemplate.selectList(namespace2+".monthSale");
    	return lists;
       
    }

    public List<ProductBean> getRangeTest() {
        List<ProductBean> plists = new ArrayList<ProductBean>();
        plists = sqlSessionTemplate.selectList(namespace2+".getRangeTest");
        return plists;
     }

	public List<OrderInfoBean> getAriaChart() {
		 List<OrderInfoBean> alists = new ArrayList<OrderInfoBean>();
		 //System.out.println("ariaChart"+alists.get(0).getOrderdate());
	        alists = sqlSessionTemplate.selectList(namespace+".getAriaChart");
	        return alists;
	}

	public List<ProductBean> getCateChart() {
		List<ProductBean> clists = new ArrayList<ProductBean>();
		//System.out.println(clists.get(0).getPcategory());
		clists = sqlSessionTemplate.selectList(namespace2+".getCateChart");
		return clists;
	}
	
	

	

}
