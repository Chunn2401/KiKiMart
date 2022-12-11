package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.ProductColor;
import com.poly.main.Model.LoadInfo;
import com.poly.main.Model.ShowSelect;

public interface ProductColorDao extends JpaRepository<ProductColor, Integer> {
	@Query("SELECT new ShowSelect(p.color, count(p.product)) FROM ProductColor p WHERE p.product.id IN (SELECT pc.product.id FROM ProductCate pc WHERE pc.category.id = ?1) GROUP BY p.color")
	List<ShowSelect> getSelectColor(int number);
	
	@Query("SELECT new LoadInfo(p) FROM ProductColor p WHERE p.product.id = ?1")
	List<LoadInfo> getLoadImage(int number);
}
