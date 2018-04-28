package com.pluralsight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pluralsight.model.Laborator;
import com.pluralsight.service.LaboratorService;

@Controller
@RequestMapping(value = "/laboratory")
public class LaboratorController {
	
	@Autowired
	private LaboratorService laboratorService;
	
	@RequestMapping(value = "/addLaboratory", method = RequestMethod.GET)
	public String getAddLaboratorPage(Model model) {
		
		model.addAttribute("laboratory", new Laborator());
		
		return "addLaborator";
	}
	
	@RequestMapping(value ="/addLaboratory", method = RequestMethod.POST)
	public String processAddLaborator(@ModelAttribute ("laboratory") Laborator laborator) {
		
		laboratorService.save(laborator);
		return "redirect:/laboratory/addLaboratory.html";
	}
	
	@RequestMapping(value = "/allLaboratories", method = RequestMethod.GET)
	public String getAllLaboratoriesPage(Model model) {
		
		List<Laborator> laboratories = laboratorService.findAll();
		model.addAttribute("laboratories", laboratories);
		
		return "allLaboratories";
	}

}
