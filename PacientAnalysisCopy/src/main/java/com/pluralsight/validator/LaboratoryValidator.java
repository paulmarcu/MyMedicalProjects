package com.pluralsight.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.pluralsight.model.Laborator;

public class LaboratoryValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		return Laborator.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {

		Laborator laborator = (Laborator) target;

		if (laborator.getName() == null || laborator.getName().equals("")) {
			errors.reject("name", null, "Please enter a valid laboratory name!");
		}

		if (laborator.getAddress() == null || laborator.getAddress().equals("")) {
			errors.reject("address", null, "Please enter a valid address!");
		}

		if (laborator.getCity() == null || laborator.getCity().equals("")) {
			errors.reject("city", null, "Please enter a valid city!");
		}

		if (laborator.getCountry() == null || laborator.getCountry().equals("")) {
			errors.reject("country", null, "Please enter a valid country!");
		}

		if (laborator.getPhone() == null || laborator.getPhone().equals("") || laborator.getPhone().length() != 10) {
			errors.reject("phone", null, "Please enter a valid phone number!");
		}

	}

}
