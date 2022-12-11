package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.Order;
import com.poly.main.Model.OrderModel;
import com.poly.main.Model.StatisOrder;

public interface OrderDao extends JpaRepository<Order, Integer>{
	@Query("SELECT o FROM Order o WHERE o.name LIKE ?1")
	List<Order> getOrderByName(String name);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status) FROM Order o WHERE o.address.user.id = ?1 GROUP BY o.name, o.date, o.status")
	List<OrderModel> getOrderModel(int id);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status) FROM Order o WHERE o.status = 0 AND o.name LIKE ?1 GROUP BY o.name, o.date, o.status ORDER BY o.date ASC")
	Page<OrderModel> fillTableWOrder(String name, Pageable pageable);
	
	@Query("SELECT new OrderModel(o.name, o.date, sum(o.product.price * o.quality), o.status) FROM Order o WHERE o.status = 1 AND o.name LIKE ?1 GROUP BY o.name, o.date, o.status ORDER BY o.date ASC")
	Page<OrderModel> fillTableWOrder2(String name, Pageable pageable);
	

	@Query("SELECT new StatisOrder(o.product, count(o)) FROM Order o WHERE o.product.name Like ?1 GROUP BY o.product ")
	Page<StatisOrder> fillToTable(String name, Pageable pageable);
}
