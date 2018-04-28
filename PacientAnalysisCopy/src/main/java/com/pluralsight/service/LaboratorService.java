package com.pluralsight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pluralsight.model.Laborator;

@Service
public interface LaboratorService {
	
	public Laborator save(Laborator laborator);
	
	public List<Laborator> findAll();
	

}
