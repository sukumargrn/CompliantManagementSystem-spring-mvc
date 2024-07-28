package com.modal.complaintManagementSystem.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.modal.complaintManagementSystem.dto.UserDto;
import com.modal.complaintManagementSystem.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/")
@Slf4j
@EnableWebMvc
public class RegisterController {

	@Autowired
	private UserService userService;

	@GetMapping(value = "/checkEmailExistence/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkEmailExistence(@PathVariable String email) {
		log.info("Received request to check email existence for email: {}", email);
		boolean existsByEmailId = userService.existsByEmail(email);
		if (existsByEmailId) {
			log.info("Email exists in the database: {}", email);
			return "EmailIDexists";
		} else {
			log.info("Email does not exist in the database: {}", email);
			return "EmailIDnotexists";
		}
	}

	@GetMapping(value = "/checkContactNumberExistence/{contactNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkContactNumberExistence(@PathVariable Long contactNumber) {
		log.info("Received request to check contact number existence for contact number: {}", contactNumber);
		boolean existsByContactNumber = userService.existsByContactNumber(contactNumber);
		if (existsByContactNumber) {
			log.info("Contact number exists in the database: {}", contactNumber);
			return "contactNumberexists";
		} else {
			log.info("Contact number does not exist in the database: {}", contactNumber);
			return "contactNumberNotExists";
		}
	}

	@PostMapping("/register")
	public ResponseEntity<?> saveVendorDTO(@RequestBody @Valid UserDto dto, HttpSession session,
			BindingResult bindingResult) {
		log.info("Registering user with data: {}", dto);

		if (bindingResult.hasErrors()) {
			StringBuilder errorMessages = new StringBuilder();
			bindingResult.getAllErrors().forEach(error -> errorMessages.append(error.getDefaultMessage()).append(" "));
			log.warn("User registration failed with errors: {}", errorMessages.toString());
			return ResponseEntity.badRequest().body(errorMessages.toString());
		}
		UserDto savedUser = userService.validateAndSaveUserDto(dto);
		if (savedUser != null) {
			log.info("User registration successful: {}", savedUser.getEmail());
			return ResponseEntity.ok("User registered successfully");
		} else {
			log.warn("User registration failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("User registration failed. Please try again.");
		}
	}
}
