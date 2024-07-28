package com.modal.complaintManagementSystem.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.validation.metadata.ConstraintDescriptor;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.modal.complaintManagementSystem.dto.ChangePasswordDto;
import com.modal.complaintManagementSystem.dto.ProfileDto;
import com.modal.complaintManagementSystem.dto.UserDto;
import com.modal.complaintManagementSystem.entity.UserEntity;
import com.modal.complaintManagementSystem.exception.InvalidPasswordException;
import com.modal.complaintManagementSystem.exception.InvalideEmailException;
import com.modal.complaintManagementSystem.exception.PasswordMismatchException;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;
import com.modal.complaintManagementSystem.mailSending.MailSending;
import com.modal.complaintManagementSystem.repository.UserRepository;
import com.modal.complaintManagementSystem.utils.GeneratePassword;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MailSending mailSending;

	@Autowired
	private GeneratePassword generatePassword;

	@Override
	public boolean existsByEmail(String email) {
		log.info("email come to service layer{}", email);

		return this.userRepository.existsByEmail(email);
	}

	@Override
	public boolean existsByContactNumber(long contactNumber) {
		log.info("email come to service layer{}", contactNumber);
		return this.userRepository.existsByContactNumber(contactNumber);
	}

	@Override
	public UserDto validateAndSaveUserDto(UserDto userDto) {
		UserEntity entity = new UserEntity();
		userDto.setPassword(generatePassword.generatePassword());
		userDto.setImagePath("user-default.png");
		userDto.setCreatedAt(LocalDateTime.now());
		BeanUtils.copyProperties(userDto, entity);
		UserEntity saveResult = this.userRepository.save(entity);

		if (saveResult != null) {
			System.out.println("Data is saved");
			boolean sendResult = mailSending.SendEmailRgisterSuccessfully(userDto); // sending method
			if (sendResult) {
				log.info("DTO is saved successfully and email sent");
			}
		}

		return null;
	}

	@Override
	public ProfileDto loginUser(String email, String password) throws InvalideEmailException, InvalidPasswordException {
		if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
			throw new InvalideEmailException("Email Id and Password must not be empty");
		}

		UserEntity userEntity = this.userRepository.findByEmail(email);
		System.out.println("Service: " + userEntity);

		if (userEntity == null) {
			throw new InvalideEmailException("Email Id does not exist");
		}

		if (!userEntity.getPassword().equals(password)) {
			throw new InvalidPasswordException("Password is incorrect");
		}

		System.out.println("User authenticated successfully.");
		ProfileDto profileDto = new ProfileDto();
		BeanUtils.copyProperties(userEntity, profileDto);
		System.out.println(profileDto);
		return profileDto;
	}

	@Override
	public ProfileDto getUserProfile(int userId) {
		UserEntity userEntity = userRepository.findById(userId)
				.orElseThrow(() -> new RuntimeException("User not found"));

		ProfileDto profileDto = new ProfileDto();

		BeanUtils.copyProperties(userEntity, profileDto);

		return profileDto;
	}

	/*********************
	 * update section
	 * 
	 * @throws IOException
	 ****************************/
	@Override
	public ProfileDto validateAndUpdateUserProfile(ProfileDto profileDto) throws IOException {
		saveImage(profileDto);

		UserEntity existingUser = userRepository.findByEmail(profileDto.getEmail());

		if (profileDto.getFirstName() != null) {
			existingUser.setFirstName(profileDto.getFirstName());
		}
		if (profileDto.getLastName() != null) {
			existingUser.setLastName(profileDto.getLastName());
		}
		if (profileDto.getEmail() != null) {
			existingUser.setEmail(profileDto.getEmail());
		}
		if (profileDto.getContactNumber() != 0) {
			existingUser.setContactNumber(profileDto.getContactNumber());
		}
		if (profileDto.getAlterContactNumber() != 0) {
			existingUser.setAlterContactNumber(profileDto.getAlterContactNumber());
		}
		if (profileDto.getAddress() != null) {
			existingUser.setAddress(profileDto.getAddress());
		}
		if (profileDto.isAgreement()) {
			existingUser.setAgreement(profileDto.isAgreement());
		}
		if (profileDto.getImagePath() != null) {
			existingUser.setImagePath(profileDto.getImagePath());
		}
		userRepository.save(existingUser);

		return profileDto;
	}

	private void saveImage(ProfileDto profileDto) throws IOException {
		if (profileDto.getImageFile() != null && !profileDto.getImageFile().isEmpty()) {
			byte[] fileBytes = profileDto.getImageFile().getBytes();
			String filePath = "D:\\complaintSystemMangement\\" + profileDto.getImageFile().getOriginalFilename();
			File newFile = new File(filePath);
			Path path = Paths.get(newFile.getAbsolutePath());
			Files.write(path, fileBytes);
			profileDto.setImagePath(profileDto.getImageFile().getOriginalFilename().toString());
		}
	}

	@Override
	public ProfileDto changeUserPassword(ChangePasswordDto changePasswordDto)
			throws PasswordMismatchException, InvalidPasswordException, UserNotFoundException {
		// Retrieve the existing user
		System.out.println(changePasswordDto);
		Optional<UserEntity> optionalUser = userRepository.findById(changePasswordDto.getUserId());
		System.out.println(optionalUser);
		if (!optionalUser.isPresent()) {
			// Handle case where user is not found
			throw new UserNotFoundException("User not found with ID: " + changePasswordDto.getUserId());
		}

		UserEntity existingUser = optionalUser.get();

		System.out.println("Servicessss"+existingUser);

		// Validate old password
		if (!existingUser.getPassword().equals(changePasswordDto.getOldPassword())) {
			// Handle incorrect old password
			throw new InvalidPasswordException("The old password is incorrect.");
		}

		// Validate new password and confirm password
		if (!changePasswordDto.getNewPassword().equals(changePasswordDto.getConfirmPassword())) {
			// Handle new password and confirm password mismatch
			throw new PasswordMismatchException("New password and confirm password do not match.");
		}

		// Update user password
		existingUser.setPassword(changePasswordDto.getNewPassword());
		userRepository.save(existingUser);
		ProfileDto profileDto = new ProfileDto();
		BeanUtils.copyProperties(existingUser, profileDto);

		return profileDto; // Assuming a method to convert UserEntity to ProfileDto
	}

}
