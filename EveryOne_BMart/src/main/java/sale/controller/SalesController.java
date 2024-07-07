package sale.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sale.model.SalesDao;
import sale.model.SalesData;

@Controller
public class SalesController {
    
	private final String command="monthSale.sale";
	private final String getPage="monthlySales";
	
    @Autowired
    SalesDao salesDao;
    
    @RequestMapping(command)
    public String getMonthlySales(Model model) {
        List<SalesData> salesData = salesDao.getMonthlySales();
        model.addAttribute("salesData", salesData);
        return getPage;
    }
}
