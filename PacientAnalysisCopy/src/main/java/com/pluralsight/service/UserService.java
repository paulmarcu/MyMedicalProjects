package com.pluralsight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pluralsight.model.User;

@Service
public interface UserService {
	
	User create(User user);
	
	User delete(int id);
	
	List<User> findAllUsers();
	
	User update(User user);
	
	User findById(Integer id);
	
	User userInfo(String username);
	
	User findAllDetalis(int id);
	

}