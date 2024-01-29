package com.yan.leaves.model.dto.output;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class RegistrationDetailsVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate registDate;
	private ClassListVO classinfo;
	private StudentListVO student;

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}

	public ClassListVO getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(ClassListVO classinfo) {
		this.classinfo = classinfo;
	}

	public StudentListVO getStudent() {
		return student;
	}

	public void setStudent(StudentListVO student) {
		this.student = student;
	}

}
