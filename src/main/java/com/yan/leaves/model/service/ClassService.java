package com.yan.leaves.model.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.yan.leaves.model.dto.input.ClassForm;
import com.yan.leaves.model.dto.output.ClassDetailsVO;
import com.yan.leaves.model.dto.output.ClassListVO;
import com.yan.leaves.model.service.mapper.ClassFormRowMapper;
import com.yan.leaves.model.service.mapper.ClassListVoRowMapper;

@Service
public class ClassService {
	private RowMapper<ClassListVO> mapper;
	private static final String SELECT_PROJECTION = """
	        SELECT c.id AS id, t.id AS teacherId, a.name AS teacherName, t.phone AS teacherPhone,
	        c.start_date AS startDate, c.months, c.description, COUNT(r.student_id) AS studentCount
	        FROM classes c
	        JOIN teacher t ON t.id = c.teacher_id
	        JOIN account a ON a.id = t.id
	        LEFT JOIN registration r ON c.id = r.classes_id
	        """;

	private static final String SELECT_GROUPBY = " group by c.id,t.id,a.name,t.phone,c.start_date,c.months,c.description";
	
	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert insert;
	
	@Autowired
	private RegistrationService regService;
	@Autowired
	private LeaveService leaService;
	
	public ClassService(DataSource dataSource) {
		template=new NamedParameterJdbcTemplate(dataSource);
		insert=new SimpleJdbcInsert(dataSource);
		
		insert.setTableName("classes");
		insert.setGeneratedKeyName("id");
		insert.setColumnNames(List.of("teacher_id","start_date","months","description"));
	}
	
	public List<ClassListVO> search(Optional<String> teacher,Optional<LocalDate> from,Optional<LocalDate> to){
		
		var sb=new StringBuffer(SELECT_PROJECTION);
		sb.append(" where 1 =1 ");
		
		var param=new HashMap<String, Object>();
		
		teacher.ifPresent(a -> {
	        param.put("teacher", a.toLowerCase().concat("%"));
	        sb.append(" and lower(a.name) like :teacher");
	    });

	    from.ifPresent(a -> {
	        param.put("from", Date.valueOf(a));
	        sb.append(" and c.start_date >= :from");
	    });

	    to.ifPresent(a -> {
	        param.put("to", Date.valueOf(a));
	        sb.append(" and c.start_date <= :to");
	    });
		
		
		sb.append(SELECT_GROUPBY);
		
		return template.query(sb.toString(), param,new BeanPropertyRowMapper<>(ClassListVO.class));
	}
	
	public ClassForm findById(int id) {
		return template.queryForObject("select * from Classes where id = :id", Map.of("id",id),new ClassFormRowMapper());
	}
	
	public ClassListVO findInfoById(int classId) {
		var sql="%s where c.id = :id %s".formatted(SELECT_PROJECTION,SELECT_GROUPBY);
		return template.queryForObject(sql, Map.of("id", classId),new BeanPropertyRowMapper<>(ClassListVO.class));
	}
	
	public ClassDetailsVO findDetailsById(int classId) {
		var result=new ClassDetailsVO();
		//class information
		var sql="%s where c.id = :id %s".formatted(SELECT_PROJECTION,SELECT_GROUPBY);
		var classListVo=template.queryForObject(sql, Map.of("id",classId), new ClassListVoRowMapper());
		result.setClassInfo(classListVo);
		
		//Registrations
		result.setRegistrations(regService.searchByClassId(classId));
		
		//leaves for Classes
		result.setLeaves(leaService.search(Optional.of(classId), Optional.empty(), Optional.empty(), Optional.empty()));
		
		return result;
	}
	
	public int save(ClassForm form) {
		if(form.getId()==0) {
			return insert(form);
		}
		return update(form);
	}
	
	
	private int update(ClassForm form) {
		template.update("""
				update classes set teacher_id = :teacher,months = :months,
				start_date= :start,description = :desp where id= :id
				""",Map.of(
						"teacher",form.getTeacherName(),
						"months",form.getMonths(),
						"start",Date.valueOf(form.getStart()),
						"desp",form.getDescription(),
						"id",form.getId()
						));
		return form.getId();
	}

	private int insert(ClassForm form) {
		var genratedId=insert.executeAndReturnKey(Map.of(
				"teacher_id",form.getTeacherName(),
				"start_date",Date.valueOf(form.getStart()),
				"months",form.getMonths(),
				"description",form.getDescription()
				));
		return genratedId.intValue();
	}

	
	
}
