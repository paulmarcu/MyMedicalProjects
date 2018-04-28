package com.pluralsight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pluralsight.model.Cabinet;
import com.pluralsight.service.CabinetService;

@Controller
@RequestMapping(value = "/cabinet")
public class CabinetController {
	
	@Autowired
	private CabinetService cabinetService;
	
	@RequestMapping(value = "/addCabinet", method = RequestMethod.GET)
	public String createAddCabinetPage(Model model) {
		
		model.addAttribute("cabinet", new Cabinet());
		return "addCabinet";
	}
	
	@RequestMapping(value = "/addCabinet", method = RequestMethod.POST)
	public String processAddCabinet(@ModelAttribute ("cabinet") Cabinet cabinet) {
		
		cabinetService.save(cabinet);
		
		return "redirect:/cabinet/addCabinet.html";
	}

}
