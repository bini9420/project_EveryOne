package sale.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import mall.model.ProductBean;
import sale.model.SalesDao;
import sale.model.orderInfoBean;

@Controller
public class MonthlyController {

   private final String command = "/top.sale";
   private final String getPage = "topSale";
   
   @Autowired
   SalesDao salesDao;
   
   @RequestMapping(command)
   public String rangeTest(Model model) {
	   
	   
	   List<orderInfoBean> alists = salesDao.getAriaChart();
		//System.out.println("plists.get(0).pname: "+alists.get(0).getTotalPrice());

		Gson gson = new Gson(); 
		JsonArray jArray = new JsonArray();

		for (orderInfoBean ob : alists) {
			System.out.println("ob.getTotalPrice: "+ob.getTotalPrice());
			JsonObject object = new JsonObject();

			String orderdate = ob.getOrderdate();
			int totalPrice = ob.getTotalPrice();


			object.addProperty("orderdate", orderdate);
			object.addProperty("totalPrice", totalPrice);
			jArray.add(object);
		}



	   
	   
      
      List<ProductBean> plists = salesDao.getRangeTest();
      System.out.println("plists.get(0).pname: "+plists.get(0).getPname());
      
		/*
		 * Gson gson = new Gson(); JsonArray jArray = new JsonArray();
		 */
  
      for (ProductBean pb : plists) {
         System.out.println("pb.getpname: "+pb.getPname());
         JsonObject object = new JsonObject();
      
         String pname = pb.getPname();
         int ordercount = pb.getOrdercount();

        
         object.addProperty("pname", pname);
         object.addProperty("ordercount", ordercount);
         jArray.add(object);
      }

      
      String json = gson.toJson(jArray);
      model.addAttribute("json", json);
      return getPage;
   }
}