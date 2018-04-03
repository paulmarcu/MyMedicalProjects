package com.pluralsight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		
		System.out.println("Login!!");
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage() {
		
		return "logout";
	}
	
	@RequestMapping(value="/loginFailed", method=RequestMethod.GET)
	public String loginFailed(ModelMap model) {
		System.out.println("Login Failed");
		
		model.addAttribute("error", "true");
		return "login";
	}

}
