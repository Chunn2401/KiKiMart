package com.poly.main.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.main.Dao.OrderDao;
import com.poly.main.Entity.Order;

@Controller
public class InvoiceController {
	@Autowired
	OrderDao orderDao;
	
	@GetMapping("/shop/invoice/{name}")
	public String index(Model model, @PathVariable("name") String name) {
		
		return "user/invoice";
	}
	
	@ModelAttribute("order")
	public List<Order> order(@PathVariable("name") String name, Model model){
		List<Order> list = orderDao.getOrderByName(name);
		int total = 0;
		for(Order o: list) {
			total = total + o.getProduct().getPrice() * o.getQuality();
		}
		model.addAttribute("total", total);
		model.addAttribute("address", list.get(0).getAddress().getAddress());
		return list;
	}
	
	@ModelAttribute("name")
	public String name(@PathVariable("name") String name) {
		return name;
	}
	
	@ModelAttribute("location")
	public int location() {
		return 0;
	}
}
