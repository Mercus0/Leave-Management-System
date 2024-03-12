package com.yan.leaves.controller;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yan.leaves.model.dto.input.LeaveForm;
import com.yan.leaves.model.dto.output.LeaveSummaryVO;
import com.yan.leaves.model.service.ImageStorageService;
import com.yan.leaves.model.service.LeaveService;
import com.yan.leaves.model.service.MemberProfileImageService;
import com.yan.leaves.model.service.StudentService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/leaves")
public class LeaveController {
	@Autowired
	private LeaveService service;
	@Autowired
	private StudentService studentService;
	
	@GetMapping
	public String index(
			@RequestParam(name="className",required=false) Optional<String> className,
			@RequestParam(name="teacherName",required=false) Optional<String> teacherName,
			@RequestParam(name="applyDate",required=false) Optional<LocalDate> applyDate,
			@RequestParam(name="startDate",required=false) Optional<LocalDate> startDate,
			ModelMap model) {
		var studentId=studentService.findStudentByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		var result=service.searchAllLeaveByStudent(className,teacherName,applyDate,startDate,studentId);
		result.sort(Comparator.comparing(LeaveSummaryVO::getApplyDate).reversed());
		model.put("list", result);
		return "leaves";
	}
	
	@GetMapping("edit")
	public String edit(
			@RequestParam(name="classId",required=false) Optional<Integer> classId,
			@RequestParam(name="studentId",required=false) Optional<Integer> studentId,
			ModelMap model) {
		var result=service.findClassAndTeacher(classId);
		model.addAttribute("classAndTeacher",result);
		return "leaves-edit";
	}
	
	@GetMapping("delete")
	public String deleteLeave(
			@RequestParam(name = "classId",required = false) Optional<Integer> classId,
			@RequestParam(name = "applyDate",required = false) Optional<LocalDate> applyDate,
			@RequestParam(name="teacherName",required=false) Optional<String> teacherName,
			@RequestParam(name="startDate",required=false) Optional<LocalDate> startDate,
			@RequestParam(name="className",required=false) Optional<String> className,
			ModelMap model) {
		
		var studentId=studentService.findStudentByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		service.deleteLeave(studentId,classId,applyDate);
		
		var result=service.searchAllLeaveByStudent(className,teacherName,applyDate,startDate,studentId);
		result.sort(Comparator.comparing(LeaveSummaryVO::getApplyDate).reversed());
		model.put("list", result);
		return "leaves";
	}

	
	@PostMapping("edit")
	public String save(
			@RequestParam(name="classId",required = false,defaultValue = "0") Optional<Integer> classId,
			@Valid @ModelAttribute(name="form") LeaveForm form,BindingResult result,RedirectAttributes redirectAttributes,ModelMap model) {
		if(result.hasErrors()) {
			var names=service.findClassAndTeacher(classId);
			model.addAttribute("classAndTeacher",names);
			return "leaves-edit";
		}
		if(!service.checkLeaves(form)) {
			service.save(form);
			return "redirect:/leaves";
		}
		redirectAttributes.addFlashAttribute("error", "You have already leaves for today");
		return "redirect:/leaves/edit?classId=%d&studentId=%d".formatted(form.getClassId(),form.getStudentId());
	}
	
	@ModelAttribute(name="form")
	LeaveForm form(@RequestParam(name="classId",required = false,defaultValue = "0") Integer classId,
			@RequestParam(name="studentId",required = false,defaultValue = "0") Integer studentId) {
		var form=new LeaveForm();
		form.setClassId(classId);
		form.setStudentId(studentId);
		form.setApplyDate(LocalDate.now());
		form.setStatus("Pending");
		return form;
	}
	
}
