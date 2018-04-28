package com.pluralsight.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pluralsight.model.Laborator;
import com.pluralsight.repository.LaboratorRepository;
import com.pluralsight.service.LaboratorService;

@Service
public class LaboratorServiceImpl implements LaboratorService{
	
	@Autowired
	private LaboratorRepository laboratorRepository;

	@Transactional
	public Laborator save(Laborator laborator) {
		return laboratorRepository.save(laborator);
	}

	@Transactional
	public List<Laborator> findAll() {
		
		List<Laborator> laboratories = laboratorRepository.findAll();
		
		return laboratories;
	}

}
