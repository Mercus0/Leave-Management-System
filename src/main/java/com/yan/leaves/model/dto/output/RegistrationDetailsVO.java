package com.yan.leaves.model.dto.output;

import java.time.LocalDate;

public class RegistrationDetailsVO {
	private ClassListVO classinfo;
	private StudentListVO student;

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

	public void setRegistDate(LocalDate localDate) {
		
	}

	public void setClassinfo(ClassDetailsVO detailsById) {
		// TODO Auto-generated method stub
		
	}

}
