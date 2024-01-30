package com.yan.leaves.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.input.StudentForm;
import com.yan.leaves.model.dto.output.StudentListVO;
import com.yan.leaves.model.service.StudentService;

@Controller
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private StudentService service;

	@GetMapping
	public String index(@RequestParam(name = "name", required = false) Optional<String> name,
			@RequestParam(name = "phone", required = false) Optional<String> phone,
			@RequestParam(name = "email", required = false) Optional<String> email, ModelMap model) {
		var result = service.search(name, phone, email);
		model.put("list", result);
		return "students";
	}

	@GetMapping("edit")
	public String edit(@RequestParam(name = "id", required = false) Optional<Integer> id) {
		return "students-edit";
	}
	
	
	@ModelAttribute(name="form")
	StudentForm form(@RequestParam(name = "id", required = false) Optional<Integer> id) {
		return id.filter(a -> a > 0)
				.map(service::findInfoById)
				.map(StudentListVO::form)
				.orElse(new StudentForm());
	}
}
