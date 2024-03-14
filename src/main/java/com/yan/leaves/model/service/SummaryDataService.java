package com.yan.leaves.model.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.output.NameAndCount;

@Service
public class SummaryDataService {
	
	private static final DateTimeFormatter DF = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	private NamedParameterJdbcTemplate template;

	public SummaryDataService(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<NameAndCount> findCategoryData() {	
		return template.query("""
				SELECT c.description name, COUNT(*) AS count FROM
				leaves l JOIN classes c ON l.classes_id = c.id
				where c.deleted = 0 
				GROUP BY c.description;
				""", new BeanPropertyRowMapper<>(NameAndCount.class));
	}

	public List<NameAndCount> findTopLeaves(int count) {
		return template.query("""
				SELECT a.name
				FROM account a
				JOIN leaves l ON a.id = l.student_id
				where a.deleted = 0
				GROUP BY a.name
				ORDER BY COUNT(l.student_id) DESC
				LIMIT :count;
				""",Map.of("count",count),new BeanPropertyRowMapper<>(NameAndCount.class));
	}

	public List<Integer> getBusinessYears() {
		var result = new ArrayList<Integer>();
		
		//first date of leaves
		var minYear = template.queryForObject("SELECT YEAR(MIN(start_date)) FROM leaves",new MapSqlParameterSource(), Integer.class);
		
		//last date of leaves
		var maxYear = template.queryForObject("SELECT YEAR(MAX(start_date)) FROM leaves", new MapSqlParameterSource(), Integer.class);
		
		var target = minYear;
		
		while(target <= maxYear) {
			result.add(target ++);
		}
		return result;
	}

	public List<NameAndCount> search(int year, Month month) {
		var yearMonth = YearMonth.of(year,month);
		var target = yearMonth.atDay(1);
		var lastDay = yearMonth.atEndOfMonth();
		
		var result = new ArrayList<NameAndCount>();
		
		while(target.compareTo(lastDay) <= 0) {
			var from = target.atStartOfDay();
			var to = target.plusDays(1).atStartOfDay();
			long count = getCountForRange(from,to);
			result.add(new NameAndCount(target.format(DF),count));
			target = target.plusDays(1);
		}
		return result;
	}
	
	public List<NameAndCount> search(int year) {
		var result = new ArrayList<NameAndCount>();
		for(var month : Month.values()) {
			var target = YearMonth.of(year, month);
			var from = target.atDay(1).atStartOfDay();
			var to = target.atEndOfMonth().plusDays(1).atStartOfDay();
			long count = getCountForRange(from, to);
			result.add(new NameAndCount(month.name(),count));
		}
		return result;
	}

	private long getCountForRange(LocalDateTime from, LocalDateTime to) {
		String query = "select count(*) from leaves where start_date >= :from and start_date < :to";
		Map<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to",to);
		return template.queryForObject(query, params, Long.class);
	}



}
