package sale.controller;

import java.util.Iterator;
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

@Controller
public class TopProdController {
	
	private final String  command="TopProd.sale";
	private final String  getPage="monthlySales";
	
	@Autowired
	ProductBean pb; 
	
	@Autowired
	SalesDao salesDao; 
	
	@RequestMapping(command)
	public String top(Model model) {
		
		List<ProductBean> logNameList = salesDao.getTopSale();
		
				
		

		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
				
		Iterator<ProductBean> it = logNameList.iterator();
		while(it.hasNext()) {
			ProductBean pb = it.next();
			JsonObject object = new JsonObject();
			String pname = pb.getPname();
			int ordercount = pb.getOrdercount();
			
		    object.addProperty("pname", pname);
			object.addProperty("ordercount", ordercount);
			jArray.add(object);
		}
				
		String json = gson.toJson(jArray);
		model.addAttribute("json", json);
		
		System.out.println("json:"+json);
		return getPage;
	}

}
