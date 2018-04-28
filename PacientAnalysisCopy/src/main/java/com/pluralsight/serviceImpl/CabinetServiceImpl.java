package com.pluralsight.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.Cabinet;
import com.pluralsight.repository.CabinetRepository;
import com.pluralsight.service.CabinetService;

@Service
public class CabinetServiceImpl implements CabinetService{

	@Autowired
	private CabinetRepository cabinetRepository;
	
	@Transactional
	public Cabinet save(Cabinet cabinet) {
		
		return cabinetRepository.save(cabinet);
	}
	
	

}
