package com.yan.leaves.model.dto.input;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public class ClassForm {
	public ClassForm() {
		
	}
	
	public ClassForm(int id,int teacher,LocalDate start,int months, String description) {
		super();
		this.id=id;
		this.teacherName=teacher;
		this.start=start;
		this.months=months;
		this.description=description;
	}
	
	private int id;
	
	@NotEmpty(message="Please select teacher.")
	@Min(value = 1,message="Please select teacher.")
	private int teacherName;
	
	@NotNull(message = "Please enter start date.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate start;
	
	@Min(value = 1, message = "Please enter duration.")
	private int months;
	
	@NotEmpty(message = "Please enter description.")
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
