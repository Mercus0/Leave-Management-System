package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yan.leaves.model.dto.input.ClassForm;
import com.yan.leaves.model.dto.input.RegistrationForm;
import com.yan.leaves.model.service.ClassService;
import com.yan.leaves.model.service.LeaveService;
import com.yan.leaves.model.service.RegistrationService;
import com.yan.leaves.model.service.TeacherService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/classes")
public class ClassController {
	@Autowired
	private RegistrationService regService;
	@Autowired
	private ClassService clsService;
	@Autowired
	private TeacherService teaService;
	@Autowired
	private LeaveService levService;

	@GetMapping
	public String index(@RequestParam(name = "teacher", required = false) Optional<String> teacher,
			@RequestParam(name = "from", required = false) Optional<LocalDate> from,
			@RequestParam(name = "to", required = false) Optional<LocalDate> to, ModelMap model) {

		var result = clsService.search(teacher, from, to);
		model.put("list", result);
		return "classes";
	}

	@GetMapping("edit")
	public String edit(@RequestParam(name = "id", required = false) Optional<Integer> id, ModelMap model) {
		model.put("teachers", teaService.getAvailableTeacher());
		return "classes-edit";
	}

	@PostMapping
	public String save(@Valid @ModelAttribute(name = "classForm") ClassForm form, BindingResult result) {
		if (result.hasErrors()) {
			return "classes-edit";
		}
		// save form
		var id = clsService.save(form);
		// redirect to details view
		return "redirect:/classes/%d".formatted(id);
	}

	@GetMapping("{id}")
	public String showDetails(@PathVariable(name = "id") Integer id,
			@RequestParam(name = "targetDate", required = false) Optional<LocalDate> targetDate, ModelMap model) {
		if (targetDate.isPresent()) {
			var result = clsService.findDetailsByIdAndDate(id, targetDate);
			model.put("dto", result);
			return "classes-details";
		} else {
			var result = clsService.findDetailsById(id);
			model.put("dto", result);
			return "classes-details";
		}
	}

	@GetMapping("registration")
	public String editRegistration(
			@RequestParam(name = "studentId", required = false, defaultValue = "0") int studentId,
			@RequestParam(name = "classId", required = false, defaultValue = "0") int classId) {
		return "registration-edit";
	}

	@PostMapping("registration")
	public String saveRegistration(@Valid @ModelAttribute(name = "registForm") RegistrationForm form,
			BindingResult result) {
		if (result.hasErrors()) {
			return "registration-edit";
		}
		regService.save(form);
		return "redirect:/classes/registration/%d/%d".formatted(form.getClassId(), form.getStudentId());
	}

	@GetMapping("registration/{classId}/{studentId}")
	public String showRegistrationDetails(@PathVariable(name = "classId") int classId,
			@PathVariable(name = "studentId") int studentId, ModelMap model) {
		var result = regService.findDetailsById(classId, studentId);
		model.put("dto", result);
		return "registration-details";
	}

	@ModelAttribute(name = "classForm")
	ClassForm classForm(@RequestParam(name = "id", required = false) Optional<Integer> id) {
		return id.filter(a -> a > 0).map(clsService::findById).orElse(new ClassForm());
	}

	@ModelAttribute(name = "registForm")
	RegistrationForm registform(@RequestParam(name = "studentId", required = false, defaultValue = "0") int studentId,
			@RequestParam(name = "classId", required = false, defaultValue = "0") int classId) {
		// edit
		if (studentId > 0) {
			return regService.getFormById(classId, studentId);
		}

		var form = new RegistrationForm();
		form.setClassId(classId);
		return form;
	}

}
