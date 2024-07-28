package com.modal.complaintManagementSystem.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Id;

import lombok.Data;

@Data
public class ComplaintDto {
	
	@Id
	private Long complaintId;
	private int userId;
	private String department;
	private String country;
	private String state;
	private String cityArea;
	private String complaintAddress;
	private String complaintDetails;
	private String status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	

}
