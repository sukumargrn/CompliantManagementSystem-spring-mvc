package com.modal.complaintManagementSystem.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Id;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

	@Id
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private long contactNumber;
	private long alterContactNumber;
	private String address;
	private boolean agreement;
	private String imagePath;
	private String password;
	private Timestamp createdAt;
	
	 // Getter and Setter for createdAt
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Method to set createdAt from LocalDateTime
    public void setCreatedAt(LocalDateTime localDateTime) {
        this.createdAt = Timestamp.valueOf(localDateTime);
    }
}
