package orders.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("OrdersDao")
public class OrdersDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "orders.model.Orders";
	
	public List<OrdersBean> selectAllOrders(Paging pageInfo, String id) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("pageInfo", pageInfo);
        return sqlSessionTemplate.selectList(namespace + ".selectAllOrders",params,rowBounds);

    }

    public OrdersBean getOrderById(int onum) {
        return sqlSessionTemplate.selectOne(namespace + ".selectOrderById", onum);
    }

	public int getOrdersCount(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".getOrdersCount",id);
		return cnt;
	}

	public int getOrdersCountBySeller(String id) {
		return sqlSessionTemplate.selectOne(namespace + ".getOrdersCountBySeller", id);
	}

	public List<OrdersBean> getOrdersBySeller(Paging pageInfo, String id) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        return sqlSessionTemplate.selectList(namespace + ".getOrdersBySeller", params, rowBounds);
	}
    
    
}
