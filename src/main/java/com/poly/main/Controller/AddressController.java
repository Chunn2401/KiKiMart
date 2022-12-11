package com.poly.main.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

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

import com.poly.main.Dao.AddressDao;
import com.poly.main.Dao.ColorDao;
import com.poly.main.Dao.OrderDao;
import com.poly.main.Dao.ProductDao;
import com.poly.main.Dao.SizeDao;
import com.poly.main.Entity.Address;
import com.poly.main.Entity.Color;
import com.poly.main.Entity.Order;
import com.poly.main.Entity.Product;
import com.poly.main.Entity.Size;
import com.poly.main.Entity.User;
import com.poly.main.Model.AddressModel;
import com.poly.main.Model.Item;
import com.poly.main.Service.MailerServiceImpl;
import com.poly.main.Service.SessionService;
import com.poly.main.Service.ShoppingCartServiceImpl;
import com.poly.main.Validator.AddressValidator;

@Controller
public class AddressController {

	@Autowired
	AddressDao dao;

	@Autowired
	ColorDao colorDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	SizeDao sizeDao;

	@Autowired
	OrderDao orderDao;

	@Autowired
	AddressValidator addressValidator;

	@Autowired
	SessionService sessionService;
	
	@Autowired
	MailerServiceImpl serviceMail;

	@Autowired
	ShoppingCartServiceImpl cart;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		Object target = binder.getTarget();
		if (target == null) {
			return;
		}
		if (target.getClass() == AddressModel.class) {
			binder.setValidator(addressValidator);
		}
	}

	@GetMapping("/shop/checkout")
	public String index(Model model) {
		User user = sessionService.get("userLogin");
		Address address = dao.getAddress(user.getId());
		AddressModel entity = new AddressModel();
		if (address != null) {
			entity.setFirstname(address.getFirstname());
			entity.setLastname(address.getLastname());
			entity.setAddress(address.getAddress());
			entity.setEmail(address.getEmail());
			entity.setPhone(address.getPhone());
			entity.setProvincial(address.getProvincial());
		}
		model.addAttribute("cart", cart);
		model.addAttribute("addressForm", entity);
		return "user/checkout";
	}

	@PostMapping("/shop/checkout")
	public String save(Model model, @ModelAttribute("addressForm") @Validated AddressModel entity,
			BindingResult result) {
		if (result.hasErrors()) {
			return "user/checkout";
		} else {
			User user = sessionService.get("userLogin");
			Address address = dao.getAddress(user.getId());
			if (address == null) {
				address = new Address(entity.getFirstname(), entity.getLastname(), entity.getEmail(), entity.getPhone(),
						entity.getProvincial(), entity.getAddress(), user);
				dao.save(address);
			} else {
				address.setAddress(entity.getAddress());
				address.setEmail(entity.getEmail());
				address.setFirstname(entity.getFirstname());
				address.setLastname(entity.getLastname());
				address.setPhone(entity.getPhone());
				address.setProvincial(entity.getProvincial());
				dao.save(address);
			}
			int code;
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = formatter.format(date);
			while (true) {
				code = (int) Math.floor(((Math.random() * 899999) + 100000));
				List<Order> list = orderDao.getOrderByName(String.valueOf(code));
				if (list.isEmpty()) {
					break;
				}
			}
			List<Item> listItem = new ArrayList<>(cart.getItems());
			for (Item i : listItem) {
				//System.out.println(i.getIdColor());
				Color color;
				Size size;
				if(i.getIdColor() == 0) {
					color = null;
				}
				else {
					color = colorDao.getById(i.getIdColor());
				}
				
				if(i.getIdSize() == 0) {
					size = null;
				}
				else {
					size = sizeDao.getById(i.getIdSize());
				}
				Product product = productDao.getById(i.getId());
				Order order = new Order(String.valueOf(code), false, entity.isPayment(), i.getQuality(), strDate, color,
						size, address, product);
				orderDao.save(order);
			}
			
			//serviceMail.queue(entity.getEmail(), "Xác nhận đơn hàng!", "Code xác nhận của bạn là: " + code);
			cart.clear();
			sessionService.set("countProduct", cart.getCount());
			return "user/thankyou";
		}
	}

	@ModelAttribute("total")
	public int tolal() {
		List<Item> list = new ArrayList<>(cart.getItems());
		int total = 0;
		for (Item i : list) {
			total = total + i.getPrice() * i.getQuality();
		}
		return total;
	}
	
//	public String content(String s) {
//		String s = "";
//	}
}
