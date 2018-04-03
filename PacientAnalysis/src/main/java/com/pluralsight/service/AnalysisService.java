package com.pluralsight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pluralsight.model.Analysis;

@Service
public interface AnalysisService {
	
	Analysis create(Analysis analysis);
	
	Analysis delete(int id);
	
	List<Analysis> findAll();
	
	Analysis update(Analysis analysis);
	
	Analysis findById(int id);
	
	List<Analysis> gettAllAnalysisById(int id);
	
	List<Analysis> getAllAnalysisByUsername(String username);
	
	Analysis getAnalysisByName(String analysisName);
	
	List<Analysis> getBadAnalysis();

}