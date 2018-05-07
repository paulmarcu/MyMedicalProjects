package com.pluralsight.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pluralsight.model.Cabinet;

@Repository
public interface CabinetRepository extends JpaRepository<Cabinet, Integer> {

	@Query("Select new Cabinet(c.id, c.name) from Cabinet c")
	List<Cabinet> cabinetsName();
	
}
