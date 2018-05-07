package com.pluralsight.serviceImpl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.Appointment;
import com.pluralsight.repository.AppointmentRepository;
import com.pluralsight.service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService {
	
	@Autowired
	private AppointmentRepository appointmentRepository;

	@Transactional
	public Appointment create(Appointment appointment) {
		
		return appointmentRepository.save(appointment);
	}

	public Appointment update(Appointment appointment) {
		
		Appointment updatedAppointment =appointmentRepository.findOne(appointment.getId());
		
		updatedAppointment.setDate(appointment.getDate());
		updatedAppointment.setTime(appointment.getTime());
		updatedAppointment.setLaboratory(appointment.getLaboratory());
//		updatedAppointment.setCabinet(appointment.getCabinet());
		
		return updatedAppointment;
	}

	public Appointment findById(int id) {
		
		return appointmentRepository.findOne(id);
	}

	@Transactional
	public Appointment searchByDate(Date date, String city, String country) {
		
		return appointmentRepository.searchByDate(date, country, city);
	}
	
	
	
	

}
