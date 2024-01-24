package com.yan.leaves.model.service;

import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.output.StudentListVO;

@Service
public class StudentService {
	
	private static final String SELECT_PROJECTION = """
			select s.id, a.name, s.phone, a.email, s.education, count(r.classes_id) classCount
			from student s
			join accout a on s.id = a.id
			left join registration r on s.id = r.student_id
			""";
	
	private static final String SELECT_GROUPBY="""
			group by s.id, a.name, s.phone, a.email, s.education
			""";
	
	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert studentInsert;
	private SimpleJdbcInsert accountInsert;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public StudentService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);
		
		studentInsert= new SimpleJdbcInsert(dataSource);
		studentInsert.setTableName("student");
		
		accountInsert= new SimpleJdbcInsert(dataSource);
		accountInsert.setTableName("account");
		accountInsert.setGeneratedKeyName("id");
		accountInsert.setColumnNames(List.of(
				"name","role", "email", "password"
				));
	}
	
	public List<StudentListVO> search(Optional<String> name,Optional<String> phone,Optional<String> email){
		return List.of();
	}

	public StudentListVO findInfoById(int studentId) {
		// TODO Auto-generated method stub
		return null;
	}
}
