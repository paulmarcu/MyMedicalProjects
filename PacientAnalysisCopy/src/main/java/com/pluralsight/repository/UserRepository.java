package com.pluralsight.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.pluralsight.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("Select new User(u.id ,u.cnp, u.age, u.firstName, u.lastName, u.email, u.address, u.city, u.phone, u.gender, u.role) from User u where u.id=:id")
	public User findAllDetalis(@Param("id") int id);

	@Query("Select u from User u where u.username = :username")
	public User userInfo(@Param("username") String username);

}
