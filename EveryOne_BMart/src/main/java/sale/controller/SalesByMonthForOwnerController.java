package sale.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.MemberBean;
import model.ProductBean;
import sale.model.SalesDao;

@Controller
public class SalesByMonthForOwnerController {

	private final String command = "owner_prdSales.sale";
	private final String getPage = "ownerSalesByMonth";
	
	@Autowired
	SalesDao salesDao;
	
	@RequestMapping(command)
	public String sales(HttpSession session, Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		Gson gson = new Gson();
		
		//TOP5 파이 차트 
		JsonArray pieArray = new JsonArray();
		List<ProductBean> plists = salesDao.donutChartForOwner(mb.getId());

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
				
		return getPage;
	}
	
}
