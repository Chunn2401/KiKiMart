package com.poly.main.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.main.Dao.OrderDao;
import com.poly.main.Entity.Order;
import com.poly.main.Entity.User;
import com.poly.main.Model.OrderModel;
import com.poly.main.Service.SessionService;

@Controller
public class OrderController {
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	OrderDao orderDao;	
	
	@GetMapping("/shop/profile/order")
	public String index(Model model) {
		User user = sessionService.get("userLogin");
		List<OrderModel> list = orderDao.getOrderModel(user.getId());
		model.addAttribute("location", 0);
		model.addAttribute("order", list);
		return "user/order";
	}
	
	@GetMapping("/shop/order/delete/{name}")
	public String delete(Model model, @PathVariable("name") String name) {
		List<Order> list = orderDao.getOrderByName(name);
		for(Order o: list) {
			orderDao.delete(o);
		}
		return "redirect:/shop/profile/order";
	}
}
