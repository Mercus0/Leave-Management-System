package com.yan.leaves.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yan.leaves.model.dto.input.LeaveForm;
import com.yan.leaves.model.dto.output.LeaveListVO;
import com.yan.leaves.model.dto.output.LeaveSummaryVO;

@Service
public class LeaveService {
	
	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert levInsert;
	
	private static final String LEAVE_COUNT_SQL="""
			select count(start_date) from leaves 
			where apply_date = :target and classes_id = :classId
			""";
	
	private static final String LEAVE_STUDENT_DETAIL="""
			SELECT a.name student, s.phone studentPhone,l.apply_date applyDate,
			l.start_date startDate,l.days,l.reason reason
			from leaves l
			join student s on l.student_id = s.id
			join account a on s.id = a.id
			where l.classes_id = :classId
			""";
	
	@Autowired
	private ClassService clsService;
	
	public LeaveService(DataSource dataSource) {
		template=new NamedParameterJdbcTemplate(dataSource);
		
		levInsert=new SimpleJdbcInsert(dataSource);
		levInsert.setTableName("leaves");
		
	}
	
	public List<LeaveListVO> search(int classId) {
		return template.query(LEAVE_STUDENT_DETAIL,Map.of(
				"classId",classId),new BeanPropertyRowMapper<>(LeaveListVO.class));
	}
	

	public List<LeaveListVO> searchByclassIdAndDate(Integer id, Optional<LocalDate> targetDate) {
		return template.query("""
			SELECT a.name student, s.phone studentPhone,l.apply_date applyDate,
			l.start_date startDate,l.days,l.reason reason
			from leaves l
			join student s on l.student_id = s.id
			join account a on s.id = a.id
			where l.classes_id = :classId And
			l.apply_date = :applyDate
				""", Map.of(
						"classId",id,
						"applyDate",targetDate.orElse(null)),
				new BeanPropertyRowMapper<>(LeaveListVO.class));

	}

	public LeaveForm findById(LocalDate applyDate,int classId,int studentId) {
		var sql = """
					select * from leaves_day where
	        leaves_apply_date = :applyDate And 
	        leaves_classes_id = :classId And
	        leaves_student_id = :studentId
				""";
		return template.queryForObject(sql, Map.of(
				"applyDate",applyDate,
				"classId",classId,
				"studentId",studentId
				), new BeanPropertyRowMapper<>(LeaveForm.class));
	}
	
	@Transactional
	public void save(LeaveForm form) {
//		var classId = findById(form.getApplyDate(),form.getClassId(),form.getStudentId());
//		if(null == classId) {
//			insert(form);
//		}
//		update(form);
		
		insert(form);
	}

	private void update(LeaveForm form) {
		// TODO Auto-generated method stub
	}

	private void insert(LeaveForm form) {
		 levInsert.execute(Map.of(
				 "apply_date",form.getApplyDate(),
				 "classes_id",form.getClassId(),
				 "student_id",form.getStudentId(),
				 "start_date",form.getStartDate(),
				 "days",form.getDays(),
				 "reason",form.getReason()
				 ));
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
