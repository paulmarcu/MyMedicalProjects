package com.pluralsight.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pluralsight.model.Laborator;

@Repository
public interface LaboratorRepository extends JpaRepository<Laborator, Integer> {

}
