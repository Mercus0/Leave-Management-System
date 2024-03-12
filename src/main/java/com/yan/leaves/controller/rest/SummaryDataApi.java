package com.yan.leaves.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yan.leaves.model.dto.output.NameAndCount;
import com.yan.leaves.model.service.SummaryDataService;

@RestController
@RequestMapping("admin/api")
public class SummaryDataApi {
	
	@Autowired
	private SummaryDataService service;
	
	@GetMapping(value = "categories", produces = MediaType.APPLICATION_JSON_VALUE)
	List<NameAndCount> findCategorySummary() {
	    List<NameAndCount> data = service.findCategoryData();
	    return data;
	}
}
