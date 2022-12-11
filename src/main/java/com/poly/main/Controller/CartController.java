package com.poly.main.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Model.Item;
import com.poly.main.Service.SessionService;
import com.poly.main.Service.ShoppingCartServiceImpl;

@Controller
public class CartController {
	@Autowired
	ShoppingCartServiceImpl cart;
	
	@Autowired
	SessionService sessionService;
	
	@GetMapping("/shop/cart")
	public String index(Model model) {
		model.addAttribute("cart", cart);
		return "user/cart";
	}
	
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("quality") Integer qty) {
		cart.update(id, qty);
		return "redirect:/shop/cart";
	}
	
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);	
		sessionService.set("countProduct", cart.getCount());
		return "redirect:/shop/cart";
	}
	
	@ModelAttribute("total")
	public int tolal() {
		List<Item> list = new ArrayList<>(cart.getItems());
		int total = 0;
		for(Item i: list) {
			total = total + i.getPrice() * i.getQuality();
		}
		return total;
	}
	
	
}
