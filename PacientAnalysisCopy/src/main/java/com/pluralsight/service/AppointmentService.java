package com.pluralsight.service;

import java.sql.Date;

import com.pluralsight.model.Appointment;

public interface AppointmentService {
	
	Appointment create(Appointment appointment);
	Appointment update(Appointment appointment);
	Appointment findById(int id);
	Appointment searchByDate(Date date, String city, String country);

}
