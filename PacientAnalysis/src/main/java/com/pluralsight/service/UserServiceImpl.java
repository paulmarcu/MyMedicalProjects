package com.pluralsight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.User;
import com.pluralsight.repository.UserRepository;

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

	/*
	 * public List<User> testAllUsers(){
	 * 
	 * List<User> users = new ArrayList<User>();
	 * 
	 * User u2 = new User(); u2.setCnp("198467365223"); u2.setFirstName("Marcu");
	 * u2.setLastName("Ionelut");
	 * 
	 * User u1 = new User(); u1.setCnp("198467365555"); u1.setFirstName("Nechita");
	 * u1.setLastName("Gergel");
	 * 
	 * User u3 = new User(); u1.setCnp("198467366666"); u1.setFirstName("Pop");
	 * u1.setLastName("Dorel");
	 * 
	 * users.add(u1); users.add(u2); users.add(u3);
	 * 
	 * return users;
	 * 
	 * }
	 */

}
