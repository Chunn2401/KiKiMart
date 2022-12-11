package com.poly.main.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Model.ManufactureModel;

@Component
public class ManufactureValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == ManufactureModel.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ManufactureModel entity = (ManufactureModel) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotBlank.manuForm.name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "information", "NotBlank.manuForm.information");
		
		if(entity.getImage().isEmpty()) {
			errors.rejectValue("image", "NotBlank.manuForm.image");
		}
	}

}
