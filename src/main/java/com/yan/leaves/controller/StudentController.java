package com.yan.leaves.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/students")
public class StudentController {
	@GetMapping
	public String index(
			@RequestParam(name="name",required=false) Optional<String> name,
			@RequestParam(name="phone",required=false) Optional<String> phone,
			@RequestParam(name="email",required=false) Optional<String> email,
			ModelMap model) {
		return "students";
	}
}
