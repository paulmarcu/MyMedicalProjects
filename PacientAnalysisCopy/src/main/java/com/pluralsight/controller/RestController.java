package com.pluralsight.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pluralsight.model.Cabinet;
import com.pluralsight.model.Category;
import com.pluralsight.model.City;
import com.pluralsight.model.Country;
import com.pluralsight.model.Gender;
import com.pluralsight.model.Role;
import com.pluralsight.model.User;
import com.pluralsight.service.AnalysisService;
import com.pluralsight.service.CabinetService;
import com.pluralsight.service.RoleService;
import com.pluralsight.service.UserService;

@Controller
@RequestMapping("/rest")
public class RestController {

	@Autowired
	private UserService userService;

	@Autowired
	private AnalysisService analysisService;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private CabinetService cabinetService;

	@RequestMapping(value = "/getTypes", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Gender> getAllTypes() {

		List<Gender> genders = userService.findAllTypes();

		return genders;
	}

	@RequestMapping(value = "/getRoles", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Role> getAllRoles() {

		List<Role> roles = roleService.getAllRoles();

		return roles;
	}
	
	@RequestMapping(value = "/onOffValue", method = RequestMethod.GET)
	public @ResponseBody List<Integer> onAndOffValue(){
		
		
		List<Integer> resultOnOff = new ArrayList<Integer>();
		
		int onValue = 1;
		int offValue = 0;
		
		resultOnOff.add(onValue);
		resultOnOff.add(offValue);
		
		return resultOnOff;
	}
	
	@RequestMapping(value = "/infoFromUsers", method = RequestMethod.GET)
	public @ResponseBody List<User> allInfoFromUsers(){
		
		List<User> users = userService.InfoFromAllUsers();
		
		return users;
		
	}
	
	@RequestMapping(value = "/allCategories", method = RequestMethod.GET)
	public @ResponseBody List<Category> allCategories(){
		
		List<Category> categories = analysisService.allCategoriesForAnalysis();
		
		return categories;
		
	}
	
	@RequestMapping(value = "/allCities", method = RequestMethod.GET)
	public @ResponseBody List<City> allCities(){
		
		List<City> cities = userService.allCities();
		
		return cities;
	}
	
	@RequestMapping(value = "/allCountries", method = RequestMethod.GET)
	public @ResponseBody List<Country> allCountries(){
		
		List<Country> countries = userService.allCountries();
		
		return countries;
		
	}
	
	@RequestMapping(value = "/allCabinets", method = RequestMethod.GET)
	public @ResponseBody List<Cabinet> allCabinets(){
		
		List<Cabinet> cabinets = cabinetService.allCabinets();
		
		return cabinets;
		
	}

	/*
	 * @RequestMapping(value = "/getUser/{name}", method = RequestMethod.GET)
	 * public @ResponseBody User getUser(@PathVariable ("name") String userName) {
	 * 
	 * User user = new User();
	 * 
	 * user.setUsername(userName); user.setEmail(userName + "@yahoo.com");
	 * 
	 * return user;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/getUser/{name}", method = RequestMethod.PUT)
	 * public @ResponseBody boolean updateUser(@PathVariable ("name") String
	 * username, @RequestBody User user ) {
	 * 
	 * System.out.println("Student name: " + username);
	 * System.out.println("Student name: " + user.getUsername() + " Student email: "
	 * + user.getEmail());
	 * 
	 * 
	 * return true; }
	 * 
	 * @RequestMapping(value = "/hello", method = RequestMethod.GET)
	 * public @ResponseBody List<Greeating> getGreatings(){
	 * 
	 * Greeating g = new Greeating(); Greeating g1 = new Greeating();
	 * 
	 * g.setId(1); g.setContent("Hello!");
	 * 
	 * g1.setId(2); g1.setContent("Bye!");
	 * 
	 * List<Greeating> gre = new ArrayList<Greeating>();
	 * 
	 * gre.add(g); gre.add(g1);
	 * 
	 * return gre;
	 * 
	 * }
	 */

}
