package com.yan.leaves.model.dto.output;

import java.time.LocalDate;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

public class RegistrationListVO {

	private RegistrationListVO() {

	}

	public RegistrationListVO(int classId, int teacherId, String teacher, LocalDate startDate, int studentId,
			String student, String studentPhone, LocalDate registrationDate, String classInfo) {
		super();
		this.classId = classId;
		this.teacherId = teacherId;
		this.teacher = teacher;
		this.startDate = startDate;
		this.studentId = studentId;
		this.student = student;
		this.studentPhone = studentPhone;
		this.registrationDate = registrationDate;
		this.classInfo = classInfo;
	}

	private int classId;
	private int teacherId;
	private String teacher;
	private String classInfo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	private int studentId;
	private String student;
	private String studentPhone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate registrationDate;
	private int deleted;

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(String classInfo) {
		this.classInfo = classInfo;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public String getStudentPhone() {
		return studentPhone;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	public LocalDate getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(LocalDate registrationDate) {
		this.registrationDate = registrationDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(classId, classInfo, registrationDate, startDate, student, studentId, studentPhone, teacher,
				teacherId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RegistrationListVO other = (RegistrationListVO) obj;
		return classId == other.classId && Objects.equals(classInfo, other.classInfo)
				&& Objects.equals(registrationDate, other.registrationDate)
				&& Objects.equals(startDate, other.startDate) && Objects.equals(student, other.student)
				&& studentId == other.studentId && Objects.equals(studentPhone, other.studentPhone)
				&& Objects.equals(teacher, other.teacher) && teacherId == other.teacherId;
	}

}
