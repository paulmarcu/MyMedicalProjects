package com.pluralsight.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pluralsight.model.Role;
import com.pluralsight.model.User;
import com.pluralsight.service.UserService;
import com.pluralsight.validator.RegisterUserValidator;
import com.pluralsight.validator.UserValidator;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
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
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getPageAddUsers(Model model) {

		model.addAttribute("user", new User());

		return "registration";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addUsers(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

		new RegisterUserValidator().validate(user, result);
		
		
		Role role = new Role();
		
		role.setId(2);
		role.setName("ROLE_USER");

		if (result.hasErrors()) {
			return "registration";
		}
		
		user.setRole(role);
		user.setEnabled(true);
		userService.create(user);

		return "redirect:/login.html";
	}

}
