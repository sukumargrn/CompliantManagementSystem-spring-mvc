package com.modal.complaintManagementSystem.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.modal.complaintManagementSystem.dto.ChangePasswordDto;
import com.modal.complaintManagementSystem.dto.ProfileDto;
import com.modal.complaintManagementSystem.exception.InvalidPasswordException;
import com.modal.complaintManagementSystem.exception.PasswordMismatchException;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;
import com.modal.complaintManagementSystem.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@SessionAttributes("profileDto")
@Slf4j
@RequestMapping("/")
public class ProfileController {

	@Autowired
	private UserService userService;

	@GetMapping("/getUserProfile")
	public ResponseEntity<ProfileDto> getProfilePage(HttpSession session) {
		ProfileDto profileDto = (ProfileDto) session.getAttribute("profileDto");
		System.out.println(profileDto);
		if (profileDto != null) {
			return new ResponseEntity<>(profileDto, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
	}

	@PostMapping("/updateProfile")
	public ResponseEntity<String> updateProfile(@Valid @ModelAttribute ProfileDto dto, HttpSession session) {
		try {
			System.out.println("Updated profile dto: " + dto);

			ProfileDto profileDto = (ProfileDto) session.getAttribute("profileDto");
			if (profileDto == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Profile data not found in session");
			}
			int userId = profileDto.getUserId();
			if (userId == 0) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User ID not found in profile data");
			}

			// Update profile
			ProfileDto updatedProfileDto = userService.validateAndUpdateUserProfile(dto);

			// Update session data
			session.setAttribute("profileDto", updatedProfileDto);

			return ResponseEntity.ok().body("Profile updated successfully");
		} catch (Exception e) {
			// Log the error and return an error response
			System.err.println("Error updating profile: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating profile");
		}
	}

	@GetMapping("/display")
	public void displayUserImageByImagePath(HttpServletResponse response, @RequestParam String imagePath)
			throws IOException {
		log.info("Displaying image for email: {}", imagePath);
		String profileImagePath = imagePath;
		File file = new File("D:\\complaintSystemMangement\\" + profileImagePath);
		InputStream in = new BufferedInputStream(new FileInputStream(file));
		ServletOutputStream out = response.getOutputStream();
		IOUtils.copy(in, out);
		response.flushBuffer();
	}

	@PostMapping("/changePassword")
	public ResponseEntity<?> changePassword(@RequestBody ChangePasswordDto changePasswordDto, HttpSession session) {
		System.out.println(changePasswordDto);
		try {
			ProfileDto profileDto = (ProfileDto) session.getAttribute("profileDto");
			if (profileDto == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Profile data not found in session");
			}
			int userId = profileDto.getUserId();
			changePasswordDto.setUserId(userId);
			ProfileDto updatedProfile = userService.changeUserPassword(changePasswordDto);
			return ResponseEntity.ok(updatedProfile);
		} catch (UserNotFoundException | InvalidPasswordException | PasswordMismatchException ex) {
			return ResponseEntity.badRequest().body(ex.getMessage());
		} catch (Exception ex) {
			// Handle unexpected exceptions
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred.");
		}
	}

	/*
	 * @PostMapping("/changePassword") public ResponseEntity<?>
	 * changePassword(@RequestParam String oldPassword, @RequestParam String
	 * newPassword,
	 * 
	 * @RequestParam String confirmPassword, HttpSession session) {
	 * System.out.println("oldPassword" + oldPassword);
	 * System.out.println("newPassword" + newPassword); ChangePasswordDto
	 * changePasswordDto = new ChangePasswordDto();
	 * changePasswordDto.setOldPassword(oldPassword);
	 * changePasswordDto.setNewPassword(newPassword);
	 * changePasswordDto.setConfirmPassword(confirmPassword);
	 * System.out.println(changePasswordDto); try { ProfileDto profileDto =
	 * (ProfileDto) session.getAttribute("profileDto"); if (profileDto == null) {
	 * return ResponseEntity.status(HttpStatus.UNAUTHORIZED).
	 * body("Profile data not found in session"); } int userId =
	 * profileDto.getUserId(); changePasswordDto.setUserId(userId); ProfileDto
	 * updatedProfile = userService.changeUserPassword(changePasswordDto); return
	 * ResponseEntity.ok(updatedProfile); } catch (UserNotFoundException |
	 * InvalidPasswordException | PasswordMismatchException ex) { return
	 * ResponseEntity.badRequest().body(ex.getMessage()); } catch (Exception ex) {
	 * // Handle unexpected exceptions return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
	 * body("An unexpected error occurred."); } }
	 */

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.setAttribute("profileDto", null);
		session.invalidate(); // Invalidate the session
		log.info("User logged out for email: {}");
		return "redirect:/HomePage"; // Redirect to the login page
	}
}
