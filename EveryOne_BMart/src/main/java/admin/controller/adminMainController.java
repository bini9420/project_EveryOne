package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import sale.model.SalesDao;
import sale.model.OrderInfoBean;

@Controller
public class adminMainController {

	
	
	
	

		private final String command = "/adminMain.ad";
		private final String getPage = "a_main";

		@Autowired
		SalesDao salesDao;

		@RequestMapping(command)
		public String rangeTest(Model model) {
			// Data for the Area Chart
			List<OrderInfoBean> alists = salesDao.getAriaChart();
			Gson gson = new Gson();
			JsonArray areaArray = new JsonArray();

			for (OrderInfoBean ob : alists) {
				JsonObject object = new JsonObject();
				object.addProperty("orderdate", ob.getOrderdate());
				object.addProperty("totalPrice", ob.getTotalPrice());
				areaArray.add(object);
			}
			String areaJson = gson.toJson(areaArray);
			model.addAttribute("areaJson", areaJson);
			
			return getPage;
		}

		
		

}
