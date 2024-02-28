package com.yan.leaves.model.service;

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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.yan.leaves.model.dto.input.MemberStatusForm;
import com.yan.leaves.model.dto.input.RegistrationForm;
import com.yan.leaves.model.dto.input.StudentForm;
import com.yan.leaves.model.dto.output.StudentDetailsVO;
import com.yan.leaves.model.dto.output.StudentListVO;

import jakarta.validation.Valid;

@Service
public class StudentService {

	private static final String SELECT_PROJECTION = """
			select a.id, s.realId, a.name, s.phone, a.email, s.education, count(r.classes_id) classCount,
			s.realId,s.gender,s.address,s.assign_date assignDate,a.deleted,a.profile_image profileImage
			from student s
			join account a on s.id = a.id
			left join registration r on s.id = r.student_id
			""";

	private static final String SELECT_GROUPBY = """
			group by s.id, a.name, s.phone, a.email, s.education
			""";

	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert studentInsert;
	private SimpleJdbcInsert accountInsert;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private RegistrationService registrationService;

	public StudentService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);

		studentInsert = new SimpleJdbcInsert(dataSource);
		studentInsert.setTableName("student");

		accountInsert = new SimpleJdbcInsert(dataSource);
		accountInsert.setTableName("account");
		accountInsert.setGeneratedKeyName("id");
		accountInsert.setColumnNames(List.of("name", "role", "email", "password"));
	}

	public List<StudentListVO> search(Optional<String> name, Optional<String> phone, Optional<String> email) {
		var sb = new StringBuffer(SELECT_PROJECTION);
		sb.append(" where 1=1");
		var params = new HashMap<String, Object>();

		sb.append(email.filter(StringUtils::hasLength).map(a -> {
			params.put("email", a.toLowerCase().concat("%"));
			return " and lower(a.email) like :email";
		}).orElse(""));

		sb.append(name.filter(StringUtils::hasLength).map(a -> {
			params.put("name", a.toLowerCase().concat("%"));
			return " and lower(a.name) like :name";
		}).orElse(""));

		sb.append(phone.filter(StringUtils::hasLength).map(a -> {
			params.put("phone", a.toLowerCase().concat("%"));
			return " and lower(s.phone) like :phone";
		}).orElse(""));

		sb.append(" ").append(SELECT_GROUPBY).append(" order by a.name");
		return template.query(sb.toString(), params, new BeanPropertyRowMapper<>(StudentListVO.class));
	}

	public StudentListVO findInfoById(int studentId) {
		 var sql = "%s where s.id = :id %s".formatted(SELECT_PROJECTION,SELECT_GROUPBY);
		return template.queryForObject(sql, Map.of("id", studentId), new BeanPropertyRowMapper<>(StudentListVO.class));
	}

//	@Transactional(propagation = Propagation.REQUIRED)
//	public Integer createStudent(RegistrationForm form) {
//		// insert into account
//		var generatedId = accountInsert.executeAndReturnKey(Map.of("name", form.getStudentName(), "role", "Student",
//				"email", form.getEmail(), "password", passwordEncoder.encode(form.getPhone())));
//
//		// insert into Student
//		studentInsert.execute(Map.of("id", generatedId.intValue(), "phone", form.getPhone(), "education",
//				form.getEducation(), "realId", form.getRealId()));
//		return generatedId.intValue();
//	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void createStudent(StudentForm form) {
		// insert into account
		var generatedId = accountInsert.executeAndReturnKey(Map.of("name", form.getName(), "role", "Student", "email",
				form.getEmail(), "password", passwordEncoder.encode(form.getPhone())));

		// insert into Student
		studentInsert.execute(Map.of("id", generatedId.intValue(), "phone", form.getPhone(), "education",
				form.getEducation(), "realId", form.getRealId(), "gender", form.getGender(), "address",
				form.getAddress(), "assign_date", form.getAssignDate()));
	}

	public StudentDetailsVO findDetailsByLoginId(String email) {
		var result = new StudentDetailsVO();
		var studentId = findStudentByEmail(email);
		result.setStudent(findInfoById(studentId));
		result.setRegistrations(registrationService.searchByStudentId(studentId));
		return result;
	}

	@Transactional
	public Integer editStudent(@Valid StudentForm form) {
		// update into account
		template.update("update account set name = :name, email = :email where id = :id",
				Map.of("name", form.getName(), "email", form.getEmail(), "id", form.getId()));

		// update into student
		template.update(
				"update student set phone = :phone, education = :education,realId = :realId,gender = :gender, address = :address where id= :id",
				Map.of("phone", form.getPhone(), "education", form.getEducation(), "realId", form.getRealId(), "gender",
						form.getGender(), "address", form.getAddress(), "id", form.getId()));
		return form.getId();
	}

	public boolean checkStudent(StudentForm form) {
		List<Integer> result = template.query("select id from student where realId = :realId",
				Map.of("realId", form.getRealId()), (rs, rowNum) -> rs.getInt("id"));

		return !result.isEmpty();
	}
	
	public Integer findStudentByEmail(String email) {
		return template.queryForList("""
				select s.id from student s join account a on s.id= a.id where a.email = :email
				""", Map.of("email", email), Integer.class).stream().findFirst().orElse(null);
	}

	public Integer findStudentByRealId(String realId) {
		return template.queryForList("""
				select s.id from student s join account a on s.id= a.id where s.realId = :realId
				""", Map.of("realId", realId), Integer.class).stream().findFirst().orElse(null);
	}
	
	@Transactional
	public void updateStatus(Optional<Integer> id, boolean deleted) {
			if(deleted) {
				template.update("""
						update account set deleted = 0 where id= :id
						""",Map.of("id",id.orElse(null)));
			}else {
				template.update("""
						update account set deleted = 1 where id= :id
						""",Map.of("id",id.orElse(null)));
			}
	}

	public void addProfileImage(String profileImage, String email) {
		template.update("""
				update account set profile_image = :profileImage where
				email = :email;
				""", Map.of("profileImage",profileImage,
							"email",email));
	}
}
