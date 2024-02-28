package com.yan.leaves.model.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yan.leaves.model.dto.input.RegistrationForm;
import com.yan.leaves.model.dto.output.RegistrationDetailsVO;
import com.yan.leaves.model.dto.output.RegistrationListVO;

import jakarta.validation.Valid;

@Service
public class RegistrationService {
	
	private static final String SELECT_BY_CLASS="""
			select r.classes_id classId, c.teacher_id teacherId, ta.name teacher,
			c.start_date startDate, r.student_id studentId, sa.name student, s.phone studentPhone, r.registration_date,c.description classInfo
			from registration r
			join classes c on r.classes_id = c.id
			join teacher t on c.teacher_id = t.id join account ta on t.id = ta.id
			join student s on r.student_id = s.id join account sa on s.id = sa.id
			where r.classes_id = :classId
			""";
	
	private static final String SELECT_BY_STUDENT="""
			select r.classes_id classId, c.teacher_id teacherId, ta.name teacher,
			c.start_date startDate, r.student_id studentId, sa.name student, s.phone studentPhone, r.registration_date,c.description classInfo,
			c.deleted
			from registration r
			join classes c on r.classes_id = c.id
			join teacher t on c.teacher_id = t.id join account ta on t.id = ta.id
			join student s on r.student_id = s.id join account sa on s.id = sa.id
			where r.student_Id = :studentId
			""";
	
	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert regInsert;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ClassService classsService;
	
	public RegistrationService(DataSource dataSource) {
		template=new NamedParameterJdbcTemplate(dataSource);
		regInsert= new SimpleJdbcInsert(dataSource);
		regInsert.setTableName("registration");
	}
	
	@Transactional
	public void save(RegistrationForm form) {
//		//update
//		if(form.getStudentId()>0) {
//			update(form);
//			return;
//		}
		
		var studentId = studentService.findStudentByRealId(form.getRealId());
		if(studentId == null) {
			return;
		}
			form.setStudentId(studentId);
			create(form);
	}
	
	

	public RegistrationDetailsVO findDetailsById(int classId, int studentId) {
		var result = new RegistrationDetailsVO();
		var registDate = template.queryForObject("""
				select registration_date from registration where classes_id = :classId and student_id = :studentId
				""",
				Map.of("classId",classId,"studentId",studentId), Date.class);
		result.setRegistDate(registDate.toLocalDate());
		result.setClassInfo(classsService.findInfoById(classId));
		result.setStudent(studentService.findInfoById(studentId));
		return result;
	}
	
	public RegistrationForm getFormById(int classId, int studentId) {
		var sql="""
				select r.classes_id classId, r.student_id studentId, r.registration_date registDate,
				a.name studentName, a.email, s.phone, s.education, s.realId
				from registration r join student s on r.student_id = s.id join account a on s.id = a.id
				where r.classes_id = :classId and r.student_id = :studentId
				""";
		
		return template.queryForObject(sql, Map.of(
				"classId",classId,
				"studentId",studentId
				), new BeanPropertyRowMapper<>(RegistrationForm.class));
	}
	
	public List<RegistrationListVO> searchByClassId(int id){
		return template.query(SELECT_BY_CLASS, Map.of("classId",id), new BeanPropertyRowMapper<>(RegistrationListVO.class));
	}
	
	public List<RegistrationListVO> searchByStudentId(int id){
		return template.query(SELECT_BY_STUDENT, Map.of("studentId",id), new BeanPropertyRowMapper<>(RegistrationListVO.class));
	}
	
	
	private void create(RegistrationForm form) {
		if(form.getRegistDate()==null) {
			form.setRegistDate(LocalDate.now());
		}
		
		regInsert.execute(Map.of(
				"classes_id",form.getClassId(),
				"student_id",form.getStudentId(),
				"registration_date",Date.valueOf(form.getRegistDate())
				));
	}
	
	public boolean checkNotExistStudentId(RegistrationForm form) {
		List<Integer> result=template.query("""
				select id from student where realId= :realId;
				""",Map.of("realId",form.getRealId()),(rs,row) -> rs.getInt("id"));
		return !result.isEmpty();
	}
	
	public boolean checkStudentExistInTheClass(RegistrationForm form) {
		List<Integer> result=template.query("""
				select student_id from registration r
				JOIN student s on r.student_id = s.id
				WHERE s.realId = :realId AND r.classes_id = :classId;
				""",Map.of("realId",form.getRealId(),
						"classId",form.getClassId()
						),(rs,row) -> rs.getInt("student_id"));
		return !result.isEmpty();
	}
}
