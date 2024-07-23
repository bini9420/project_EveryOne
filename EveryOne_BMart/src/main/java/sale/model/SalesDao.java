package sale.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.ProductBean;

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

	public List<ProductBean> bestProduct5ForOwner(String id) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace2 + ".bestProduct5ForOwner", id); 
		
		return lists;
	}//donutChartForOwner

	public List<ProductBean> worstProduct5ForOwner(String id) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace2 + ".worstProduct5ForOwner", id); 
		
		return lists;
	}//worstProduct5ForOwner

	public List<ProductBean> getPrdYearSumForOwner(String id) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace2 + ".getPrdYearSumForOwner", id);
		
		return lists;
	}//getPrdYearSumForOwner

}
