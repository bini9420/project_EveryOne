package mall.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import mall.model.ProductBean;
import mall.model.WatchBean;
import member.model.MemberBean;

@Controller
public class ProductDetailController {

	private final String command = "/detail.mall";
	private final String getPage = "productDetail";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String detail(@RequestParam("pnum") int pnum, Model model, HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		if(session.getAttribute("loginInfo") != null) {
			
			WatchBean wb = new WatchBean();
			wb.setId(mb.getId());
			wb.setPnum(pnum);
			
			int watch = mallDao.getWatch(wb);
			
			if(watch <= 0) {
				//�ֱ� �� ������ �ش� ��ǰ�� ���� = watch ���̺� �߰�.
				mallDao.insertWatch(wb);
			}else {
				//������ ��ǰ�� ���� = watch ���̺��� wnum�� �ֽ����� ����
				mallDao.updateWatch(wb);
			}
			
		}
		
		ProductBean product = mallDao.getProductInfo(pnum);
		model.addAttribute("product", product);
		
		
		return getPage;
	}
}
