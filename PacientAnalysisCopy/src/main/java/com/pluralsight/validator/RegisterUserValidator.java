package com.pluralsight.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.pluralsight.model.User;

public class RegisterUserValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		return User.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {

		User user = (User) target;

		// validate if user have First Name null value or have whitespace

		if (user.getFirstName() == null || user.getFirstName().equals("")) {
			errors.rejectValue("firstName", null, "Please enter valid first name!");
		}

		// validate if user have Last Name null value or have whitespace

		if (user.getLastName() == null || user.getLastName().equals("")) {
			errors.reject("lastName", null, "Please enter valid last name!");
		}

		// validate whitespace and null value for city

		if (user.getCity() == null || user.getCity().equals("")) {
			errors.reject("city", null, "Please enter valid city!");
		}

		// validate the address for whitespace and null value

		if (user.getAddress() == null || user.getAddress().equals("")) {
			errors.reject("address", null, "Please enter valid adress!");
		}

		// validate the email

		if (user.getEmail().contains("@yahoo.com") || user.getEmail().contains("@gmail.com")) {
		} else if (user.getEmail() == null || user.getEmail().equals("")) {
			errors.reject("email", null, "Please enter valid email!");
		}

		else {
			errors.reject("email", null, "Please enter valid email!");
		}

		// validate username

		if (user.getUsername() == null || user.getUsername().equals("")) {
			errors.reject("username", null, "Please enter a username!");
		}

		// validate cnp

		if (user.getCnp() == null || user.getCnp().equals("")) {
			errors.reject("cnp", null, "Please enter your cnp!");
		} else if (user.getCnp().length() != 10) {
			errors.reject("cnp", null, "Enter a valid cnp!");
		}

		// validate phone number

		if (user.getPhone() == null || user.getPhone().equals("")) {
			errors.reject("phone", null, "Please enter your phone number!");
		} else if (user.getPhone().length() != 10) {
			errors.reject("phone", null, "Please enter a valid phone number!");
		}

		// validate password

		if (user.getPassword() == null || user.getPassword().equals("")) {
			errors.reject("password", null, "Please enter a password!");
		} else if (user.getPassword().length() < 5) {
			errors.reject("password", null, "Password needs to have minimum 6 or more charachters!");
		}

		// validate gender

		if (user.getGender() == null || user.getGender().equals("")) {
			errors.reject("gender", null, "Please select a gender!");
		}

		// validate age

		if (user.getAge() <= 0) {
			errors.reject("age", null, "Please enter a valid age!");
		}

		// validate country

		if (user.getCountry() == null || user.getCountry().equals("")) {
			errors.reject("country", null, "Please enter a valid country!");
		}

	}

}
