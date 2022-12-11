package com.poly.main.Controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.main.Dao.ColorDao;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.Color;
import com.poly.main.Entity.Size;
import com.poly.main.Model.ColorModel;
import com.poly.main.Model.SizeModel;
import com.poly.main.Service.SessionService;

@Controller
public class ColorController {
	@Autowired
	ColorDao dao;
	
	@Autowired
	SessionService session;
	
	@GetMapping("/admin/colorForm/form")
	public String index(Model model) {
		ColorModel entity = new ColorModel();
		model.addAttribute("colorModel", entity);
		return "manager/colorForm";
	}
	
	@RequestMapping("/admin/colorForm/list")
	public String list(Model model, @RequestParam("keyword7") Optional<String> name,
			@RequestParam("p") Optional<Integer> p) {
		String findName;
		if (session.get("keyword7") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.get("keyword7"));
		}

		session.set("keyword7", findName);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);

		Page<Color> page = dao.fillToTable("%" + findName + "%", pageable);
		model.addAttribute("colorItem", page);

		return "manager/colorTable";
	}
	
	@PostMapping("/admin/colorForm/form")
	public String save(Model model, @ModelAttribute("colorModel") @Valid ColorModel entity, BindingResult result) {
		if(entity.getName().isEmpty()) {
			result.rejectValue("name", "NotBlank.colorForm.name");
			return "manager/colorForm";
		}
		else {
			Color color = new Color(entity.getName());
			//color.setName(entity.getName());
			dao.save(color);
			return "redirect:/admin/colorForm/list";
		}		
	}
	
	@RequestMapping("/admin/colorForm/list/delete/{id}")
	public String delete(Model model, @PathVariable("id") int id) {
		Color entity = dao.getById(id);
		dao.delete(entity);
		return "redirect:/admin/colorForm/list";
	}
}
