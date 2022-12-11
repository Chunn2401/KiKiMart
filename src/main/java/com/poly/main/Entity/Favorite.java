package com.poly.main.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name="Favorites")
public class Favorite implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String date;
	
	@ManyToOne
	@JoinColumn(name="User_Id")
	User user;
	
	@ManyToOne
	@JoinColumn(name="Product_Id")
	Product product;

	public Favorite(String date, User user, Product product) {
		super();
		this.date = date;
		this.user = user;
		this.product = product;
	}
	
	
}
