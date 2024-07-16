package orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import orders.model.OrdersBean;
import orders.model.OrdersDao;
import utility.Paging;

@Controller
public class orderSellerListController {
	
	private final String command = "/list.od";
	private final String gotoPage = "list";
    
	@Autowired
	OrdersDao orderDao;
	
	@RequestMapping(command)
	public String listSeller(@RequestParam(value="pageNumber", required=false) String pageNumber,
	                         @RequestParam(value="year", required=false) Integer year,
	                         @RequestParam(value="month", required=false) Integer month,
	                         HttpServletRequest request,
	                         HttpSession session,
	                         Model model) {

	    if (session.getAttribute("loginInfo") == null) {
	        session.setAttribute("destination", "redirect:/list.od");
	        return "redirect:/login.mb";
	    } else {
	        MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
	        String id = loginInfo.getId();
	        
	        int totalCount;
	        List<OrdersBean> orders;
	        Paging pageInfo;
	        if (year != null && month != null) {
	            totalCount = orderDao.getOrdersCountBySellerAndYearAndMonth(id, year, month);
	            System.out.println("Yearly and monthly orderCount: " + totalCount);
	            String url = request.getContextPath() + this.command + "?year=" + year + "&month=" + month;
	            pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);

	            orders = orderDao.getOrdersBySellerAndYearAndMonth(pageInfo, id, year, month);
	        } else if (month != null) {
	            totalCount = orderDao.getOrdersCountBySellerAndMonth(id, month);
	            System.out.println("Monthly orderCount: " + totalCount);
	            String url = request.getContextPath() + this.command + "?month=" + month;
	            pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);

	            orders = orderDao.getOrdersBySellerAndMonth(pageInfo, id, month);
	        } else {
	            totalCount = orderDao.getOrdersCountBySeller(id);
	            System.out.println("orderCount: " + totalCount);
	            String url = request.getContextPath() + this.command;
	            pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);

	            orders = orderDao.getOrdersBySeller(pageInfo, id);
	        }

	        model.addAttribute("orders", orders);
	        model.addAttribute("pageInfo", pageInfo);
	        model.addAttribute("selectedYear", year);
	        model.addAttribute("selectedMonth", month);

	        return gotoPage;
	    }
	}

}
