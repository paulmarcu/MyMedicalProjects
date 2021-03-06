package com.pluralsight.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.City;
import com.pluralsight.model.Country;
import com.pluralsight.model.Gender;
import com.pluralsight.model.User;
import com.pluralsight.repository.UserRepository;
import com.pluralsight.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;

	@Transactional
	public User create(User user) {

		return userRepo.save(user);
	}

	@Transactional
	public User delete(int id) {

		User userDeleted = userRepo.findOne(id);

		userRepo.delete(userDeleted);

		return userDeleted;
	}

	@Transactional
	public List<User> findAllUsers() {

		List<User> users = userRepo.findAll();

		return users;
	}

	@Transactional
	public User update(User user) {

		User userUpdated = userRepo.findOne(user.getId());

		userUpdated.setCnp(user.getCnp());
		userUpdated.setFirstName(user.getFirstName());
		userUpdated.setLastName(user.getLastName());
		userUpdated.setAddress(user.getAddress());
		userUpdated.setCity(user.getCity());
		userUpdated.setEnabled(user.getEnabled());
		userUpdated.setAge(user.getAge());
		userUpdated.setGender(user.getGender());
		userUpdated.setUsername(user.getUsername());
		userUpdated.setPassword(user.getPassword());
		userUpdated.setPhone(user.getPhone());
		userUpdated.setRole(user.getRole());
		userUpdated.setEmail(user.getEmail());

		return userUpdated;
	}

	@Transactional
	public User findById(Integer id) {
		return userRepo.findOne(id);
	}

	@Transactional
	public User findAllDetalis(int id) {

		return userRepo.findAllDetalis(id);
	}

	public User userInfo(String username) {

		return userRepo.userInfo(username);
	}

	public List<Gender> findAllTypes() {

		List<Gender> genders = new ArrayList<Gender>();

		Gender male = new Gender();
		male.setType("Male");

		Gender female = new Gender();
		female.setType("Female");

		genders.add(male);
		genders.add(female);

		return genders;

	}

	@Transactional
	public List<User> InfoFromAllUsers() {
		return userRepo.allInfoFromUsers();
	}

	public List<City> allCities() {
		
		List<City> cities = new ArrayList<City>();
		
		City c1 = new City();
		c1.setName("Cluj Napoca");
		cities.add(c1);
		City c2 = new City();
		c2.setName("Baia Mare");
		cities.add(c2);
		City c3 = new City();
		c3.setName("Bucuresti");
		cities.add(c3);
		City c4 = new City();
		c4.setName("Brasov");
		cities.add(c4);
		City c5 = new City();
		c5.setName("Oradea");
		cities.add(c5);
		
		return cities;
	}

	public List<Country> allCountries() {
		
		List<Country> countries = new ArrayList<Country>();
		
		Country c1 = new Country();
		c1.setName("Romania");
		countries.add(c1);
		
		return countries;
	}


}
