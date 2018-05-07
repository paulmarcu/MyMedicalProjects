package com.pluralsight.repository;

import java.sql.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pluralsight.model.Appointment;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Integer> {

	@Query("Select a from Appointment a join a.cabinet c where a.date =:date and c.country = :country and c.city = :city")
	public Appointment searchByDate(@Param("date") Date date, @Param("country") String country,
			@Param("city") String city);

}
