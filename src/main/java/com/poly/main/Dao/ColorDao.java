package com.poly.main.Dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.Color;

public interface ColorDao extends JpaRepository<Color, Integer> {
	@Query("SELECT c FROM Color c WHERE c.name LIKE ?1")
	Page<Color> fillToTable(String name, Pageable pageable);
}
