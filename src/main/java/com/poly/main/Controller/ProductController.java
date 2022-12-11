package com.poly.main.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

import com.poly.main.Dao.ManufactureDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Entity.Manufacture;
import com.poly.main.Entity.Product;
import com.poly.main.Model.ManufactureModel;
import com.poly.main.Model.ProductModel;
import com.poly.main.Service.ParamService;
import com.poly.main.Service.SessionService;
import com.poly.main.Validator.ProductValidator;

@Controller
public class ProductController {
	@Autowired
	ProductDao dao;

	@Autowired
	ManufactureDao manuDao;

	@Autowired
	SessionService session;

	@Autowired
	ParamService param;

	@Autowired
	ProductValidator productValidator;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == ProductModel.class) {
			binder.setValidator(productValidator);
		}
	}

	@GetMapping("/admin/productForm/form")
	public String index(Model model) {
		// session.set("nameImage3", "");
		ProductModel entity = new ProductModel();
		model.addAttribute("productForm", entity);
		return "manager/productForm";
	}

	@PostMapping("/admin/productForm/form")
	public String save(Model model, @ModelAttribute("productForm") @Validated ProductModel entity,
			BindingResult result) {
		if (result.hasErrors()) {
			return "manager/productForm";
		}

		else {
			Manufacture manufacture = manuDao.getById(Integer.parseInt(entity.getManufacture()));
			// Manufacture manufacture = manuDao.getById(entity.getManufacture());
			// System.out.println(entity.getManufacture());
			
			//Date date = new Date();
//			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//	        String strDate = formatter.format(entity.getManuDay());
	        
	        String dateStr = entity.getManuDay();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;
			try {
				date = sdf.parse(dateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        sdf = new SimpleDateFormat("yyyy-MM-dd");
	        dateStr = sdf.format(date);
			
			Product product = new Product(entity.getName(), entity.getPrice(), param.save(entity.getImage()),
					entity.getOrigin(), entity.getMaterial(), true, entity.getDescribe(), entity.getReview(),
					manufacture, dateStr);
			dao.save(product);
		}
		return "redirect:/admin/productForm/list";
		// return "manager/productForm";
	}

	@RequestMapping("/admin/productForm/list")
	public String index(Model model, @RequestParam("keyword5") Optional<String> name,
			@RequestParam("p") Optional<Integer> p) {
		String findName;
		if (session.get("keyword5") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.get("keyword5"));
		}

		session.set("keyword5", findName);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);

		Page<Product> page = dao.fillToTable("%" + findName + "%", pageable);
		model.addAttribute("productItem", page);

		return "manager/productTable";
	}

	@RequestMapping("/admin/productForm/list/delete/{id}")
	public String delete(Model model, @PathVariable("id") int id) {
		Product entity = dao.getById(id);
		dao.delete(entity);
		return "redirect:/admin/productForm/list";
	}

	@GetMapping("/admin/productForm/list/load/{id}")
	public String load(Model model, @PathVariable("id") int id) {
		// Manufacture manufacture = dao.getById(id);
		Product product = dao.getById(id);
		// ManufactureModel entity = new ManufactureModel();
		ProductModel entity = new ProductModel();
		entity.setName(product.getName());
		entity.setPrice(product.getPrice());
		entity.setOrigin(product.getOrigin());
		entity.setMaterial(product.getMaterial());
		entity.setDescribe(product.getDescribe());
		entity.setReview(product.getReview());
		entity.setManuDay(product.getManuDay());
		// Manufacture manufacture = manuDao.getById(product.getManufacture().getId());
		// entity.setManufacture(product.getManufacture().getName());
		// entity.setInformation(manufacture.getInformation());
		model.addAttribute("edit3", true);
		model.addAttribute("productForm", entity);
		// session.set("nameImage2", manufacture.getImage());
		session.set("id3", product.getId());
		return "manager/productForm";
	}
	
	@RequestMapping("/admin/productForm/refresh")
	public String refresh() {
		return "redirect:/admin/productForm/form";
	}

	@RequestMapping("/admin/productForm/form/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id, @ModelAttribute("productForm") ProductModel entity,
			BindingResult result) {
		model.addAttribute("edit3", true);
		if (entity.getName().isEmpty()) {
			result.rejectValue("name", "NotBlank.productForm.name");
		}
		
		if (entity.getPrice() == 0) {
			result.rejectValue("price", "NotBlank.productForm.price");
		}

		if (entity.getOrigin().isEmpty()) {
			result.rejectValue("origin", "NotBlank.productForm.origin");
		}
		if (entity.getMaterial().isEmpty()) {
			result.rejectValue("material", "NotBlank.productForm.material");
		}
		if (entity.getDescribe().isEmpty()) {
			result.rejectValue("describe", "NotBlank.productForm.describe");
		}
		if (entity.getManuDay().isEmpty()) {
			result.rejectValue("manuDay", "NotNull.productForm.manuDay");
		}
		if (!result.hasErrors()) {
			// Manufacture manufacture = dao.getById(id);
			System.out.println(entity.getManuDay());
			String dateStr = entity.getManuDay();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;
			try {
				date = sdf.parse(dateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        sdf = new SimpleDateFormat("yyyy-MM-dd");
	        dateStr = sdf.format(date);
	        
			Product product = dao.getById(id);
			product.setName(entity.getName());
			product.setPrice(entity.getPrice());
			product.setOrigin(entity.getOrigin());
			product.setMaterial(entity.getMaterial());
			product.setDescribe(entity.getDescribe());
			product.setReview(entity.getReview());
			product.setManuDay(dateStr);
			Manufacture manufacture = manuDao.getById(Integer.parseInt(entity.getManufacture()));
			product.setManufacture(manufacture);
			if (!entity.getImage().isEmpty()) {
				product.setImage(param.save(entity.getImage()));
			}
			dao.save(product);
			model.addAttribute("edit3", false);
			// session.set("nameImage3", "");
			return "redirect:/admin/productForm/list";
		}

		return "manager/productForm";
	}

	@GetMapping("/admin/productForm/list/enable/{id}")
	public String enable(Model model, @PathVariable("id") int id) {
		Product entity = dao.getById(id);
		entity.setStatus(!entity.isStatus());
		dao.save(entity);
		return "redirect:/admin/productForm/list";
	}

	@ModelAttribute("manufacture")
	public Map<Integer, String> manufacture() {
		Map<Integer, String> map = new HashMap();
		List<Manufacture> list = manuDao.findAll();
		for (Manufacture m : list) {
			map.put(m.getId(), m.getName());
		}
		return map;
	}

}
