package doc.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import doc.model.DocBean;
import doc.model.DocDao;
import mall.model.ProductBean;
import sale.model.SalesDao;
import sale.model.orderInfoBean;


@Controller
public class DocListController {
	
	private final String command = "adminMain.ad";
	private final String getPage = "a_main";
	
	@Autowired
	DocDao docDao;          
	
	@Autowired
	SalesDao salesDao;
	
	@RequestMapping(command)
	public String approve(
					 	  @RequestParam(value="keyword", required=false) String keyword,
					 	  @RequestParam(value="pageNumber", required=false) String pageNumber,
					 	  HttpServletRequest request,
					 	  Model model) {
	
		
		List<DocBean> docList = docDao.getDocumentList(); 
		model.addAttribute("docList", docList);
		
		
		List<orderInfoBean> alists = salesDao.getAriaChart();
		Gson gson = new Gson();
		JsonArray areaArray = new JsonArray();

		for (orderInfoBean ob : alists) {
			JsonObject object = new JsonObject();
			object.addProperty("orderdate", ob.getOrderdate());
			object.addProperty("totalPrice", ob.getTotalPrice());
			areaArray.add(object);
		}
		String areaJson = gson.toJson(areaArray);
		model.addAttribute("areaJson", areaJson);

		// Data for the Pie Chart
		List<ProductBean> plists = salesDao.getRangeTest();
		JsonArray pieArray = new JsonArray();

		// Limit to top 5 products
		int limit = Math.min(plists.size(), 5);
		for (int i = 0; i < limit; i++) {
			ProductBean pb = plists.get(i);
			JsonObject object = new JsonObject();
			object.addProperty("pname", pb.getPname());
			object.addProperty("ordercount", pb.getOrdercount());
			pieArray.add(object);
		}
		
		List<ProductBean> clists = salesDao.getCateChart();
		
		JsonArray barArray = new JsonArray();
		
		
		for(ProductBean product :clists) {
			JsonObject object = new JsonObject();
			object.addProperty("pcategory", product.getPcategory());
			object.addProperty("ordercount", product.getOrdercount());
			barArray.add(object);
		}
		String barJson = gson.toJson(barArray);
		model.addAttribute("barJson",barJson);
		
		String pieJson = gson.toJson(pieArray);
		model.addAttribute("pieJson", pieJson);

		
		List<ProductBean> pnumlists = salesDao.getPnumSale();
		model.addAttribute("pnumlists",pnumlists);
		
		return getPage;
	}
	
}
