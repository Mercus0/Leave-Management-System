package com.yan.leaves.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yan.leaves.model.service.ImageStorageService.ImageType;

@Service
public class MemberProfileImageService {
	@Autowired
	private ImageStorageService storageService;
	
	@Autowired
	private StudentService stuService;
	
	@Transactional
	public void uploadPhoto(MultipartFile file) {
		var profileImage = storageService.save(file,ImageType.Profile,1);
		var email = SecurityContextHolder.getContext().getAuthentication().getName();
		stuService.addProfileImage(profileImage,email);
	}

}
