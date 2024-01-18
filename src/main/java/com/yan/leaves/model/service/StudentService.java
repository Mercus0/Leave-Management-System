package com.yan.leaves.model.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.output.StudentListVO;

@Service
public class StudentService {
	public List<StudentListVO> search(Optional<String> name,Optional<String> phone,Optional<String> email){
		return List.of();
	}
}
