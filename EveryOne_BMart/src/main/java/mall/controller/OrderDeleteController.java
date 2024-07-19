package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.MallDao;

@Controller
public class OrderDeleteController {
	
	private final String command = "/deleteOrder.mall";
	private final String getPage = "redirect:/orderList.mall";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView deleteOrder(@RequestParam("onum") int onum,
									@RequestParam("pnum") int pnum,
									@RequestParam("pamount") int pamount) {
		
		ModelAndView mav = new ModelAndView();
		
		int originalStock = mallDao.getStockByPnum(pnum);
		int plusStock = originalStock + pamount;
		
		int cnt = -1;
		cnt = mallDao.deleteOrder(onum);
		
		if(cnt>0) {
			int stockCnt = mallDao.plustStock(pnum, plusStock);
			if(stockCnt>0) {
			System.out.println("삭제 성공");
			System.out.println("재고수량 복구 성공");
			}
		}else {
			System.out.println("삭제 실패");
		}
		mav.setViewName(getPage);
		
		return mav;
	}
}
