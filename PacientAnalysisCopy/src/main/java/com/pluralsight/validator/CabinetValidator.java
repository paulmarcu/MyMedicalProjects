package com.pluralsight.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.pluralsight.model.Cabinet;

public class CabinetValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		return Cabinet.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {

		Cabinet cabinet = (Cabinet) target;

		if (cabinet.getName() == null || cabinet.getName().equals("")) {
			errors.reject("name", null, "Please enter a valid cabinet name!");
		}

		if (cabinet.getAddress() == null || cabinet.getAddress().equals("")) {
			errors.reject("address", null, "Please enter a valid address!");
		}
		if (cabinet.getCity() == null || cabinet.getCity().equals("")) {
			errors.reject("city", null, "Please enter a valid city!");
		}
		if (cabinet.getCountry() == null || cabinet.getCountry().equals("")) {
			errors.reject("country", null, "Please enter a valid country!");
		}
		if (cabinet.getPhone() == null || cabinet.getPhone().equals("") || cabinet.getPhone().length() != 10) {
			errors.reject("phone", null, "Please enter a valid phone number!");
		}
	}

}
