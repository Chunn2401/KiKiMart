package com.poly.main.Validator;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.UserRegister;

@Component
public class UserRegisterValidator implements Validator {
	@Autowired
	UserDao dao;
	
	private EmailValidator emailValidator = EmailValidator.getInstance();
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == UserRegister.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserRegister entity = (UserRegister) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotBlank.userRegister.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotBlank.userRegister.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotBlank.userRegister.code");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirm", "NotBlank.userRegister.confirm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotBlank.userRegister.fullname");
	
		if(!this.emailValidator.isValid(entity.getEmail())) {
			errors.rejectValue("email", "Pattern.userRegister.email");
		}
		
		if(!errors.hasFieldErrors("email")) {
			User user = dao.findByEmail(entity.getEmail());
			if(user != null) {
				errors.rejectValue("email", "Duplicate.userRegister.email");
			}
		}
		
		if(!errors.hasFieldErrors("password")) {
			if(entity.getPassword().length()<7) {
				errors.rejectValue("password", "Min.userRegister.password");
			}
			if(entity.getPassword().length()>15) {
				errors.rejectValue("password", "Max.userRegister.password");
			}
		}
		
		if(!errors.hasFieldErrors("confirm")) {
			if(entity.getPassword().equals(entity.getConfirm()) == false) {
				errors.rejectValue("confirm", "NotDuplicate.userRegister.password");
			}
		}
	}

}
