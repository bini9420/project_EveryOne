
package sale.controller;


import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.ProductBean;
import sale.model.OrderInfoBean;
import sale.model.SalesDao;

@Controller
public class MonthlyController {

	private final String command = "/top.sale";
	private final String getPage = "topSale";

	@Autowired
	SalesDao salesDao;

	@RequestMapping(command)
	public String rangeTest(Model model) {

		//월별 매출 그래프 
		Gson gson = new Gson();
		JsonArray areaArray = new JsonArray();

		List<OrderInfoBean> alists = salesDao.getAriaChart();

		for (OrderInfoBean ob : alists) {
			JsonObject object = new JsonObject();
			object.addProperty("orderdate", ob.getOrderdate());
			object.addProperty("totalPrice", ob.getTotalPrice());
			areaArray.add(object);
		}
		String areaJson = gson.toJson(areaArray);
		model.addAttribute("areaJson", areaJson);

		//TOP5 파이 차트 
		JsonArray pieArray = new JsonArray();
		List<ProductBean> plists = salesDao.getRangeTest();


		int limit = Math.min(plists.size(), 5);
		for (int i = 0; i < limit; i++) {
			ProductBean pb = plists.get(i);
			JsonObject object = new JsonObject();
			object.addProperty("pname", pb.getPname());
			object.addProperty("ordercount", pb.getOrdercount());
			pieArray.add(object);
		}

		String pieJson = gson.toJson(pieArray);
		model.addAttribute("pieJson", pieJson);

		//월별 매출 테이블
	  List<Map<String, Integer>> monthSumCount =salesDao.getAdminMonthSumCount();
	  List<Map<String, Integer>> monthSumCount2 =salesDao.getAdminMonthSumCount2();
	  
	  System.out.println("monthSumCount"+monthSumCount);
	  System.out.println("monthSumCount2"+monthSumCount2);
	
	  model.addAttribute("monthSumCount",monthSumCount);
	  model.addAttribute("monthSumCount2",monthSumCount2);
	
	  return getPage;	 	        
	}

}