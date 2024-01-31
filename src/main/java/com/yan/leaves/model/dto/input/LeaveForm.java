package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class LeaveForm {
	public LeaveForm() {
		
	}
	
	public LeaveForm(int classId, int studentId) {
		super();
		this.classId = classId;
		this.studentId = studentId;
	}

	public LeaveForm(int classId, int studentName, LocalDate applyDate, LocalDate startDate, int days, String reason) {
		super();
		this.classId=classId;
		this.studentId=studentName;
		this.applyDate=applyDate;
		this.startDate=startDate;
		this.days=days;
		this.reason=reason;
	}

	private int classId;
	private int studentId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate applyDate;
	
	@NotNull(message = "Please enter the Start date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	
	@Min(value=1, message="Please enter the leave day")
	private int days;
	
	@NotEmpty(message="Please enter the Reason for leaves")
	private String reason;

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

	public LocalDate getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(LocalDate applyDate) {
		this.applyDate = applyDate;
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
