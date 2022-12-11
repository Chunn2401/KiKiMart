package com.poly.main.Entity;

import javax.persistence.Table;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name="User_Role")
public class UserRole implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="User_Id")
	User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="Role_Id")
	Role role;
	
	public UserRole(User user, Role role) {
		this.user = user;
		this.role = role;
	}
}
