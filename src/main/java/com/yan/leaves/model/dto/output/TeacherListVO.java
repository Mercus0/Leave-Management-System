package com.yan.leaves.model.dto.output;

import java.time.LocalDate;

import com.yan.leaves.model.dto.input.TeacherForm;

public class TeacherListVO {
	private int id;
	private String name;
	private String phone;
	private String email;
	private LocalDate assignDate;
	private Long classCount;
	
	
	//check here
	public TeacherForm form() {
		return new TeacherForm(id,name,phone,email,assignDate);
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

	public LocalDate getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(LocalDate assignDate) {
		this.assignDate = assignDate;
	}

	public Long getClassCount() {
		return classCount;
	}

	public void setClassCount(Long classCount) {
		this.classCount = classCount;
	}
}
