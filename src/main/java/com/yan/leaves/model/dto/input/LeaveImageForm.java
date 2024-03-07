package com.yan.leaves.model.dto.input;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LeaveImageForm {
	private List<MultipartFile> files;
	
	public LeaveImageForm() {
		// TODO Auto-generated constructor stub
	}

	public LeaveImageForm(List<MultipartFile> files) {
		super();
		this.files = files;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
}
