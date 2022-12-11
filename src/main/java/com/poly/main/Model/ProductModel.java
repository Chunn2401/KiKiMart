package com.poly.main.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Dao.ManufactureDao;
import com.poly.main.Entity.Manufacture;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class ProductModel {
	
	@Autowired
	ManufactureDao dao;
	
	private int id;
	private String name;
	private int price = 0;
	private MultipartFile image;
	private String origin;
	private String material;
	private String describe;
	private String review;
	private String manufacture;
	private String manuDay;
	//private List<Manufacture> manufacture = dao.findAll();
	//private Map<Integer,String> manufacture;
}
