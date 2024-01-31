package com.yan.leaves.model.dto.input;

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


	public StudentForm(int id, String name, String phone, String email, String education,String realId) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.Education = education;
		this.realId = realId;
	}

	private int id;
	private String name;
	private String phone;
	private String email;
	private String Education;
	private String realId;

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
