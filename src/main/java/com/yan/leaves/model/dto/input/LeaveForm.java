package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

public class LeaveForm {
	public LeaveForm() {

	}

	private int classId;
	private int studentName;
	private LocalDate startDate;
	private int days;
	private String reason;

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getStudentName() {
		return studentName;
	}

	public void setStudentName(int studentName) {
		this.studentName = studentName;
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
