package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.ProductCate;
import com.poly.main.Model.ShowCategory;

public interface ProductCateDao extends JpaRepository<ProductCate, Integer>{
	@Query("SELECT new ShowCategory(p.category, count(p.product)) FROM ProductCate p GROUP BY p.category")
	List<ShowCategory> getSelectCategory();
	
	
}
