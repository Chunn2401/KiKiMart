package com.poly.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Page403Controller {
	@GetMapping("/403page")
	public String index() {
		return "user/403page";
	}
}
