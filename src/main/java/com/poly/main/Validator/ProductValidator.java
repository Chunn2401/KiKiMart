package com.poly.main.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Entity.Product;
import com.poly.main.Model.ProductModel;

@Component
public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == ProductModel.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ProductModel entity = (ProductModel) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotBlank.productForm.name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "origin", "NotBlank.productForm.origin");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "material", "NotBlank.productForm.material");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "describe", "NotBlank.productForm.describe");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "manuDay", "NotNull.productForm.manuDay");
		
//		if(entity.getManuDay().isEmpty()) {
//			errors.rejectValue("manuDay", "NotBlank.productForm.manuDay");
//		}
		
		if(entity.getPrice() == 0) {
			errors.rejectValue("price", "NotBlank.productForm.price");
		}
		
		if(entity.getImage().isEmpty()) {
			errors.rejectValue("image", "NotBlank.productForm.image");			
		}
	}

}
