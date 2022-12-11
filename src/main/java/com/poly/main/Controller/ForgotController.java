package com.poly.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.ForgotPassword;
import com.poly.main.Service.MailerServiceImpl;
import com.poly.main.Validator.ForgotPassValidator;

@Controller
public class ForgotController {
	@Autowired
	ForgotPassValidator forgotPassValidator;
	
	@Autowired
	MailerServiceImpl service;
	
	@Autowired
	UserDao dao;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == ForgotPassword.class) {
			binder.setValidator(forgotPassValidator);
		}
	}
	
	@GetMapping("/forgot-password")
	public String index(Model model) {
		ForgotPassword entity = new ForgotPassword();
		model.addAttribute("forgotPassword", entity);
		return "user/forgot-password";
	}
	
	@PostMapping("/forgot-password")
	public String send(@ModelAttribute("forgotPassword") @Validated ForgotPassword entity, BindingResult result, Model model) {
		model.addAttribute("check", false);
		if(!result.hasErrors()) {
			User user = dao.findByEmail(entity.getEmail());
			service.queue(entity.getEmail(), "Làm mới mật khẩu!", "Vui lòng click vào link này: "+ "http://localhost:8080/reset-password/?code="+user.getPassword()+"&email="+user.getEmail() +" để reset mật khẩu.");

			return "user/success-forgot";
		}
		else {
			
		}
	//	return "redirect:/login";
		return "user/forgot-password";
	}
	
	
}
