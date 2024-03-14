package com.yan.leaves.controller.rest;

import java.time.Month;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	    return  service.findCategoryData();
	}
	
	@GetMapping(value = "top-leaves",produces = MediaType.APPLICATION_JSON_VALUE)
	List<NameAndCount> findTopLeaves(){
		return service.findTopLeaves(10);
	}
	
	@GetMapping(value = "post/year",produces = MediaType.APPLICATION_JSON_VALUE)
	List<NameAndCount> findYearlyData(@RequestParam int year){
		return service.search(year);
	}
	
	@GetMapping(value = "post/month",produces = MediaType.APPLICATION_JSON_VALUE)
	List<NameAndCount> findMonthlyData(@RequestParam int year,@RequestParam Month month){
		return service.search(year,month);
	}

}
