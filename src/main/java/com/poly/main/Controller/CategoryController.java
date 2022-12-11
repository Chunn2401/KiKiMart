package com.poly.main.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mock.web.MockMultipartFile;
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
import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Dao.CategoryDao;
import com.poly.main.Entity.Category;
import com.poly.main.Model.Categories;
import com.poly.main.Model.EmployeeReport;
import com.poly.main.Service.ParamService;
import com.poly.main.Service.SessionService;
import com.poly.main.Validator.CategoryValidator;

@Controller
public class CategoryController {
	@Autowired
	CategoryValidator categoryValidator;

	@Autowired
	CategoryDao dao;

	@Autowired
	ServletContext app;

	@Autowired
	SessionService session;
	
	@Autowired
	ParamService param;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == Categories.class) {
			binder.setValidator(categoryValidator);
		}
	}

	@GetMapping("/admin/categoryForm/form")
	public String index(Model model) {
		Categories entity = new Categories();
		model.addAttribute("categoryForm", entity);
		return "manager/categoryForm";
	}

	@RequestMapping("/admin/categoryForm/list")
	public String index(Model model, @RequestParam("keyword3") Optional<String> name,
			@RequestParam("p") Optional<Integer> p) {
		String findName;
		if (session.get("keyword3") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.get("keyword3"));
		}

		session.set("keyword3", findName);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);

		Page<Category> page = dao.fillToTable("%" + findName + "%", pageable);
		model.addAttribute("userItem", page);

		return "manager/categoryTable";
	}

	@RequestMapping("/admin/categoryForm/list/delete/{id}")
	public String delete(Model model, @PathVariable("id") int id) {
		Category entity = dao.getById(id);
		dao.delete(entity);
		return "redirect:/admin/categoryForm/list";
	}

	@PostMapping("/admin/categoryForm/form")
	public String save(Model model, @ModelAttribute("categoryForm") @Validated Categories entity,
			BindingResult result) {
		if (result.hasErrors()) {
			return "manager/categoryForm";
		}

		else {			
			Category category = new Category(entity.getName(), param.save(entity.getImage()));
			dao.save(category);
		}
		return "redirect:/admin/categoryForm/list";
	}
	
	@GetMapping("/admin/categoryForm/list/load/{id}")
	public String load(Model model, @PathVariable("id") int id) {
		Category category = dao.getById(id);
		Categories entity = new Categories();
		entity.setName(category.getName());
		model.addAttribute("edit", true);
		model.addAttribute("categoryForm", entity);
		session.set("nameImage", category.getImage());
		session.set("id", category.getId());
		return "manager/categoryForm";
	}

	@RequestMapping("/admin/categoryForm/form/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id, @ModelAttribute("categoryForm") Categories entity,
			BindingResult result) {
		model.addAttribute("edit", true);
		if (entity.getName().isEmpty()) {
			result.rejectValue("name", "NotBlank.categoryForm.name");
		} else {
			Category category = dao.getById(id);
			category.setName(entity.getName());
			if (!entity.getImage().isEmpty()) {				
				category.setImage(param.save(entity.getImage()));			
			}
			dao.save(category);
			model.addAttribute("edit", false);
			session.set("nameImage", "");
			return "redirect:/admin/categoryForm/list";
		}
		
		return "manager/categoryForm";
	}
	
}
