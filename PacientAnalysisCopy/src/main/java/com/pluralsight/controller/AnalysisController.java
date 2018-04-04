package com.pluralsight.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pluralsight.model.Analysis;
import com.pluralsight.model.User;
import com.pluralsight.service.AnalysisService;
import com.pluralsight.service.UserService;

@Controller
@RequestMapping(value = "/analysis")
public class AnalysisController {

	@Autowired
	private AnalysisService analysisService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/addAnalysis", method = RequestMethod.GET)
	public String getAddAnalysisPage(Model model) {

		model.addAttribute("analysis", new Analysis());

		return "addAnalysis";
	}

	@RequestMapping(value = "addAnalysis", method = RequestMethod.POST)
	public String addAnalysis(@ModelAttribute("analysis") Analysis analysis, BindingResult result) {

		System.out.println("The error is: " + result.hasErrors());
		analysisService.create(analysis);
		System.out.println("The analysis " + analysis.getName() + " was added with succes! ");

		return "redirect:allAnalysises.html";
	}

	@RequestMapping(value = "/allAnalysises", method = RequestMethod.GET)
	public String getAllAnalysis(Model model) {

		List<Analysis> analysises = analysisService.findAll();

		model.addAttribute("analysises", analysises);

		return "allAnalysis";
	}

	@RequestMapping(value = "/editAnalysis/{id}", method = RequestMethod.GET)
	public ModelAndView editAnalysisPage(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("AnalysisEdit");
		Analysis analysis = analysisService.findById(id);
		mav.addObject("analysis", analysis);
		return mav;
	}
	
	@RequestMapping(value = "/editAnalysis/{id}", method = RequestMethod.POST)
	public ModelAndView editAnalysis(@ModelAttribute @Valid Analysis analysis, BindingResult result,
			@PathVariable int id, final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("AnalysisEdit");

		ModelAndView mav = new ModelAndView("redirect:/analysis/allAnalysises.html");

		analysisService.update(analysis);

		return mav;
	}

	@RequestMapping(value = "analysisDelete/{id}", method = RequestMethod.GET)
	public String deleteAnalysis(Model model, @ModelAttribute Analysis analysis, @PathVariable int id) {

		analysisService.delete(id);

		return "redirect:/analysis/allAnalysises.html";
	}

	@RequestMapping(value = "/analysisReport/{id}", method = RequestMethod.GET)
	public String getAllAnalysisById(@PathVariable("id") int id, Model model) {

		List<Analysis> analysis = analysisService.gettAllAnalysisById(id);

		model.addAttribute("analysises", analysis);

		return "allAnalysisUser";
	}

	@RequestMapping(value = "/myAnalysis", method = RequestMethod.GET)
	public String getAllAnalysisByUsername(Model model, Principal principal) {

		List<Analysis> analysises = analysisService.findAll();
		List<Analysis> myAnalysisForUser = new ArrayList<Analysis>();
		List<Analysis> myBadAnalysis = analysisService.getBadAnalysis();
		List<Analysis> badAnalysisFind = new ArrayList<Analysis>();
		User myUser = userService.userInfo(principal.getName());
		
		for (Analysis analysis : analysises) {
			if (analysis.getUser().getId() == myUser.getId() ) {
				myAnalysisForUser.add(analysis);
			}
		}
		
		for(Analysis badAnalysis : myBadAnalysis) {
			for(Analysis findAnalysis : myAnalysisForUser) {
				if(badAnalysis.getId() == findAnalysis.getId()) {
					badAnalysisFind.add(badAnalysis);
				}
			}
		}
		
		model.addAttribute("badAnalysis", badAnalysisFind);
		model.addAttribute("analysises", myAnalysisForUser);

		return "analysisForUser";
	}
	
}
