package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public String upload(
			@RequestParam(name = "applyDate") LocalDate applyDate,
			@RequestParam(name = "classId") int classId,
			@RequestParam(name="file") List<MultipartFile> file) {
		var images = service.saveAll(file);
		var id = stuService.findStudentByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		leaService.addLeaveImages(images, id,classId,applyDate);
		return "redirect:/leaves";
	}
}
