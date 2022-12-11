package com.poly.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Page404Controller {
	
	@GetMapping("/404page")
	public String index(Model model) {
		return "user/404page";
	}
}
