package com.poly.main.Controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Dao.EmployeeDao;
import com.poly.main.Dao.RoleDao;
import com.poly.main.Dao.UserDao;
import com.poly.main.Dao.UserRoleDao;
import com.poly.main.Entity.Employee;
import com.poly.main.Entity.Role;
import com.poly.main.Entity.User;
import com.poly.main.Entity.UserRole;
import com.poly.main.Model.UserModel;
import com.poly.main.Service.SessionService;
import com.poly.main.Validator.UserFormValidator;

@Controller
public class UserAdminController {
	@Autowired
	UserDao dao;
	
	@Autowired
	EmployeeDao employeeDao;

	@Autowired
	UserFormValidator userFormValidator;

	@Autowired
	RoleDao roleDao;

	@Autowired
	UserRoleDao userRoleDao;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	SessionService session;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == UserModel.class) {
			binder.setValidator(userFormValidator);
		}
	}

	@GetMapping("/admin/userForm/form")
	public String index(Model model) {
		UserModel entity = new UserModel();
		model.addAttribute("userForm", entity);
		//model.addAttribute("check", null);
		return "manager/userForm";
	}

	@PostMapping("/admin/userForm/refresh")
	public String refresh(Model model) {
		return "redirect:/admin/userForm/form";
	}

	@PostMapping("/admin/userForm/form")
	public String form(Model model, @ModelAttribute("userForm") @Validated UserModel entity, BindingResult result) {
		if (result.hasErrors()) {
			return "manager/userForm";
		} else {
			String password = passwordEncoder.encode(entity.getPassword());
			User user = new User(entity.getEmail(), password, entity.getFullname());
			dao.save(user);
			Role role = roleDao.getOne(2);
			UserRole userRole = new UserRole(user, role);
			userRoleDao.save(userRole);
			return "redirect:/admin/userForm/list";
		}
	}

	@RequestMapping("/admin/userForm/list")
	public String list(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p) {
		String findName;
		if(session.get("keyword") == null) {
			findName = name.orElse("");
		}
		else {
			findName = name.orElse(session.get("keyword"));
		}		
		
		session.set("keyword", findName);
		
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		
		Page<User> list = dao.fillUser("%"+findName+"%", pageable);
		model.addAttribute("userItem", list);
		return "manager/userTable";
	}
	
	@GetMapping("/admin/userTable/list/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model) {
		User entity = new User();
		entity = dao.getById(id);
		dao.delete(entity);
		return "redirect:/admin/userForm/list";
	}
	
	@RequestMapping("/admin/userForm/edit/employee/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		Role role = roleDao.getOne(1);
		UserRole userRole = userRoleDao.getById(userRoleDao.findIdUserRole(id));		
		userRole.setRole(role);
		userRoleDao.save(userRole);
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);
		Employee employee = new Employee("Kỹ sư phần mềm", strDate, dao.getById(id));
		
		employeeDao.save(employee);
		
		return "redirect:/admin/userForm/list";
	}

//	@GetMapping("/admin/userForm/edit/{id}")
//	public String edit(Model model, @PathVariable("id") int id) {
//		User entity = new User();
//		entity = dao.getById(id);
//		UserModel userModel = new UserModel(entity.getId(), entity.getEmail(), entity.getFullname(),
//				null, null);
//		model.addAttribute("userForm", userModel);
//		model.addAttribute("check", "true");
//		return "manager/userForm";
//	}
//	
//	@PostMapping("/admin/userForm/edit/{id}")
//	public String editPost(Model model, @PathVariable("id") int id, @ModelAttribute("userForm") @Validated UserModel entity, BindingResult result) {
//		if(result.hasFieldErrors("fullname")) {
//			model.addAttribute("check", "true");
//			return "manager/userForm";
//		}
//		
////		if (result.hasErrors()) {
////			
////		} 
//		else {
//			
//			String password = passwordEncoder.encode(entity.getPassword());
//			
//			User user = dao.getById(id);
//			user.setFullname(entity.getFullname());
//			user.setEmail(entity.getEmail());
//			user.setPassword(passwordEncoder.encode(entity.getPassword()));
//			dao.save(user);
//			return "redirect:/admin/userForm/list";
//		}
//	}
}
