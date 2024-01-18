package com.yan.leaves.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.yan.leaves.model.dto.input.LeaveForm;
import com.yan.leaves.model.dto.output.LeaveListVO;
import com.yan.leaves.model.dto.output.LeaveSummaryVO;

@Service
public class LeaveService {
	public List<LeaveListVO> search(Optional<Integer> classId, Optional<String> studentName, Optional<LocalDate> from,
			Optional<LocalDate> to) {
		return List.of();
	}

	public LeaveForm findById(int id) {
		return null;
	}

	public int save(LeaveForm form) {
		return 0;
	}

	public List<LeaveSummaryVO> searchSummary(Optional<LocalDate> target) {
		return null;
	}
}
