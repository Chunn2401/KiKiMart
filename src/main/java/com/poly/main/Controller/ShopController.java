package com.poly.main.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Dao.CategoryDao;
import com.poly.main.Dao.ManufactureDao;
import com.poly.main.Dao.ProductCateDao;
import com.poly.main.Dao.ProductColorDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Dao.ProductSizeDao;
import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.Product;
import com.poly.main.Model.ShowCategory;
import com.poly.main.Model.ShowSelect;
import com.poly.main.Service.SessionService;
import com.poly.main.Service.ShoppingCartServiceImpl;

@Controller
public class ShopController {
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductCateDao productcateDao;
	

	@Autowired
	UserDao dao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ManufactureDao manuDao;
	
	
	@GetMapping("/shop/{id}")
	public String index(@PathVariable("id") int id, Model model, @RequestParam("p") Optional<Integer> p) {
		sessionService.set("cateId", id);
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		
		Page<Product> list = productDao.fillShopDESC(id, pageable);
		model.addAttribute("shop", list);
		return "user/shop";
	}
	
	@ModelAttribute("nameCate")
	public String nameCate(@PathVariable("id") int id) {
		Category entity = categoryDao.getById(id);
		return entity.getName();
	}
	
	@ModelAttribute("imgCate")
	public String imgCate(@PathVariable("id") int id) {
		Category entity = categoryDao.getById(id);
		return entity.getImage();
	}
	
	@ModelAttribute("procate")
	public List<ShowCategory> procate(Model model) {
		List<ShowCategory> list = productcateDao.getSelectCategory();
		return list;
	}
	

	
	
}
