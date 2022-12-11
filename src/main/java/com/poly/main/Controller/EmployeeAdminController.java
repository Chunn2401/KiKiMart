package com.poly.main.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Dao.EmployeeDao;
import com.poly.main.Dao.RoleDao;
import com.poly.main.Dao.UserRoleDao;
import com.poly.main.Entity.Employee;
import com.poly.main.Entity.Role;
import com.poly.main.Entity.UserRole;
import com.poly.main.Model.EmployeeReport;
import com.poly.main.Service.SessionService;

@Controller
public class EmployeeAdminController {
	@Autowired
	EmployeeDao dao;
	
	@Autowired
	UserRoleDao userRoleDao;
	
	@Autowired
	RoleDao roleDao;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/admin/employeeTable/list")
	public String index(Model model, @RequestParam("keyword") Optional<String> name, @RequestParam("p") Optional<Integer> p) {
		String findName;
		if(session.get("keyword") == null) {
			findName = name.orElse("");
		}
		else {
			findName = name.orElse(session.get("keyword"));
		}		
		
		session.set("keyword", findName);
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);

		Page<EmployeeReport> page = dao.fillToTable("%"+findName+"%", pageable);
		model.addAttribute("userItem", page);
		
		return "manager/employeeTable";
	}
	
	@RequestMapping("/admin/employeeTable/list/delete/{employeeId}/{userId}")
	public String delete(Model model, @PathVariable("employeeId") int eid, @PathVariable("userId") int uid) {
		Role role = roleDao.getOne(2);
		UserRole userRole = userRoleDao.getById(userRoleDao.findIdUserRole(uid));		
		userRole.setRole(role);
		userRoleDao.save(userRole);
		
		Employee employee = dao.getById(eid);
		dao.delete(employee);
		
		return "redirect:/admin/employeeTable/list";
	}
}
