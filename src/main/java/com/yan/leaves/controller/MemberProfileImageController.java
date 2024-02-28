package com.yan.leaves.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yan.leaves.model.service.MemberProfileImageService;

import jakarta.servlet.annotation.MultipartConfig;

@Controller
@RequestMapping("/member/profile/image")
public class MemberProfileImageController {
	
	@Autowired
	private MemberProfileImageService service;
	
	@PostMapping
	public String upload(@RequestParam(name="file") MultipartFile file) {
		service.uploadPhoto(file);
		return "redirect:/home";
	}
}

