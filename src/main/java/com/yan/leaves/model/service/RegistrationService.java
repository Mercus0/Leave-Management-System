package com.yan.leaves.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yan.leaves.model.dto.input.RegistrationForm;
import com.yan.leaves.model.dto.output.RegistrationDetailsVO;
import com.yan.leaves.model.dto.output.RegistrationListVO;

@Service
public class RegistrationService {
	
	private static final String SELECT_BY_CLASS="""
			select r.classes_id classId, c.teacher_id teacherId, ta.name teacher,
			c.start_date startDate, r.student_id studentId, sa.name student, s.phone studentPhone, r.registration_date
			from registration r
			join classes c on r.classes_id = c.id
			join teacher t on c.teacher_id = t.id join account ta on t.id = ta.id
			join student s on r.student_id = s.id join account sa on s.id = sa.id
			where r.classes_id = :classId
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
		//update
		if(form.getStudentId()>0) {
			update(form);
			return;
		}
		create(form);
	}
	
	public RegistrationDetailsVO findDetailsById(int classId, int studentId) {
		var result = new RegistrationDetailsVO();
		var registDate = template.queryForObject("""
				select registration_date from registration where classes_id = :classId and student_id = :studentId
				""",
				Map.of("classId",classId,"studentId",studentId), Date.class);
		result.setRegistDate(registDate.toLocalDate());
		result.setClassinfo(classsService.findDetailsById(classId));
		result.setStudent(studentService.findInfoById(studentId));
		return result;
	}
	
	private void create(RegistrationForm form) {
		// TODO Auto-generated method stub
		
	}

	private void update(RegistrationForm form) {
		// TODO Auto-generated method stub
		
	}

	public List<RegistrationListVO> searchByClassId(int id){
		return List.of();
	}
	
	public RegistrationForm getFormById(int classId, int studentId) {
		var form=new RegistrationForm();
		form.setClassId(id);
		return form;
	}
}
