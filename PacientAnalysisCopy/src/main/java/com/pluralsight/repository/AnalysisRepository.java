package com.pluralsight.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pluralsight.model.Analysis;

@Repository
public interface AnalysisRepository extends JpaRepository<Analysis, Integer> {

	@Query("Select new Analysis(a.id, a.name, a.category, a.minValue, a.maxValue, a.result) from Analysis a join a.user u where u.id = :id")
	List<Analysis> getAllAnalysisById(@Param("id") int id);

	@Query("Select new Analysis(a.name, a.category, a.minValue, a.maxValue, a.result) from Analysis a join a.user u where u.username = :username")
	List<Analysis> getAnalysisByUsername(@Param("username") String username);

	@Query("Select new Analysis(a.name, a.category, a.minValue, a.maxValue, a.result) from Analysis a where a.name = :analysisName")
	Analysis getAnalysisByName(@Param("analysisName") String analysisName);

	@Query("Select new Analysis(a.id, a.name, a.category, a.minValue, a.maxValue, a.result) from Analysis a where a.result < a.minValue or a.result > a.maxValue")
	List<Analysis> getBadAnalysis();
}
