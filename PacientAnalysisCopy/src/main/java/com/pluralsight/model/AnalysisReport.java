package com.pluralsight.model;

public class AnalysisReport {
	
	private String name;
	private String category;
	private double minValue;
	private double maxValue;
	private double result;
	
	public AnalysisReport() {}
	
	public AnalysisReport(String name, String category, double minValue, double maxValue, double result) {
		this.name = name;
		this.category = category;
		this.minValue = minValue;
		this.maxValue = maxValue;
		this.result = result;
	}

	public String getCategory() {
		return category;
	}

	public double getMaxValue() {
		return maxValue;
	}

	public double getMinValue() {
		return minValue;
	}

	public String getName() {
		return name;
	}

	public double getResult() {
		return result;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setMaxValue(double maxValue) {
		this.maxValue = maxValue;
	}

	public void setMinValue(double minValue) {
		this.minValue = minValue;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setResult(double result) {
		this.result = result;
	}

	
	
}
