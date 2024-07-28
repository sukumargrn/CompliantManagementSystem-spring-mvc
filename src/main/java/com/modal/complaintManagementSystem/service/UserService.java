package com.modal.complaintManagementSystem.service;

import java.io.IOException;
import com.modal.complaintManagementSystem.dto.ChangePasswordDto;
import com.modal.complaintManagementSystem.dto.ProfileDto;
import com.modal.complaintManagementSystem.dto.UserDto;
import com.modal.complaintManagementSystem.exception.InvalidPasswordException;
import com.modal.complaintManagementSystem.exception.InvalideEmailException;
import com.modal.complaintManagementSystem.exception.PasswordMismatchException;
import com.modal.complaintManagementSystem.exception.UserNotFoundException;

public interface UserService {

	boolean existsByEmail(String email);

	boolean existsByContactNumber(long contactNumber);

	UserDto validateAndSaveUserDto(UserDto userDto);

	ProfileDto loginUser(String email, String password) throws InvalideEmailException, InvalidPasswordException;

	ProfileDto validateAndUpdateUserProfile(ProfileDto profileDto) throws IOException;

	ProfileDto getUserProfile(int userId);

	ProfileDto changeUserPassword(ChangePasswordDto changePasswordDto) throws PasswordMismatchException,InvalidPasswordException,UserNotFoundException ;
}
