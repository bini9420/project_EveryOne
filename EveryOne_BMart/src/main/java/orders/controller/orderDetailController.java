package orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.OrdersBean;
import orders.model.OrdersDao;

@Controller
public class orderDetailController {
	
	@Autowired
	OrdersDao orderDao;
	
	private final String command = "detail.od";
	private final String gotoPage = "detail";
	
	@RequestMapping(command)
	public String detail(@RequestParam(value="onum", required = true) int onum,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						Model model) {
		OrdersBean ob = orderDao.getOrderById(onum);
		model.addAttribute("order", ob);
		return gotoPage;
	}
	
}
