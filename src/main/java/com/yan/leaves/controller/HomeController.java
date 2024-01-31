package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.output.StudentDetailsVO;
import com.yan.leaves.model.service.ClassService;
import com.yan.leaves.model.service.LeaveService;
import com.yan.leaves.model.service.StudentService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private LeaveService leaveService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ClassService classService;
	
	
	@GetMapping
	public String index(@RequestParam(name = "targetDate") Optional<LocalDate> targetDate, ModelMap model) {
		
		Function<String, Boolean> hasAuthority = authority -> SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals(authority));
		
		if(hasAuthority.apply("Admin") || hasAuthority.apply("Teacher")) {
			model.put("targetDate", targetDate.orElse(LocalDate.now()));
			model.put("list", leaveService.searchSummary(targetDate));
			return "teacher-home"; 
		}
		
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		String email=auth.getName();
		
		StudentDetailsVO student = studentService.findDetailsByLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		model.put("dto", student);
		
		var result=classService.searchId(email);
		model.put("list", result);
		
		return "student-home";
	}
}
