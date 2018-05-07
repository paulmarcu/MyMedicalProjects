package com.pluralsight.service;

import java.util.List;

import com.pluralsight.model.Cabinet;

public interface CabinetService {
	
	Cabinet save(Cabinet cabinet);
	
	List<Cabinet> findAll();
	
	List<Cabinet> allCabinets();

}
