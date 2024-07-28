package com.modal.complaintManagementSystem.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.modal.complaintManagementSystem.dto.ComplaintDto;
import com.modal.complaintManagementSystem.dto.ComplaintResponse;
import com.modal.complaintManagementSystem.entity.Complaint;
import com.modal.complaintManagementSystem.entity.UserEntity;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;
import com.modal.complaintManagementSystem.repository.ComplaintRepository;
import com.modal.complaintManagementSystem.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ComplaintServiceImpl implements ComplaintService {

	@Autowired
	private ComplaintRepository complaintRepository;

	@Autowired
	private UserRepository userRepository;

	@Override
	public ComplaintDto saveUserComplint(ComplaintDto complaintDto) {

		if (complaintDto != null) {

			UserEntity userEntity = this.userRepository.getById(complaintDto.getUserId());

			Complaint complaint = new Complaint();
			BeanUtils.copyProperties(complaintDto, complaint);
			complaint.setUser(userEntity);
			complaint.setCreatedAt(LocalDateTime.now());
			complaint.setStatus("Rigister");
			System.out.println("Service complaint dto before save: " + complaint);

			Complaint complaintSave = this.complaintRepository.save(complaint);

			System.out.println("Service complaint dto after save: " + complaintSave);
			if (complaintSave != null) {
				log.info("complint is dave succesfully");
				return complaintDto;

			}

		}

		return complaintDto;
	}

	@Override
	public ComplaintResponse getComplaintDetailsByUserId(int userId) throws UserNotFoundException {
		UserEntity userEntity = this.userRepository.findById(userId)
				.orElseThrow(() -> new UserNotFoundException("User not found"));

		System.out.println("sjbnf;sjkbn;sdfnb;sfnasfnsad;fb");
		List<Complaint> complaintsList = this.complaintRepository.findByUser(userEntity);

		// Prepare response
		ComplaintResponse response = new ComplaintResponse();
		response.setTotalComplaints(complaintsList.size());
		response.setComplaints(complaintsList);

		long inProgressCount = complaintsList.stream()
				.filter(complaint -> "In Progress".equalsIgnoreCase(complaint.getStatus())).count();
		long closedCount = complaintsList.stream().filter(complaint -> "Closed".equalsIgnoreCase(complaint.getStatus()))
				.count();

		response.setInProgressComplaints(inProgressCount);
		response.setClosedComplaints(closedCount);

		return response;
	}

	@Transactional
	@Override
	public boolean updateComplaintDetails(int complaintId, String complaintDetails) {
		return complaintRepository.updateComplaintDetails(complaintId, complaintDetails) > 0;
	}

}
