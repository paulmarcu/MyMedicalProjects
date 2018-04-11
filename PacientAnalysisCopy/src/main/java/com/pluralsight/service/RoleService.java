package com.pluralsight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pluralsight.model.Role;

@Service
public interface RoleService {
	
	List<Role> getAllRoles();

}
