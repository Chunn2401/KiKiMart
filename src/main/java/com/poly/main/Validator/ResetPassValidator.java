package com.poly.main.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Model.ForgotPassword;
import com.poly.main.Model.ResetPassword;

@Component
public class ResetPassValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == ResetPassword.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ResetPassword entity = (ResetPassword) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotBlank.resetPassword.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirm", "NotBlank.resetPassword.confirm");
		
		if(!errors.hasFieldErrors()) {
			if(entity.getConfirm().equals(entity.getPassword()) == false) {
				errors.rejectValue("confirm", "NotDuplicate.resetPassword.confirm");
			}
		}
		
		if(!errors.hasFieldErrors("password")) {
			if(entity.getPassword().length()<7) {
				errors.rejectValue("password", "Min.resetPassword.password");
			}
			if(entity.getPassword().length()>15) {
				errors.rejectValue("password", "Max.resetPassword.password");
			}
		}
	}

}
