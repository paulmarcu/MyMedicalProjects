package com.pluralsight.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pluralsight.model.Cabinet;
import com.pluralsight.service.CabinetService;
import com.pluralsight.validator.CabinetValidator;

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
	public String processAddCabinet(@Valid @ModelAttribute ("cabinet") Cabinet cabinet, BindingResult result) {
		
		new CabinetValidator().validate(cabinet, result);
		
		if(result.hasErrors()) {
			return "addCabinet";
		}
		
		cabinetService.save(cabinet);
		
		return "redirect:/cabinet/addCabinet.html";
	}
	
	@RequestMapping(value = "/allCabinets", method = RequestMethod.GET)
	public String getAllCabineties(Model model) {
		
		List<Cabinet> cabinets = cabinetService.findAll();
		
		model.addAttribute("cabinets", cabinets);
		
		return "allCabineties";
	}

}
