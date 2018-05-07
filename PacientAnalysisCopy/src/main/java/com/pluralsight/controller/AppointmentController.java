package com.pluralsight.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pluralsight.model.Appointment;
import com.pluralsight.model.User;
import com.pluralsight.service.AppointmentService;
import com.pluralsight.service.UserService;

@Controller
@RequestMapping(value = "/appointment")
public class AppointmentController {

	@Autowired
	private AppointmentService appointmentService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/makeAppointmentCabinet", method = RequestMethod.GET)
	public String getMakeAppointmentToCabinetPage(Model model) {

		model.addAttribute("appointment", new Appointment());

		return "addAppointmentToCabinet";
	}

	@RequestMapping(value = "/makeAppointmentCabinet", method = RequestMethod.POST)
	public String makeAppointmentToCabinet(@ModelAttribute("appointment") Appointment appointment,
			Principal principal) {

		User user = userService.userInfo(principal.getName());

		System.out.println(user.getUsername());

		appointment.setUser(user);
		appointment.setActive(true);

		appointmentService.create(appointment);

		return "redirect:/appointment/makeAppointmentCabinet.html";
	}

	@RequestMapping(value = "/makeAppointmentLaboratory", method = RequestMethod.GET)
	public String getMakeAppointmentToLaboratoryPage(Model model) {

		model.addAttribute("appointment", new Appointment());

		return "addAppointmentToLaboratory";
	}

	@RequestMapping(value = "/makeAppointmentLaboratory", method = RequestMethod.POST)
	public String makeAppointmentToLaboratoryPage(Model model, @ModelAttribute("appointment") Appointment appointment,
			Principal principal) {

		User user = userService.userInfo(principal.getName());

		appointment.setUser(user);
		appointment.setActive(true);

		appointmentService.create(appointment);

		return "redirect:/appointment/makeAppointmentLaboratory.html";
	}
	
	@RequestMapping(value = "/searchByDate", method = RequestMethod.GET)
	public String searchByDatePage(Model model) {
		
		Appointment appointment = new Appointment();
		
		model.addAttribute("appointment", appointment);
		
		return "searchByDate";
	}
	
	@RequestMapping(value = "/searchByDate", method = RequestMethod.POST)
	public String processSearch(@ModelAttribute ("appointment") Appointment appointment) {
		
		Appointment appointmentSearched = appointmentService.searchByDate(appointment.getDate(), appointment.getCabinet().getCity(), appointment.getCabinet().getCountry());
		
		System.out.println(appointmentSearched.getId());
		
		return "redirect:/appointment/makeAppointmentCabinet?appointment=appointmentSearched.html";
	}
	
}
