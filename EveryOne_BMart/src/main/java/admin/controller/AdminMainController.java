package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			HttpServletRequest request,
			Model model) {
		
		//��� Card > ���� ��� �Ǽ�(�Ϲ� ���� + ���� ��û)
		int count1 = adminDao.getWaitDocumentCountForAdmin();
		int count2 = adminDao.getWaitEnterCountForAdmin();
		int waitCount = count1 + count2;
		model.addAttribute("waitCount", waitCount);
		
		//��� Card > ȸ��/��ǰ����
		int memberCount = adminDao.getAllMemberCount();
		int productCount = adminDao.getAllProductCount();
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("productCount", productCount);
		
		
		
		//������ main������ ������
		List<DocBean> docList = adminDao.getDocumentList(); 
		model.addAttribute("docList", docList);


		//���� ���� ��Ʈ
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

		// �α��ǰ TOP5 ���� ��Ʈ
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

		//ī�װ��� ������Ʈ

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
