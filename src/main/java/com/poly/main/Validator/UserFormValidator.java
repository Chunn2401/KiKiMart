package com.poly.main.Validator;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.UserModel;



@Component
public class UserFormValidator implements Validator {
	@Autowired
	UserDao dao;
	
	private EmailValidator emailValidator = EmailValidator.getInstance();
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == UserModel.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserModel entity = (UserModel) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotBlank.userModel.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotBlank.userModel.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirm", "NotBlank.userModel.confirm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotBlank.userModel.fullname");
	
			
		
		if(!errors.hasFieldErrors("email")) {
			if(!this.emailValidator.isValid(entity.getEmail())) {
				errors.rejectValue("email", "Pattern.userModel.email");
			}
			User user = dao.findByEmail(entity.getEmail());
			if(user != null) {
				errors.rejectValue("email", "Duplicate.userModel.email");
			}
		}
		
		if(!errors.hasFieldErrors("password")) {
			if(entity.getPassword().length()<7) {
				errors.rejectValue("password", "Min.userModel.password");
			}
			if(entity.getPassword().length()>15) {
				errors.rejectValue("password", "Max.userModel.password");
			}
		}
		
		if(!errors.hasFieldErrors("confirm")) {
			if(entity.getPassword().equals(entity.getConfirm()) == false) {
				errors.rejectValue("confirm", "NotDuplicate.userModel.confirm");
			}
		}
	}

}
