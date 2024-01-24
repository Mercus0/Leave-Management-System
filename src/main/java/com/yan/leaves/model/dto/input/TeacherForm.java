package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;

public class TeacherForm {
	
	public TeacherForm() {
		
	}
	
	public TeacherForm(int id, String name, String phone, String email, LocalDate assignDate) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.assignDate = assignDate;
	}

	private int id;
	
	@NotEmpty(message="Please enter teacher name.")
	private String name;
	
	@NotEmpty(message="Please enter Phone number.")
	private String phone;
	
	@NotEmpty(message="Please enter email address.")
	private String email;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate assignDate;
	
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

	public LocalDate getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(LocalDate assignDate) {
		this.assignDate = assignDate;
	}

}
