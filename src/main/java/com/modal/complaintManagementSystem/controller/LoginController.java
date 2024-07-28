package com.modal.complaintManagementSystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.modal.complaintManagementSystem.dto.ProfileDto;
import com.modal.complaintManagementSystem.exception.InvalidPasswordException;
import com.modal.complaintManagementSystem.exception.InvalideEmailException;
import com.modal.complaintManagementSystem.service.UserService;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	UserService userService;

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
		System.out.println("Login controller: ");
		if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
			model.addAttribute("error", "Email and Password are required.");
			return "signin";
		}

		try {
			ProfileDto profileDto = userService.loginUser(email, password);
			session.setAttribute("profileDto", profileDto);
			return "profile";
		} catch (InvalideEmailException | InvalidPasswordException e) {
			model.addAttribute("error", e.getMessage());
			return "signin";
		}
	}

	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // Invalidate session to clear all data
		return "redirect:/SignInPage"; // Redirect to login page
	}

	public static class LoginRequest {
		private String email;
		private String password;

		// Getters and setters
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
	}
}
