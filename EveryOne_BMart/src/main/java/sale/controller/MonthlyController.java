package sale.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

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
		
		
		
		
		
		/*
		 * 
		 * List<Map<String, Integer>> monthSumCount = salesDao.getAdminMonthSumCount();
		 * List<Map<String, Integer>> monthSumCount2 =
		 * salesDao.getAdminMonthSumCount2();
		 * 
		 * // 1월부터 12월까지의 순서대로 데이터를 정렬하여 저장할 Map을 생성합니다. Map<String, Integer>
		 * adminMonthlySale = new LinkedHashMap<String, Integer>(); Map<String, Integer>
		 * adminMonthlySale2 = new LinkedHashMap<String, Integer>(); String[] months =
		 * {"1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"};
		 * 
		 * for (String month : months) { adminMonthlySale.put(month, 0);
		 * adminMonthlySale2.put(month, 0); }
		 * 
		 * // monthSumCount에서 데이터를 가져와서 adminMonthlySale에 저장합니다. for (Map<String,
		 * Integer> map : monthSumCount) { for (String month : months) { if
		 * (map.containsKey(month)) { adminMonthlySale.put(month, map.get(month)); } } }
		 * 
		 * // monthSumCount2에서 데이터를 가져와서 adminMonthlySale2에 저장합니다. for (Map<String,
		 * Integer> map : monthSumCount2) { for (String month : months) { if
		 * (map.containsKey(month)) { adminMonthlySale2.put(month, map.get(month)); } }
		 * }
		 * 
		 * // 모델에 결과를 추가합니다. model.addAttribute("adminMonthlySale", adminMonthlySale);
		 * model.addAttribute("adminMonthlySale2", adminMonthlySale2);
		 */
		

		

		/*
		 * //월별 매출 테이블 List<Map<String, Integer>> monthSumCount
		 * =salesDao.getAdminMonthSumCount(); List<Map<String, Integer>> monthSumCount2
		 * =salesDao.getAdminMonthSumCount2();
		 * 
		 * //List<Map<String,Integer>> resultList = new ArrayList<Map<String,
		 * Integer>>();
		 * 
		 * Map<String,Integer> adminMonthlySale = null; Map<String,Integer>
		 * adminMonthlySale2 = null;
		 * 
		 * for(Map<String,Integer> map : monthSumCount) {
		 * 
		 * //adminMonthlySale = new TreeMap<String, Integer>(map);
		 * //resultList.add(adminMonthlySale); Set<String> keyset = map.keySet();
		 * 
		 * for(String key: keyset) {
		 * System.out.println("key:"+key+"/value="+map.get(key)); }
		 * 
		 * } for(Map<String,Integer> map1 : monthSumCount2) {
		 * 
		 * //adminMonthlySale2 = new TreeMap<String, Integer>(map1);
		 * //resultList.add(adminMonthlySale2);
		 * 
		 * Set<String> keyset = map1.keySet(); for(String key: keyset) {
		 * System.out.println("key:"+key+"/value="+map1.get(key)); } }
		 * 
		 * model.addAttribute("adminMonthlySale",adminMonthlySale);
		 * model.addAttribute("adminMonthlySale2",adminMonthlySale2);
		 */
		
		  return getPage;	 	        
	}

}