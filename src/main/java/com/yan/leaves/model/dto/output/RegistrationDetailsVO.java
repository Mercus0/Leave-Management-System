package com.yan.leaves.model.dto.output;

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

}
