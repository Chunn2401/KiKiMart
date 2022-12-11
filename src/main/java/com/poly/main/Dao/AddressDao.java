package com.poly.main.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.main.Entity.Address;

public interface AddressDao extends JpaRepository<Address, Integer> {
	@Query("SELECT a FROM Address a Where a.user.id = ?1")
	Address getAddress(int id);
}
