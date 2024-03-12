package com.yan.leaves.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.yan.leaves.model.dto.input.TeacherForm;
import com.yan.leaves.model.dto.output.IdWithName;
import com.yan.leaves.model.dto.output.TeacherListVO;

@Service
public class TeacherService {

	private static final String SELECT_PROJECTION = """
			select t.id,a.name,t.phone,a.email,t.assign_date assignDate,count(c.id) classCount,a.deleted 
			from teacher t join account a on a.id=t.id left join classes c on c.teacher_id=t.id
			""";
	private static final String SELECT_GROUP_BY = "group by t.id,a.name,t.phone,a.email,t.assign_date";

	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert accountInsert;
	private SimpleJdbcInsert teacherInsert;

	private org.springframework.jdbc.core.RowMapper<TeacherListVO> mapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public TeacherService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);

		accountInsert = new SimpleJdbcInsert(dataSource);
		accountInsert.setTableName("account");
		accountInsert.setGeneratedKeyName("id");
		accountInsert.setColumnNames(List.of("name", "role", "email", "password"));

		teacherInsert = new SimpleJdbcInsert(dataSource);
		teacherInsert.setTableName("teacher");

		mapper = new BeanPropertyRowMapper<>(TeacherListVO.class);
	}

	@Transactional
	public int save(TeacherForm form) {
		if (form.getId() == 0) {
			return insert(form);
		}
		return update(form);
	}

	public List<TeacherListVO> search(Optional<Integer> status, Optional<String> name, Optional<String> phone, Optional<String> email) {
		var where = new StringBuffer();
		var params = new HashMap<String, Object>();
		// dynamic query
		
		where.append(status.filter(s -> s!=2).map(a -> {
			params.put("status",a);
			return "and a.deleted= :status ";
		}).orElse(""));
		
		where.append(email.filter(StringUtils::hasLength).map(a -> {
			params.put("email", a.concat("%"));
			return "and a.email like :email ";
		}).orElse(""));

		where.append(name.filter(StringUtils::hasLength).map(a -> {
			params.put("name", a.toLowerCase().concat("%"));
			return "and lower(a.name) like :name ";
		}).orElse(""));

		where.append(phone.filter(StringUtils::hasLength).map(a -> {
			params.put("phone", a.concat("%"));
			return "and t.phone like :phone ";
		}).orElse(""));
  
		var sql = "%s where 1=1 %s %s".formatted(SELECT_PROJECTION, where.toString(), SELECT_GROUP_BY);
		return template.query(sql, params, mapper);
	}

	public TeacherListVO findById(int id) {
		var sql = "%s where %s %s".formatted(SELECT_PROJECTION, "t.id=:id", SELECT_GROUP_BY);
		return template.queryForObject(sql, Map.of("id", id), mapper);
	}

	private int insert(TeacherForm form) {
		// Insert into account
		var generateId = accountInsert.executeAndReturnKey(Map.of("name", form.getName(), "role", "Teacher", "email",
				form.getEmail(), "password", passwordEncoder.encode(form.getPhone())));
		// Insert into teacher
		teacherInsert.execute(Map.of("id", generateId.intValue(), "phone", form.getPhone(), "assign_date",
				Date.valueOf(form.getAssignDate())));
		return generateId.intValue();
	}

	private int update(TeacherForm form) {
		// update Account Table
		template.update("update account set name=:name,email= :email where id=:id",
				Map.of("name", form.getName(),
						"email",form.getEmail(),
						"id", form.getId()));
		// Update Teacher Table
		template.update("update teacher set phone=:phone, assign_date=:assign_date where id=:id", Map.of("phone",
				form.getPhone(), "assign_date", Date.valueOf(form.getAssignDate()), "id", form.getId()));
		return form.getId(); 
	}

	public List<IdWithName> getAvailableTeacher() {
		return template.query("select t.id,a.name from teacher t join account a on t.id=a.id where a.deleted=:del",
				Map.of("del",false),
				new BeanPropertyRowMapper<>(IdWithName.class));
	}
	
	@Transactional
	public void status(Optional<Integer> id, Optional<Integer> status) {
		template.update("""
				update account set deleted= :deleted where id= :id
				""", Map.of("id",id.orElse(null),
						"deleted",status.orElse(0) == 1 ? 0:1));
	}

}
