package com.poly.main.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Model.Categories;

@Component
public class CategoryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz==Categories.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Categories entity = (Categories) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotBlank.categoryForm.name");
		
		
		if(entity.getImage().isEmpty()) {
			errors.rejectValue("image", "NotBlank.categoryForm.image");
		}
	}

}
