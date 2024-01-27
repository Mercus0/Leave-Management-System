package com.yan.leaves.model.dto.output;

public class RegistrationListVO {
	private ClassListVO classInfo;
	private StudentListVO student;

	public ClassListVO getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(ClassListVO classInfo) {
		this.classInfo = classInfo;
	}

	public StudentListVO getStudent() {
		return student;
	}

	public void setStudent(StudentListVO student) {
		this.student = student;
	}
}
