package com.pluralsight.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.Analysis;

import com.pluralsight.repository.AnalysisRepository;
import com.pluralsight.service.AnalysisService;

@Service
public class AnalysisServiceImpl implements AnalysisService {

	@Autowired
	private AnalysisRepository analysisRepo;

	public Analysis create(Analysis analysis) {

		return analysisRepo.save(analysis);
	}

	public Analysis delete(int id) {

		Analysis analysisDeleted = analysisRepo.findOne(id);

		analysisRepo.delete(analysisDeleted);

		return analysisDeleted;
	}

	public List<Analysis> findAll() {

		return analysisRepo.findAll();
	}

	@Transactional
	public List<Analysis> gettAllAnalysisById(int id) {

		return analysisRepo.getAllAnalysisById(id);
	}

	@Transactional
	public List<Analysis> getAllAnalysisByUsername(String username) {

		return analysisRepo.getAnalysisByUsername(username);
	}

	@Transactional
	public Analysis getAnalysisByName(String analysisName) {

		return analysisRepo.getAnalysisByName(analysisName);
	}

	@Transactional
	public Analysis update(Analysis analysis) {

		Analysis updatedAnalysis = analysisRepo.findOne(analysis.getId());

		updatedAnalysis.setName(analysis.getName());
		updatedAnalysis.setCategory(analysis.getCategory());
		updatedAnalysis.setResult(analysis.getResult());
		updatedAnalysis.setMinValue(analysis.getMinValue());

		return updatedAnalysis;
	}

	@Transactional
	public Analysis findById(int id) {

		return analysisRepo.findOne(id);
	}

	@Transactional
	public List<Analysis> getBadAnalysis() {

		return analysisRepo.getBadAnalysis();
	}

}
