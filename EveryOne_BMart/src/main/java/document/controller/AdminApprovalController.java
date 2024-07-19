package document.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import document.model.DocumentBean;
import document.model.DocumentDao;
import document.model.EnterDao;
import document.model.ReviewcheckDao;
import model.EnterBean;
import model.MemberBean;
import model.ReviewcheckBean;

@Controller
public class AdminApprovalController {
	
	private final String command = "admin_approval.dc";
	
	@Autowired
	DocumentDao documentDao;
	
	@Autowired
	EnterDao enterDao;
	
	@Autowired
	ReviewcheckDao reviewcheckDao;
	
	//GET: admin_documentDetail.jsp에서 승인버튼 클릭시
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String result(@RequestParam(value="dnum", required=false) String dnum,
						 @RequestParam(value="eno", required=false) String eno,
						 @RequestParam(value="rnum", required=false) String rnum,
						 HttpSession session,
						 HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(dnum != null) { //상품등록, 광고요청, 폐점신청
			documentDao.updateApproval(dnum);
			DocumentBean db = documentDao.getDocumentByDnum(dnum);
			
			if(db.getDcategory().equals("상품등록")) { //prdcategory에 입력된 값이 기존 category 테이블에 있는지 확인, 없으면 추가
				String prdcategory = documentDao.getPrdcategory(dnum);
				int count = documentDao.checkPrdcategory(prdcategory);
				if(count == 0) {
					documentDao.insertCategory(prdcategory);
				}
			}
			else if(db.getDcategory().equals("광고요청")) { //product 테이블에 ad 칼럼 변경
				String pname = documentDao.getPrdname(dnum);
				documentDao.updateProductAd(pname);
				
			} else if(db.getDcategory().equals("폐점신청")) { //business 테이블에서 해당 id 레코드 삭제
				String writer = documentDao.getWriter(dnum);
				documentDao.deleteBusinessId(writer);
			}
			
			out.println("<script>");
			out.println("alert('결재가 완료되었습니다.'); location.href='admin_allBox.dc'");
			out.println("</script>");
			out.flush();
		} else if(eno != null) { //입점신청
			enterDao.updateApproval(eno);
			EnterBean eb = 	enterDao.getEnterByEno(eno);
			enterDao.insertBusiness(eb);
			
			out.println("<script>");
			out.println("alert('결재가 완료되었습니다.'); location.href='admin_enterBox.dc'");
			out.println("</script>");
			out.flush();
		} else if(rnum != null) { //리뷰검토
			reviewcheckDao.updateApproval(rnum);
			
			ReviewcheckBean rcheck = reviewcheckDao.getRcheckByRnum(rnum);
			System.out.println("id: " + rcheck.getRe_writer());
			System.out.println("pnum: " + rcheck.getPrdnum());
			System.out.println("re_writeday: " + rcheck.getRe_writeday());
			
			// 문자열을 LocalDateTime 객체로 파싱
	        LocalDateTime datetime = LocalDateTime.parse(rcheck.getRe_writeday(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
	        // LocalDateTime 객체에서 LocalDate 객체(날짜 부분)만 추출
	        LocalDateTime dateOnly = datetime.toLocalDate().atStartOfDay();
	        // 날짜를 원하는 형식으로 포맷팅 (예: "yyyy-MM-dd")
	        String re_writeday = dateOnly.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("pnum", rcheck.getPrdnum());
			map.put("rdate", re_writeday);
			map.put("id", rcheck.getRe_writer());
			
			//선택된 리뷰검토요청 문서에서 리뷰작성자, 리뷰작성일을 조건으로 review 테이블의 레코드 삭제
			reviewcheckDao.deleteReview(map);
			
			out.println("<script>");
			out.println("alert('결재가 완료되었습니다.'); location.href='admin_rcheckBox.dc'");
			out.println("</script>");
			out.flush();
		}
		return null;
	}
}
	
