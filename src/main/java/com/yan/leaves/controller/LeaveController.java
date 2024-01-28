package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.input.LeaveForm;

import jakarta.validation.Valid;

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
	
	@GetMapping("edit")
	public String edit(@RequestParam(name="id",required=false) Optional<Integer> id,@RequestParam(name="studentId",required=false) Optional<Integer> studentId) {
		return "leaves-edit";
	}
	
	@PostMapping
	public String save(@Valid @ModelAttribute LeaveForm form,BindingResult result) {
		return "";
	}
	
	@ModelAttribute("form")
	LeaveForm form(@RequestParam(name="classId",required = false,defaultValue = "0") Integer classId,@RequestParam(name="studentId",required = false,defaultValue = "0") Integer studentId) {
		if(null != classId && null != studentId) {
			return new LeaveForm(classId,studentId);
		}
		return null;
	}
}
