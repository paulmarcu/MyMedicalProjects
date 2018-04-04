package com.pluralsight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pluralsight.model.Gender;
import com.pluralsight.service.AnalysisService;
import com.pluralsight.service.UserService;

@Controller
@RequestMapping("/rest")
public class RestController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AnalysisService analysisService;
	
	@RequestMapping(value = "/getTypes", method = RequestMethod.GET)
	public @ResponseBody List<Gender> getAllTypes(){
		
		List<Gender> genders = userService.findAllTypes();
		
		return genders;
	}
	
}
