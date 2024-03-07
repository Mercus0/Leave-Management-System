package com.yan.leaves.model.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yan.leaves.model.dto.input.LeaveForm;
import com.yan.leaves.model.dto.output.ClassNameAndTeacherNameVO;
import com.yan.leaves.model.dto.output.LeaveListVO;
import com.yan.leaves.model.dto.output.LeaveSummaryVO;

@Service
public class LeaveService {

	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert levInsert;

	private static final String LEAVE_COUNT_SQL = """
			select count(start_date) from leaves
			where apply_date = :target and classes_id = :classId
			""";

	private static final String LEAVE_STUDENT_DETAIL = """
			SELECT a.name student, s.phone studentPhone,l.apply_date applyDate,
			l.start_date startDate,l.days,l.reason reason,l.approval_status status
			from leaves l
			join student s on l.student_id = s.id
			join account a on s.id = a.id
			where l.classes_id = :classId
			""";

	private static final String LIST_LEAVES = """
			select c.id classId, c.description details,l.apply_date applyDate,l.start_date startDate,
			l.days,l.reason,l.approval_status approvalStatus,a.name teacher
			FROM leaves l
			JOIN classes c ON l.classes_id = c.id
			JOIN account a ON c.teacher_id = a.id
			""";

	@Autowired
	private ClassService clsService;

	public LeaveService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);

		levInsert = new SimpleJdbcInsert(dataSource);
		levInsert.setTableName("leaves");

	}

	public List<LeaveListVO> search(int classId) {
		return template.query(LEAVE_STUDENT_DETAIL, Map.of("classId", classId),
				new BeanPropertyRowMapper<>(LeaveListVO.class));
	}

	public List<LeaveListVO> searchByclassIdAndDate(Integer id, Optional<LocalDate> targetDate) {
		return template.query("""
				SELECT a.name student, s.phone studentPhone,l.apply_date applyDate,
				l.start_date startDate,l.days,l.reason reason,l.approval_status status,
				l.student_id studentId
				from leaves l
				join student s on l.student_id = s.id
				join account a on s.id = a.id
				where l.classes_id = :classId And
				l.apply_date = :applyDate
					""", Map.of("classId", id, "applyDate", targetDate.orElse(null)),
				new BeanPropertyRowMapper<>(LeaveListVO.class));

	}

	public LeaveForm findById(LocalDate applyDate, int classId, int studentId) {
		var sql = """
					select * from leaves_day where
				     leaves_apply_date = :applyDate And
				     leaves_classes_id = :classId And
				     leaves_student_id = :studentId
				""";
		return template.queryForObject(sql, Map.of("applyDate", applyDate, "classId", classId, "studentId", studentId),
				new BeanPropertyRowMapper<>(LeaveForm.class));
	}

	@Transactional
	public void save(LeaveForm form) {
		levInsert.execute(Map.of(
				"apply_date", form.getApplyDate(), 
				"classes_id", form.getClassId(), 
				"student_id",form.getStudentId(), 
				"start_date", form.getStartDate(), 
				"days", form.getDays(), 
				"reason",form.getReason(), 
				"approval_status", form.getStatus()));
	}

	public boolean checkLeaves(LeaveForm form) {
		List<Integer> result = template.queryForList(
				"SELECT count(*) FROM leaves WHERE student_id = :studentId AND classes_id = :classId AND apply_date = :applyDate",
				Map.of("studentId", form.getStudentId(), "classId", form.getClassId(), "applyDate",form.getApplyDate()),Integer.class);
		return result != null && !result.isEmpty() && result.get(0) > 0;
	}

	public List<LeaveSummaryVO> searchSummary(Optional<LocalDate> target) {
		// find classes
		var classes = clsService.search(Optional.ofNullable(null), Optional.ofNullable(null),
				Optional.ofNullable(null));

		var result = classes.stream().map(LeaveSummaryVO::new).toList();

		for (var vo : result) {
			vo.setLeaves(findLeavesForClass(vo.getClassId(), target.orElse(LocalDate.now())));
		}
		return result;
	}

	private long findLeavesForClass(int classId, LocalDate date) {

		return template.queryForObject(LEAVE_COUNT_SQL, Map.of("classId", classId, "target", date), Long.class);
	}

	public void pending(int classId, int studentId, String targetDate, String action) {
		template.update("""
				update leaves set approval_status =:action
				where classes_id =:classId and student_id =:studentId and
				apply_date =:targetDate
				""", Map.of("action", action, "classId", classId, "targetDate", targetDate, "studentId", studentId));
	}

	public List<LeaveSummaryVO> searchAllLeaveByStudent(Optional<String> className, Optional<String> teacherName,
			Optional<LocalDate> applyDate, Optional<LocalDate> startDate, Integer studentId) {

		var sb = new StringBuffer(LIST_LEAVES);
		sb.append(" where 1 = 1  ");

		var param = new HashMap<String, Object>();

		param.put("studentId", studentId);
		sb.append(" and l.student_id = :studentId");

		className.ifPresent(a -> {
			param.put("className", a.toLowerCase().concat("%"));
			sb.append(" and c.description like :className");
		});

		teacherName.ifPresent(a -> {
			param.put("teacherName", a.toLowerCase().concat("%"));
			sb.append(" and a.name like :teacherName");
		});

		applyDate.ifPresent(a -> {
			param.put("applyDate", Date.valueOf(a));
			sb.append(" and l.apply_date = :applyDate");
		});

		startDate.ifPresent(a -> {
			param.put("startDate", Date.valueOf(a));
			sb.append(" and l.start_date = :startDate");
		});
		return template.query(sb.toString(), param, new BeanPropertyRowMapper<>(LeaveSummaryVO.class));
	}

	public List<ClassNameAndTeacherNameVO> findClassAndTeacher(Optional<Integer> classId) {
		return template.query("""
				SELECT c.description AS className, a.name AS teacherName
				FROM classes c
				JOIN teacher t ON c.teacher_id = t.id
				JOIN account a ON t.id = a.id
				WHERE c.id = :classId;
				""", Map.of(
						"classId",classId.orElse(null)
						),new BeanPropertyRowMapper<>(ClassNameAndTeacherNameVO.class));
	}

	
	public void deleteLeave(Integer studentId, Optional<Integer> classId, Optional<LocalDate> applyDate) {
		template.update("""
				delete from leaves where classes_id = :classId and student_id = :studentId and apply_date = :applyDate;
				""", Map.of(
						"classId",classId.orElse(null),
						"studentId",studentId,
						"applyDate",applyDate.orElse(LocalDate.now())
						));	
	}

	public List<LeaveSummaryVO> findNameAndCount(Optional<LocalDate> targetDate) {
		return template.query("""
				SELECT l.approval_status AS approvalStatus, c.description AS details
				FROM leaves l
				JOIN classes c ON l.classes_id = c.id
				WHERE l.apply_date = :targetDate and
				l.approval_status = 'Pending';
				;
				""", Map.of(
					"targetDate",targetDate.orElse(LocalDate.now())
				),new BeanPropertyRowMapper<>(LeaveSummaryVO.class));
	}
	
	public void addLeaveImages(List<String> images, Integer studentId) {
		template.update("""
				update leaves set images= :images where student_id= :studentId
				""", Map.of(
						"images",images.stream().collect(Collectors.joining(",")),
						"studentId",studentId
						));
	}
}
