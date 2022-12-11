package com.poly.main.Model;

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

public class Item {
	private int id;
	private int idColor;
	private int idSize;
	private String name;
	private String image;
	private int quality;
	private int price;
}
