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

import com.poly.main.Dao.SizeDao;
import com.poly.main.Entity.Category;
import com.poly.main.Entity.Size;
import com.poly.main.Model.SizeModel;
import com.poly.main.Service.SessionService;

@Controller
public class SizeController {
	@Autowired
	SizeDao dao;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/admin/sizeForm/form")
	public String index(Model model) {
		
		SizeModel entity = new SizeModel();
		
		model.addAttribute("sizeModel", entity);

		return "manager/sizeForm";
	}
	
	@PostMapping("/admin/sizeForm/form")
	public String save(Model model, @ModelAttribute("sizeModel") @Valid SizeModel entity, BindingResult result) {
		if(entity.getName().isEmpty()) {
			result.rejectValue("name", "NotBlank.sizeForm.name");
			return "manager/sizeForm";
		}
		else {
			Size size = new Size();
			size.setName(entity.getName());
			dao.save(size);
			return "redirect:/admin/sizeForm/list";
		}		
	}
	
	@RequestMapping("/admin/sizeForm/list")
	public String list(Model model, @RequestParam("keyword6") Optional<String> name,
			@RequestParam("p") Optional<Integer> p) {
		String findName;
		if (session.get("keyword6") == null) {
			findName = name.orElse("");
		} else {
			findName = name.orElse(session.get("keyword6"));
		}

		session.set("keyword6", findName);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);

		Page<Size> page = dao.fillToTable("%" + findName + "%", pageable);
		model.addAttribute("sizeItem", page);
		
		return "manager/sizeTable";
	}
	
	@RequestMapping("/admin/sizeForm/form/delete/{id}")
	public String delete(Model model, @PathVariable("id") int id) {
		Size entity = dao.getById(id);
		dao.delete(entity);
		return "redirect:/admin/sizeForm/list";
	}
}
