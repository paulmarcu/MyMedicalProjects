package com.pluralsight.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "analysis")
public class Analysis implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "min_value")
	private double minValue;
	
	@Column(name = "max_value")
	private double maxValue;
	
	@Column(name = "result")
	private double result;
	
	
	@ManyToOne
	@JsonBackReference
	private User user;
	
	public Analysis() {}
	
	public Analysis(String name, String category, double minValue, double maxValue, double result) {
		
		this.name = name;
		this.category = category;
		this.minValue = minValue;
		this.maxValue = maxValue;
		this.result = result;
	}
	
	public Analysis(int id,String name, String category, double minValue, double maxValue, double result) {
		
		this.id = id;
		this.name = name;
		this.category = category;
		this.minValue = minValue;
		this.maxValue = maxValue;
		this.result = result;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	@Override
	public String toString() {
		return "Analysis [id=" + id + ", name=" + name + ", category=" + category + ", minValue=" + minValue
				+ ", maxValue=" + maxValue + ", result=" + result + ", user=" + user + "]";
	}

}
