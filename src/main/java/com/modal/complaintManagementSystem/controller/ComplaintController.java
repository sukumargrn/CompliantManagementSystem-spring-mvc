package com.modal.complaintManagementSystem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.modal.complaintManagementSystem.dto.ComplaintResponse;
import com.modal.complaintManagementSystem.dto.ProfileDto;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;
import com.modal.complaintManagementSystem.service.ComplaintService;


import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/")
public class ComplaintController {

	private static final Logger logger = LoggerFactory.getLogger(ComplaintController.class);

	@Autowired
	private ComplaintService complaintService;

	@GetMapping("/getComplaintDetails")
	@ResponseBody
	public ComplaintResponse getComplaintDetail(HttpSession session) throws UserNotFoundException {
		// Retrieve profile from session
		ProfileDto profileDto = (ProfileDto) session.getAttribute("profileDto");
		if (profileDto == null) {
			logger.warn("User not logged in or session has expired.");
			return null;
		}
		int userId = profileDto.getUserId();
		logger.info("Fetching complaint details for userId: {}", userId);

		ComplaintResponse response = complaintService.getComplaintDetailsByUserId(userId);
		return response;
	}
	
	 @PostMapping("/updateComplaintDetails")
	    public ResponseEntity<String> updateComplaintDetails(@RequestParam int complaintId,@RequestParam String complaintDetails) {
		 logger.info("Fetching complaint details for complaintId: {}", complaintId);    
		 logger.info("Fetching complaint details for complaintDetails: {}", complaintDetails);    
		 boolean updated = complaintService.updateComplaintDetails(complaintId, complaintDetails);
	        return updated ? ResponseEntity.ok("Complaint details updated successfully") : ResponseEntity.status(500).body("Failed to update Complaint details");
	    }

	/*
	 * @GetMapping("/getComplaintDetails") public ResponseEntity<?>
	 * getComplaintDetails(HttpSession session) { try { // Retrieve profile from
	 * session ProfileDto profileDto = (ProfileDto)
	 * session.getAttribute("profileDto"); if (profileDto == null) {
	 * logger.warn("User not logged in or session has expired."); return
	 * ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new
	 * ErrorResponse("User not logged in.")); }
	 * 
	 * int userId = profileDto.getUserId();
	 * logger.info("Fetching complaint details for userId: {}", userId);
	 * 
	 * ComplaintResponse complaintDetails =
	 * complaintService.getComplaintDetailsByUserId(userId); if (complaintDetails ==
	 * null) { logger.info("No complaint details found for userId: {}", userId);
	 * return ResponseEntity.status(HttpStatus.NOT_FOUND) .body(new
	 * ErrorResponse("No complaint details found.")); }
	 * 
	 * logger.info("Successfully retrieved complaint details for userId: {}",
	 * userId); return ResponseEntity.ok(complaintDetails);
	 * 
	 * } catch (RuntimeException e) { // Catch specific exceptions if applicable
	 * logger.error("Specific error occurred: {}", e.getMessage(), e); return
	 * ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new
	 * ErrorResponse("Specific error message.")); } catch (Exception e) { // Log the
	 * exception for debugging purposes
	 * logger.error("An error occurred while processing the request: {}",
	 * e.getMessage(), e); // Return a generic error response return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR) .body(new
	 * ErrorResponse("An error occurred while processing the request.")); } }
	 * 
	 * // Define ErrorResponse class to standardize error responses public static
	 * class ErrorResponse { private String message;
	 * 
	 * public ErrorResponse(String message) { this.message = message; }
	 * 
	 * // Getter and setter public String getMessage() { return message; }
	 * 
	 * public void setMessage(String message) { this.message = message; } }
	 */
}
