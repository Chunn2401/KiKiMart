package com.poly.main.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.poly.main.Dao.UserDao;
import com.poly.main.Entity.User;
import com.poly.main.Model.ChangePassword;

@Component
public class ChangePassValidator implements Validator {
	@Autowired
	UserDao userDao;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz==ChangePassword.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ChangePassword entity = (ChangePassword) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", "NotBlank.changePass.fullname");
		
		if(!entity.getOldPassword().isEmpty()) {
			User user = userDao.findByEmail(entity.getEmail());
			if(passwordEncoder.matches(entity.getOldPassword(), user.getPassword()) == false) {
				errors.rejectValue("oldPassword", "NotDuplicate.changePass.oldPassword");
			}
			else {
				if(entity.getNewPassword().isEmpty()) {
					errors.rejectValue("newPassword", "NotBlank.changePass.newPassword");
				}
				else {
					if(entity.getNewPassword().length()<7) {
						errors.rejectValue("newPassword", "Min.changePass.newPassword");
					}
					if(entity.getNewPassword().length()>15) {
						errors.rejectValue("newPassword", "Max.changePass.newPassword");
					}
				}
				if(entity.getConfirm().isEmpty()) {
					errors.rejectValue("confirm", "NotBlank.changePass.confirm");
				}
				if((!entity.getNewPassword().isEmpty())&&(!entity.getConfirm().isEmpty())) {
					if(!entity.getNewPassword().equals(entity.getConfirm())) {
						errors.rejectValue("confirm", "NotDuplicate.changePass.confirm");
					}
				}
			}
		}
	}

}
