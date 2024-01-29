package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/home")
public class HomeController {

	@GetMapping
	public String index(@RequestParam(name = "targetData") Optional<LocalDate> targetData, ModelMap model) {
		
		Function<String, Boolean> hasAuthority = authority -> SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals(authority));
		
		if(hasAuthority.apply("Admin") || hasAuthority.apply("Teacher")) {
			return "teacher-home"; 
		}
		
		return "student-home";
	}
}
