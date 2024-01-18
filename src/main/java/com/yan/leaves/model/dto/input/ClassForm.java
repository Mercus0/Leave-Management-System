package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class ClassForm {
	private int id;
	private int teacherName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate start;
	private int months;
	private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(int teacherName) {
		this.teacherName = teacherName;
	}

	public LocalDate getStart() {
		return start;
	}

	public void setStart(LocalDate start) {
		this.start = start;
	}

	public int getMonths() {
		return months;
	}

	public void setMonths(int months) {
		this.months = months;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
