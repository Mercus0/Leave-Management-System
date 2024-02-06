package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;

public class RegistrationForm {
	public RegistrationForm() {

	}

	public RegistrationForm(int classId, int studentId, LocalDate registDate,String realId) {
		super();
		this.classId = classId;
		this.studentId = studentId;
		this.registDate = registDate;
		this.realId = realId;
	}

	private int classId;
	private int studentId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate registDate;

	@NotEmpty(message = "Please enter student Id.")
	private String realId;

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}

	public String getRealId() {
		return realId;
	}

	public void setRealId(String realId) {
		this.realId = realId;
	}

}
