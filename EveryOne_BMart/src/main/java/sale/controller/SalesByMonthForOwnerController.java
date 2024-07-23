package sale.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

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
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
        Gson gson = new Gson();
        
        // BEST5 파이 차트 데이터
        JsonArray pieArrayBest = new JsonArray();
        List<ProductBean> bestProducts = salesDao.bestProduct5ForOwner(mb.getId());
        model.addAttribute("bestProducts", bestProducts);
        
        int bestLimit = Math.min(bestProducts.size(), 5);
        for (int i = 0; i < bestLimit; i++) {
            ProductBean pb = bestProducts.get(i);
            JsonObject object = new JsonObject();
            object.addProperty("pname", pb.getPname());
            object.addProperty("ordercount", pb.getOrdercount());
            pieArrayBest.add(object);
        }
        
        String pieJsonBest = gson.toJson(pieArrayBest);
        model.addAttribute("pieJsonBest", pieJsonBest);
        
        // WORST5 파이 차트 데이터
        JsonArray pieArrayWorst = new JsonArray();
        List<ProductBean> worstProducts = salesDao.worstProduct5ForOwner(mb.getId());
        model.addAttribute("worstProducts", worstProducts);
        
        int worstLimit = Math.min(worstProducts.size(), 5);
        for (int i = 0; i < worstLimit; i++) {
            ProductBean pb = worstProducts.get(i);
            JsonObject object = new JsonObject();
            object.addProperty("pname", pb.getPname());
            object.addProperty("ordercount", pb.getOrdercount());
            pieArrayWorst.add(object);
        }
        
        String pieJsonWorst = gson.toJson(pieArrayWorst);
        model.addAttribute("pieJsonWorst", pieJsonWorst);
        
        
        //당해 상품별 누적 매출현황 데이터
        List<ProductBean> ylists = salesDao.getPrdYearSumForOwner(mb.getId());
        model.addAttribute("ylists", ylists);

        return getPage;
    }
	
}
