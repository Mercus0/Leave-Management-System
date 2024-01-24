package com.yan.leaves.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.input.TeacherForm;
import com.yan.leaves.model.dto.output.TeacherListVO;
import com.yan.leaves.model.service.TeacherService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/teachers")
public class TeacherController {
	@Autowired
	private TeacherService service;
	
	@GetMapping
	public String index(
			@RequestParam(name = "name",    required = false) Optional<String> name,
			@RequestParam(name = "phone", required = false) Optional<String> phone,
			@RequestParam(name = "email", required = false) Optional<String> email, 
			ModelMap model) {
		var result=service.search(name, phone, email);
		model.put("list", result);
		return "teachers";
	}

	@GetMapping("edit")
	public String edit(@RequestParam(name="id",required=false) Optional<Integer> id) {
		return "teachers-edit";
	}

	@PostMapping
	public String save(@Valid @ModelAttribute(name="form") TeacherForm form,BindingResult result) {
		if(result.hasErrors()) {
			return "teachers-edit";
		}
		service.save(form);
		return "redirect:/teachers";
	}
	
	@ModelAttribute(name="form")
	TeacherForm form(@RequestParam(name="id",required=false) Optional<Integer> id) {
		return id.filter(a -> a > 0)
				.map(service::findById)
				.map(TeacherListVO::form)
				.orElse(new TeacherForm());
	}
}
