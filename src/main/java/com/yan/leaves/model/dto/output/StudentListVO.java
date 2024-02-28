package com.yan.leaves.model.dto.output;

import com.yan.leaves.model.dto.input.StudentForm;

public class StudentListVO {

	public StudentListVO() {

	}

	public StudentListVO(int id, String name, String phone, String email, String education, long classCount,
			String realId) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.education = education;
		this.classCount = classCount;
		this.realId = realId;
	}

	public StudentListVO(int id, String name, String phone, String email, String gender, String address,
			String education, String assignDate, String realId,boolean deleted,String profileImage) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.address = address;
		this.education = education;
		this.assignDate = assignDate;
		this.realId = realId;
		this.deleted=deleted;
		this.profileImage=profileImage;	}

	private int id;
	private String name;
	private String phone;
	private String email;
	private String gender;
	private String address;
	private String education;
	private String assignDate;
	private long classCount;
	private String realId;
	private boolean deleted;
	private String profileImage;
	

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

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public StudentForm form() {
		return new StudentForm(id, name, phone, email, education);
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
