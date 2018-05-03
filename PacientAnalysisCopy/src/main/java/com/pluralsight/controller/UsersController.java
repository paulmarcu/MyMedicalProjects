package com.pluralsight.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.pluralsight.model.User;
import com.pluralsight.service.UserService;
import com.pluralsight.validator.UserValidator;

@Controller
@RequestMapping(value = "/user")
public class UsersController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String getPageAddUsers(Model model) {

		model.addAttribute("user", new User());

		return "addUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUsers(@Valid @ModelAttribute("user") User user, BindingResult result) {

		new UserValidator().validate(user, result);

		if (result.hasErrors()) {
			return "addUser";
		}
		
		user.setEnabled(true);
		userService.create(user);

		return "redirect:allUsers.html";
	}

	@RequestMapping(value = "/allUsers", method = RequestMethod.GET)
	public String getAllUsers(Model model) {

		List<User> users = userService.findAllUsers();

		model.addAttribute("users", users);

		return "allUsers";
	}

	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable Integer id) {

		ModelAndView mav = new ModelAndView("userEdit");
		User user = userService.findById(id);

		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.POST)
	public ModelAndView editUser(@ModelAttribute User user, BindingResult result, @PathVariable Integer id,
			final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("user-edit");

		ModelAndView mav = new ModelAndView("redirect:/user/allUsers.html");

		userService.update(user);

		return mav;
	}

	@RequestMapping(value = "userDelete/{idUser}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable("idUser") int idUser, @ModelAttribute("user") User user) {

		userService.delete(idUser);

		return "redirect:/user/allUsers.html";
	}

	@RequestMapping(value = "/userDetails/{id}", method = RequestMethod.GET)
	public String findDetelisUserPage(@PathVariable("id") int id, ModelMap model) {

		User user = userService.findAllDetalis(id);

		model.addAttribute("user", user);

		return "userDetalis";
	}

	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String getInformationAboutUser(Model model, Principal principal) {

		User user = userService.userInfo(principal.getName());

		model.addAttribute("user", user);

		return "oneUserOneDetail";
	}

}
