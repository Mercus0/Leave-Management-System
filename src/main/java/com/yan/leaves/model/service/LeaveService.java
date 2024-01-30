package com.yan.leaves.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yan.leaves.model.dto.input.LeaveForm;
import com.yan.leaves.model.dto.output.LeaveListVO;
import com.yan.leaves.model.dto.output.LeaveSummaryVO;

@Service
public class LeaveService {
	
	private NamedParameterJdbcTemplate template;
	
	private static final String LEAVE_COUNT_SQL="""
			select count(leave_date) from leaves_day 
			where leave_date = :target and leaves_classes_id = :classId
			""";
	
	@Autowired
	private ClassService clsService;
	
	public LeaveService(DataSource dataSource) {
		template=new NamedParameterJdbcTemplate(dataSource);
	}
	
	public List<LeaveListVO> search(Optional<Integer> classId, Optional<String> studentName, Optional<LocalDate> from,
			Optional<LocalDate> to) {
		return List.of();
	}

	public LeaveForm findById(LocalDate applyDate,int classId,int studentId) {
		return null;
	}
	
	@Transactional
	public void save(LeaveForm form) {
		
	}

	public List<LeaveSummaryVO> searchSummary(Optional<LocalDate> target) {
		//find classes
		var classes =clsService.search(Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(null));
		
		var result=classes.stream().map(LeaveSummaryVO::new).toList();
		
		for(var vo : result) {
			vo.setLeaves(findLeavesForClass(vo.getClassId(),target.orElse(LocalDate.now())));
		}
		
		return result;
	}

	private long findLeavesForClass(int classId, LocalDate date) {
		
		return template.queryForObject(LEAVE_COUNT_SQL, Map.of(
				"classId",classId,
				"target",date
				), Long.class);
	}
}
