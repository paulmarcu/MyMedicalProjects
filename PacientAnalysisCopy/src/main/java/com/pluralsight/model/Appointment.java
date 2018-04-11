package com.pluralsight.model;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Table(name = "appointment")
@Entity
public class Appointment {
	
	@Id
	@GeneratedValue
	private int id;
	
	@Column(name = "date")
	private Date date;
	
	@Column(name = "time")
	private Time time;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	@JsonBackReference
	private User user;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "appointment_laborator",
	joinColumns = {@JoinColumn(name = "appointment_id")},
	inverseJoinColumns = {@JoinColumn(name = "laborator_id")})
	private List<Laborator> laborators = new ArrayList<Laborator>();
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "appointment_cabinet",
	joinColumns = {@JoinColumn(name = "appointment_id")},
	inverseJoinColumns = {@JoinColumn(name = "cabinet_id")})
	private List<Cabinet> cabinets = new ArrayList<Cabinet>();
	
	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public List<Cabinet> getCabinets() {
		return cabinets;
	}

	public void setCabinets(List<Cabinet> cabinets) {
		this.cabinets = cabinets;
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

	public List<Laborator> getLaborators() {
		return laborators;
	}

	public void setLaborators(List<Laborator> laborators) {
		this.laborators = laborators;
	}
	
	

}
