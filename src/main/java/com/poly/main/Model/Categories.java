package com.poly.main.Model;

import org.springframework.web.multipart.MultipartFile;

import com.poly.main.Entity.Category;

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
public class Categories {
	private int id;
	
	private String name;

	private MultipartFile image;
	
}
