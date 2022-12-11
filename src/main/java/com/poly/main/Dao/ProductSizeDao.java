package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.ProductSize;
import com.poly.main.Model.ShowSelect;

public interface ProductSizeDao extends JpaRepository<ProductSize, Integer> {
	@Query("SELECT new ShowSelect(p.size, count(p.product)) FROM ProductSize p WHERE p.product.id IN (SELECT pc.product.id FROM ProductCate pc WHERE pc.category.id = ?1) GROUP BY p.size")
	List<ShowSelect> getSelectSize(int number);
	
	@Query("SELECT p FROM ProductSize p WHERE p.product.id = ?1")
	List<ProductSize> getSizeProduct(int number);
}
