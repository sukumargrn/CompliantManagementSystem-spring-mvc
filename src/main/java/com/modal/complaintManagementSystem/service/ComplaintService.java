package com.modal.complaintManagementSystem.service;

import org.springframework.security.userdetails.UsernameNotFoundException;

import com.modal.complaintManagementSystem.dto.ComplaintDto;
import com.modal.complaintManagementSystem.dto.ComplaintResponse;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;

public interface ComplaintService {

	ComplaintDto saveUserComplint(ComplaintDto complaintDto);
	
	 ComplaintResponse getComplaintDetailsByUserId(int userId) throws UserNotFoundException;

	boolean updateComplaintDetails(int complaintId, String complaintDetails);
}
