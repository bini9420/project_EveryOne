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
public class orderListController {
	
	private final String command = "/list.od";
	private final String gotoPage = "list";
    
	@Autowired
	OrdersDao orderDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="pageNumber", required=false) String pageNumber,
						HttpServletRequest request,
						HttpSession session,
						Model model) {
		
		if (session.getAttribute("loginInfo") == null) {
            session.setAttribute("destination", "redirect:/list.od");
            return "redirect:/login.mb";
        } else {
            MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
            String id = loginInfo.getId();
            
            int totalCount = orderDao.getOrdersCount(id);
            System.out.println("orderCount: " + totalCount);
            String url = request.getContextPath() + this.command;
            Paging pageInfo = new Paging(pageNumber, null, totalCount, url, null, null);

            List<OrdersBean> orders = orderDao.selectAllOrders(pageInfo, id);
            model.addAttribute("orders", orders);
            model.addAttribute("pageInfo", pageInfo);

            return gotoPage;
        
        }
	}
}
