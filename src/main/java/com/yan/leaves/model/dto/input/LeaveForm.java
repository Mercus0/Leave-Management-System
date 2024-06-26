package com.yan.leaves.model.dto.input;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;

public class LeaveForm {
	public LeaveForm() {
		
	}
	
	public LeaveForm(int classId, int studentId) {
		super();
		this.classId = classId;
		this.studentId = studentId;
	}


	public LeaveForm(int classId, int studentId, LocalDate applyDate,
			@NotNull(message = "Please enter the Start date") LocalDate startDate,
			@Min(value = 1, message = "Please enter the leave day") int days,
			@NotEmpty(message = "Please enter the Reason for leaves") String reason, String status) {
		super();
		this.classId = classId;
		this.studentId = studentId;
		this.applyDate = applyDate;
		this.startDate = startDate;
		this.days = days;
		this.reason = reason;
		this.status = status;
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
	
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
