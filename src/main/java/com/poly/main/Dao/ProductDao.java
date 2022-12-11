package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.main.Entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	@Query("SELECT p FROM Product p WHERE p.name LIKE ?1")
	Page<Product> fillToTable(String name, Pageable pageable);
	
	@Query(value="select * from Products where id not in (select p.Product_Id from Product_Cate p inner join Categories c on p.Cate_Id = c.id WHERE c.id = :uid)", nativeQuery = true)
	List<Product> findProduct(@Param("uid") int id);
	
	@Query(value="select * from Products where id not in (select p.Product_Id from Product_Size p inner join Sizes c on p.Size_Id = c.id WHERE c.id = :uid)", nativeQuery = true)
	List<Product> findSize(@Param("uid") int id);
	
	@Query(value="select * from Products where id not in (select p.Product_Id from Product_Color p inner join Colors c on p.Color_Id = c.id WHERE c.id = :uid)", nativeQuery = true)
	List<Product> findColor(@Param("uid") int id);
	
	@Query(value="select TOP(8) * from Products Where Status = 1 order by views DESC", nativeQuery = true)
	List<Product> fillViewsDESC();
	
	@Query(value="select TOP(8) * from Products Where Status = 1 order by ManuDay DESC", nativeQuery = true)
	List<Product> fillDateDESC();
	
	@Query(value="SELECT * FROM Products WHERE Status = 1 AND Id In (SELECT Product_Id From Product_Cate WHERE Cate_Id = ?1) order by ManuDay DESC", nativeQuery = true)
	Page<Product> fillShopDESC(int number1 , Pageable pageable);
	
	@Query("SELECT p FROM Product p WHERE p.manufacture.id = (SELECT p.manufacture.id FROM Product p WHERE p.id = ?1)")
	List<Product> fillBonusProduct(int number);
	
	
}
