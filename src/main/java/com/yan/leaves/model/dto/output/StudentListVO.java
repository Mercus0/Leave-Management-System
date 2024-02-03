package com.yan.leaves.model.dto.output;

import com.yan.leaves.model.dto.input.StudentForm;

public class StudentListVO {
	
	public StudentListVO() {
		
	}
	
	
	public StudentListVO(int id, String name, String phone, String email, String education, long classCount,String realId) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.education = education;
		this.classCount = classCount;
		this.realId=realId;
	}


	private int id;
	private String name;
	private String phone;
	private String email;
	private String education;
	private long classCount;
	private String realId;
	
	
	public StudentForm form() {
		return new StudentForm(id,name,phone,email,education);
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
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public long getClassCount() {
		return classCount;
	}

	public void setClassCount(long classCount) {
		this.classCount = classCount;
	}

}
