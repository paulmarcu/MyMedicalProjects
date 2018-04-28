package com.pluralsight.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.pluralsight.model.Analysis;

public class AnalysisValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		return Analysis.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {

		Analysis analysis = (Analysis) target;

		// validate name of analysis

		if (analysis.getName() == null || analysis.getName().equals("")) {
			errors.reject("name", null, "Please enter a name!");
		}

		// validate category of analysis

		if (analysis.getCategory() == null || analysis.getCategory().equals("")
				|| analysis.getCategory().contains("--")) {
			errors.reject("category", null, "Please enter a valid category!");
		}

		// validate minimum value

		if (analysis.getMinValue() <= 0.0) {
			errors.reject("minValue", null, "Please enter a minimum value valid!");
		}

		// validate maxim value

		if (analysis.getMaxValue() <= 0.0) {
			errors.reject("maxValue", null, "Please enter a maxim value valid!");
		}

		// validate result value

		if (analysis.getResult() <= 0.0) {
			errors.reject("result", null, "Please enter a valid result value!");
		}

		// validate user id

		if (analysis.getUser().getId() == 0) {
			errors.reject("analysis.user.id", null, "Please select a valid user!");
		}

	}

}
