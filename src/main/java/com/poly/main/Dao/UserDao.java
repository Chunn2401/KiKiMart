package com.poly.main.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.main.Entity.User;

public interface UserDao extends JpaRepository<User, Integer> {
	@Query("SELECT u FROM User u WHERE u.email = :uemail")
	User findByEmail(@Param("uemail") String email);
	
	@Query("SELECT u.fullname FROM User u WHERE u.email = :uemail")
	String findFullName(@Param("uemail") String email);
	
	@Query("SELECT u FROM User u WHERE u.fullname LIKE ?1")
	Page<User> findByNamePage(String fullname, Pageable pageable);
	
	@Query("SELECT u.user FROM UserRole u WHERE u.role.id != 1 AND u.user.fullname LIKE ?1")
	Page<User> fillUser(String fullname, Pageable pageable);
}
