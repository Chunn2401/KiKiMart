package com.poly.main.Model;

import java.util.List;

import javax.persistence.OneToMany;

import com.poly.main.Entity.User;
import com.poly.main.Entity.UserRole;

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
public class AppUser {
	private int id;

	private String email;
	private String password;
	private String fullname;

	List<UserRole> userRole;

	public AppUser(String email, String password, String fullname) {
		this.email = email;
		this.password = password;
		this.fullname = fullname;
	}

}
