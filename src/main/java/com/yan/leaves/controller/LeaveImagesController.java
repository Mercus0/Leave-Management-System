package com.yan.leaves.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yan.leaves.model.dto.input.LeaveImageForm;
import com.yan.leaves.model.service.ImageStorageService;
import com.yan.leaves.model.service.LeaveService;
import com.yan.leaves.model.service.StudentService;

@Controller
@RequestMapping("/leave/images/controller")
public class LeaveImagesController {
	
	@Autowired
	private ImageStorageService service;
	
	@Autowired
	private StudentService stuService;
	
	@Autowired
	private LeaveService leaService;
	
	
	@PostMapping
	public String upload(@ModelAttribute (name = "form") LeaveImageForm form,BindingResult result) {
		List<MultipartFile> files=form.getFiles();
		if(files == null || files.isEmpty()) {
			 return "redirect:/home";  
		}
		var images = service.saveAll(files);
		var studentId = stuService.findStudentByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		leaService.addLeaveImages(images, studentId);
		return "redirect:/home";
	}
	
	@ModelAttribute
	LeaveImageForm form(){
		return new LeaveImageForm();
	}

}
