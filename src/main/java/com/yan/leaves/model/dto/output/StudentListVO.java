package com.yan.leaves.model.dto.output;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.yan.leaves.model.dto.input.StudentForm;

public class StudentListVO {
	
	private PasswordEncoder passEncoder;

	public StudentListVO() {

	}
	

	public StudentListVO(int id, String name, String phone, String email, String gender, String address,
			String education, LocalDate assignDate, long classCount, String realId, boolean deleted,
			String profileImage, String password) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.address = address;
		this.education = education;
		this.assignDate = assignDate;
		this.classCount = classCount;
		this.realId = realId;
		this.deleted = deleted;
		this.profileImage = profileImage;
		this.password = password;
	}

	private int id;
	private String name;
	private String phone;
	private String email;
	private String gender;
	private String address;
	private String education;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate assignDate;
	private long classCount;
	private String realId;
	private boolean deleted;
	private String profileImage;
	private String password;
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public StudentForm form() {
		return new StudentForm(id, name, phone, email, education,realId,gender,address,assignDate);
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LocalDate getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(LocalDate assignDate) {
		this.assignDate = assignDate;
	}
	public String getRealId() {
		return realId;
	}

	public void setRealId(String realId) {
		this.realId = realId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public long getClassCount() {
		return classCount;
	}

	public void setClassCount(long classCount) {
		this.classCount = classCount;
	}

}
