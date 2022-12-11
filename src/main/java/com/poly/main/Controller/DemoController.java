package com.poly.main.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.main.Dao.RoleDao;

@Controller
public class DemoController {
	@Autowired
	RoleDao dao;
	
	@GetMapping("/demo")
	public String demo() {
		List<String> list = dao.getRoleNames(9);
		for(String s: list) {
			System.out.println(s);
		}
		return "user/index";
	}
}
