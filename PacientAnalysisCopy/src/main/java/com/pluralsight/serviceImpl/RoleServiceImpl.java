package com.pluralsight.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pluralsight.model.Role;
import com.pluralsight.repository.RoleRepository;
import com.pluralsight.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleRepository roleRepository;

	@Transactional
	public List<Role> getAllRoles() {
		
		return roleRepository.getAllRoles();
	}
	
	
}
