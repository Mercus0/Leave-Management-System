package com.yan.leaves.model.dto.output;

import java.time.LocalDate;

public class LeaveListVO {
	public LeaveListVO() {
		
	}
	public LeaveListVO(LocalDate applyDate, int classId, int studentId,String student,String studentPhone,
			int teacherId,String teacher,LocalDate startDate,int days,String reason, String status) {
		super();
		this.applyDate=applyDate;
		this.classId=classId;
		this.studentId=studentId;
		this.student=student;
		this.studentPhone=studentPhone;
		this.teacherId=teacherId;
		this.teacher=teacher;
		this.startDate=startDate;
		this.days=days;
		this.reason=reason;
		this.status=status;
	}
	private LocalDate applyDate;
	private int classId;
	private int studentId;
	private String student;
	private String studentPhone;
	private int teacherId;
	private String teacher;
	private LocalDate startDate;
	private int days;
	private String reason;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDate getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(LocalDate applyDate) {
		this.applyDate = applyDate;
	}
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
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
