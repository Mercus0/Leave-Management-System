package com.yan.leaves.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.input.RegistrationForm;
import com.yan.leaves.model.dto.output.RegistrationDetailsVO;
import com.yan.leaves.model.dto.output.RegistrationListVO;

@Service
public class RegistrationService {
	public List<RegistrationListVO> searchByClassId(int id){
		return List.of();
	}
	
	public int save(RegistrationForm form) {
		return 0;
	}
	
	public RegistrationDetailsVO findDetailsById(int id) {
		return null;
	}

	public RegistrationForm getFormById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
