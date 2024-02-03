package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class StudentForm {
	public StudentForm() {
		// TODO Auto-generated constructor stub
	}

	public StudentForm(int id, String name, String phone, String email, String education) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		Education = education;
	}

	public StudentForm(int id, String name, String phone, String email, String education, String realId) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.Education = education;
		this.realId = realId;
	}

	public StudentForm(int id, String name, String phone, String email, String education, String realId, String gender,
			String address, LocalDate assignDate) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		Education = education;
		this.realId = realId;
		this.gender = gender;
		Address = address;
		this.assignDate = assignDate;
	}

	private int id;
	@NotEmpty(message = "Please enter Student name.")
	private String name;

	@NotEmpty(message = "Please enter Phone number.")
	private String phone;
	@NotEmpty(message = "Please enter Email.")
	private String email;
	private String Education;
	@NotEmpty(message = "Please enter Student Id.")
	private String realId;
	private String gender;
	@NotEmpty(message = "Please enter Address.")
	private String Address;

	@NotNull(message = "Please enter assign date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate assignDate;

	public LocalDate getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(LocalDate assignDate) {
		this.assignDate = assignDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getRealId() {
		return realId;
	}

	public void setRealId(String realId) {
		this.realId = realId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEducation() {
		return Education;
	}

	public void setEducation(String education) {
		Education = education;
	}

}
