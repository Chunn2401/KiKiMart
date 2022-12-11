package com.poly.main.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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

@Entity
@Table(name="Products")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private int price;
	private String image;
	private String origin;
	private String material;
	private boolean status;
	private String describe;
	private String review;
	private int views = 0;
	@Column(name="Manuday")
	private String manuDay;
	
	@ManyToOne
	@JoinColumn(name = "Manu_Id")
	Manufacture manufacture;
	
	@OneToMany(mappedBy = "product")
	List<ProductCate> productManu;
	
	@OneToMany(mappedBy = "product")
	List<ProductColor> productColor;
	
	@OneToMany(mappedBy = "product")
	List<ProductSize> productSize;

	public Product(String name, int price, String image, String origin, String material, boolean status,
			String describe, String review, Manufacture manufacture, String manuDay) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
		this.origin = origin;
		this.material = material;
		this.status = status;
		this.describe = describe;
		this.review = review;
		this.manufacture = manufacture;
		this.manuDay = manuDay;
	}
	
	
	
}
