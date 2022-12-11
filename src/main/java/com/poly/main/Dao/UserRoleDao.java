package com.poly.main.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.UserRole;

public interface UserRoleDao extends JpaRepository<UserRole, Integer> {
	@Query("SELECT u.id FROM UserRole u WHERE u.user.id = ?1")
	public int findIdUserRole(int id);
	
}
