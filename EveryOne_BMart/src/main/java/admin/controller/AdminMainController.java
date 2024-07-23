package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import admin.model.AdminDao;
import doc.model.DocBean;
import model.ProductBean;
import sale.model.OrderInfoBean;
import sale.model.SalesDao;


@Controller
public class AdminMainController {

	private final String command = "adminMain.ad";
	private final String getPage = "a_main";
	
	@Autowired
	AdminDao adminDao;

	@Autowired
	SalesDao salesDao; 

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String approve(
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request, HttpSession session,
			Model model) {
		
		//결재요청 대기건수
		int count1 = adminDao.getWaitDocumentCountForAdmin();
		int count2 = adminDao.getWaitEnterCountForAdmin();
		int count3 = adminDao.getWaitRcheckCountForAdmin();
		session.setAttribute("waitEnter", count2);
		session.setAttribute("waitRcheck", count3);
		
		int waitCount = count1 + count2 + count3;
		model.addAttribute("waitCount", waitCount);
		
		//회원 수, 상품 개수  
		int memberCount = adminDao.getAllMemberCount();
		int productCount = adminDao.getAllProductCount();
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("productCount", productCount);
		
		
		//게시판 총 수
		int totalCount = adminDao.getDesCount();
		model.addAttribute("borderCount",totalCount);
		
		//AdminMain             
		List<DocBean> docList = adminDao.getDocumentList(); 
		model.addAttribute("docList", docList);
		
		
		//연 수입
		int saleList=adminDao.getMonthSaleCount();
		model.addAttribute("monthSale",saleList);
		

		//차트 - 월별 매출            Ʈ
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

		//도넛 차트 -상품 TOP5        Ʈ
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

		//차트 - 카테고리별 매출         Ʈ
		JsonArray barArray = new JsonArray();
		List<ProductBean> clists = salesDao.getCateChart();

		for(ProductBean product :clists) {
			JsonObject object = new JsonObject();
			object.addProperty("pcategory", product.getPcategory());
			object.addProperty("ordercount", product.getOrdercount());
			barArray.add(object);
		}

		String barJson = gson.toJson(barArray);
		model.addAttribute("barJson",barJson);
		
		return getPage;
	}

}
