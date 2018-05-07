package com.pluralsight.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "email")
	private String email;

	@Column(name = "cnp")
	private String cnp;

	@Column(name = "gender")
	public String gender;

	@Column(name = "phone")
	private String phone;

	@Column(name = "address")
	private String address;

	@Column(name = "city")
	private String city;

	@Column(name = "country")
	private String country;

	@Column(name = "age")
	private int age;

	@Column(name = "enabled")
	private Boolean enabled;

	@ManyToOne
	@JoinColumn(name = "role_id")
	@JsonBackReference
	private Role role;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Analysis> analysises = new ArrayList<Analysis>();

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Appointment> appointments = new ArrayList<Appointment>();

	public User() {
	};
	
	public User(int id) {
		this.id = id;
	}

	public User(int id, String firstName, String lastName) {

		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;

	}

	public User(String cnp, String firstName, String lastName, String email, String address, String city,
			String phone) {

		this.cnp = cnp;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.phone = phone;
	}

	public User(String cnp, String firstName, String lastName, String email, String address, String city, String phone,
			String gender) {
		this.cnp = cnp;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.phone = phone;
		this.gender = gender;

	}

	public User(String cnp, int age, String firstName, String lastName, String email, String address, String city,
			String phone, String gender) {

		this.cnp = cnp;
		this.age = age;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.phone = phone;
		this.gender = gender;
	}

	public User(int id, String cnp, int age, String firstName, String lastName, String email, String address,
			String city, String phone, String gender, Role role) {

		this.id = id;
		this.cnp = cnp;
		this.age = age;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.phone = phone;
		this.gender = gender;
		this.role = role;
	}

	public User(String cnp, String firstName, String lastName) {

		this.cnp = cnp;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public List<Appointment> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getAddress() {
		return address;
	}

	public int getAge() {
		return age;
	}

	public List<Analysis> getAnalysises() {
		return analysises;
	}

	public String getCity() {
		return city;
	}

	public String getCnp() {
		return cnp;
	}

	public String getEmail() {
		return email;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getGender() {
		return gender;
	}

	public int getId() {
		return id;
	}

	public String getLastName() {
		return lastName;
	}

	public String getPassword() {
		return password;
	}

	public String getPhone() {
		return phone;
	}

	public Role getRole() {
		return role;
	}

	public String getUsername() {
		return username;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setAnalysises(List<Analysis> analysises) {
		this.analysises = analysises;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setCnp(String cnp) {
		this.cnp = cnp;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
