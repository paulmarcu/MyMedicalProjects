package com.pluralsight.model;

import java.sql.Date;
import java.sql.Time;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	
	@ManyToOne
	@JoinColumn(name = "cabinet_id")
	@JsonBackReference
	private Cabinet cabinet;
	
	@ManyToOne
	@JoinColumn(name = "laboratory_id")
	@JsonBackReference
	private Laborator laboratory;

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

	public Cabinet getCabinet() {
		return cabinet;
	}

	public void setCabinet(Cabinet cabinet) {
		this.cabinet = cabinet;
	}

	public Laborator getLaboratory() {
		return laboratory;
	}

	public void setLaboratory(Laborator laboratory) {
		this.laboratory = laboratory;
	}

}
