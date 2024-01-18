package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.input.LeaveForm;

@Controller
@RequestMapping("/leaves")
public class LeaveController {
	
	@GetMapping
	public String index(
			@RequestParam(name="classId",required=false) Optional<Integer> classId,
			@RequestParam(name="studentName",required=false) Optional<String> studentName,
			@RequestParam(name="from",required=false) Optional<LocalDate> from,
			@RequestParam(name="to",required=false) Optional<LocalDate> to,
			ModelMap model) {
		return "leaves";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam Optional<Integer> id,ModelMap model) {
		return "leaves-edit";
	}
	
	@PostMapping
	public String save(LeaveForm form) {
		return "";
	}
}
