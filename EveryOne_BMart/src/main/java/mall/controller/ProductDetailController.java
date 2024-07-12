package mall.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.MallDao;
import model.MemberBean;
import model.ProductBean;
import model.ReviewDetailBean;
import model.SearchBean;
import model.WatchBean;
import utility.ReviewPaging;

@Controller
public class ProductDetailController {

	private final String command = "/detail.mall";
	private final String getPage = "productDetail";
	
	@Autowired
	MallDao mallDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String detail(@RequestParam("pnum") int pnum, Model model, HttpSession session,
						@RequestParam(value="range", required=false) String range, 
						@RequestParam(value="pageNumber", required=false) String pageNumber, 
						HttpServletRequest request) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		if(session.getAttribute("loginInfo") != null) {
			
			WatchBean wb = new WatchBean();
			wb.setId(mb.getId());
			wb.setPnum(pnum);
			
			int watch = mallDao.getWatch(wb);
			
			if(watch <= 0) {
				//최근 본 내역에 해당 상품이 없음 = watch 테이블에 추가.
				mallDao.insertWatch(wb);
			}else {
				//동일한 상품이 있음 = watch 테이블에서 wnum을 최신으로 변경
				mallDao.updateWatch(wb);
			}
			
		}
		
		ProductBean product = mallDao.getProductInfo(pnum);
		model.addAttribute("product", product);
		
		SearchBean sb = new SearchBean();
		sb.setPnum(pnum);
		sb.setRange(range);
		
		int totalCount = mallDao.getReviewDetailCount(sb);
		String url = request.getContextPath()+this.command+"?pnum="+pnum;
		
		ReviewPaging pageInfo = new ReviewPaging(pageNumber, null, totalCount, url, range, null);
		
		//reviewDetail => 리뷰 + product => 내용을 묶음
		List<ReviewDetailBean> rdetail = mallDao.getReviewDetail(sb, pageInfo);
		
		model.addAttribute("rdetail", rdetail);
		model.addAttribute("pageInfo", pageInfo);
		
		//전체 리뷰 개수
		int rcount = mallDao.getReviewTotalCount(pnum);
		model.addAttribute("rcount", rcount);
		
		return getPage;
	}
}
