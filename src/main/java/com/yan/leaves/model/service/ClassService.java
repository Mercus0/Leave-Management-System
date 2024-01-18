package com.yan.leaves.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.input.ClassForm;
import com.yan.leaves.model.dto.output.ClassDetailsVO;
import com.yan.leaves.model.dto.output.ClassListVO;


@Service
public class ClassService {
	public List<ClassListVO> search(Optional<String> teacher,Optional<LocalDate> from,Optional<LocalDate> to){
		return List.of();
	}
	
	public ClassForm findById(int id) {
		return null;
	}
	
	public int save(ClassForm form) {
		return 0;
	}
	
	public ClassDetailsVO findDetailsById(int id) {
		return null;
	}
	
}
