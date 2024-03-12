package com.yan.leaves.model.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.output.NameAndCount;

@Service
public class SummaryDataService {
	private NamedParameterJdbcTemplate template;

	public SummaryDataService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<NameAndCount> findCategoryData() {	
		return template.query("""
				SELECT c.description name, COUNT(*) AS count FROM
				leaves l JOIN classes c ON l.classes_id = c.id
				GROUP BY c.description;
				""", new BeanPropertyRowMapper<>(NameAndCount.class));
	}

}
