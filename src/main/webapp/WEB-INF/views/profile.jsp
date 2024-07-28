<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User-Profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.sidebar {
	height: 100vh;
	width: 220px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: #343a40;
	padding-top: 20px;
}

.sidebar a {
	padding: 15px 20px;
	text-align: left;
	display: block;
	color: white;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #495057;
}

.content {
	padding: 20px;
	margin-left: 240px; /* Adjusted to accommodate sidebar */
}

.profile-info {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
}

.profile-info .profile-details {
	flex: 2;
}

.profile-info .profile-img {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

.profile-info h3 {
	margin-bottom: 20px;
}

.btn-custom {
	background-color: #007bff;
	color: white;
	border: none;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.profile-name {
	margin-right: 10px; /* Adjust the space between first and last name */
}

.round-image {
	width: 120px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
	border: 2px solid #ccc;
}

.round-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#newPhoto {
	display: none;
	margin-top: 10px;
}

.form-row {
	margin-bottom: 15px;
}

.form-row .form-group {
	margin-bottom: 0;
}

.card {
	background-color: transparent;
	border: 4px solid black;
	border-radius: 10px;
}

.form-group label {
	font-weight: bold;
}

.card-title {
	text-align: center;
	font-weight: bolder;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.sidebar {
		width: 100%; /* Full width on smaller screens */
		position: relative;
		height: auto;
	}
	.content {
		margin-left: 0; /* Adjust to remove margin on smaller screens */
	}
}

.show-password {
	cursor: pointer;
}
</style>

<body>
	<c:set var="profile" value="${profileDto}" />
	<div class="sidebar">
		<div class="text-center">
			<img id="userPhoto" src="display?imagePath=${profile.imagePath}"
				alt="User Image" class="img-fluid rounded-circle"
				style="width: 100px; height: 100px;">
			<h4 id="profileName" class="text-white mt-2">${profile.firstName}</h4>
		</div>
		<a href="#" class="sidebar-link" data-target="viewProfile">View
			Profile</a> <a href="#" class="sidebar-link" data-target="changePassword">Change
			Password</a> <a href="#" class="sidebar-link"
			data-target="lodgeComplaint">Lodge Complaint</a> <a href="#"
			class="sidebar-link" data-target="complaintHistory">Complaint
			History</a> <a href="logout" class="text-danger">Logout</a>
	</div>
	<div class="container mt-5">
		<!-- View Profile Section -->
		<div class="content" id="viewProfile" style="display: none;">
			<div class="profile-info">
				<div class="profile-details">
					<h3>
						<span class="profile-name">${profile.firstName}</span>
						${profile.lastName} Profile
					</h3>
					<div class="form-group">
						<label>Last Updated at:</label> <span>2020-05-08 22:16:22</span>
					</div>
					<form id="userProfileForm" method="post"
						enctype="multipart/form-data">
						<div
							class="d-flex justify-content-center align-items-center flex-column">
							<div class="round-image">
								<img id="profileImage"
									src="display?imagePath=${profile.imagePath}" alt="User Photo">
							</div>
							<div id="uploadSection" style="display: none; margin-top: 20px;">
								<label for="newPhoto" class="btn btn-warning">Upload New
									Photo <input type="file" id="newPhoto" name="imageFile"
									accept="image/*" style="display: none;">
								</label>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="firstName"><i class="fas fa-user"></i> First
									Name</label> <input type="text" class="form-control" id="firstName"
									name="firstName" disabled>
							</div>
							<div class="form-group col-md-6">
								<label for="lastName"><i class="fas fa-user"></i> Last
									Name</label> <input type="text" class="form-control" id="lastName"
									name="lastName" disabled>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="userEmail"><i class="fas fa-envelope"></i>
									User Email</label> <input type="email" class="form-control"
									id="userEmail" name="email" disabled>
							</div>
							<div class="form-group col-md-6">
								<label for="contact"><i class="fas fa-phone"></i>
									Contact</label> <input type="text" class="form-control" id="contact"
									name="contactNumber" disabled>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="alterContact"><i class="fas fa-phone-alt"></i>
									Alternate Contact</label> <input type="text" class="form-control"
									id="alterContact" name="alterContactNumber">
							</div>
							<div class="form-group col-md-6">
								<label for="regDate"><i class="far fa-calendar-alt"></i>
									Reg Date</label> <input type="text" class="form-control" id="regDate"
									name="regDate" disabled>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="address"><i class="fas fa-map-marker-alt"></i>
									Address</label>
								<textarea class="form-control" id="address" name="address"
									rows="3" disabled>${profile.address}</textarea>
							</div>
						</div>
						<button type="button" id="editBtn" class="btn btn-primary">
							<i class="fas fa-edit"></i> Edit
						</button>
						<button type="submit" class="btn btn-success" id="submitBtn"
							style="display: none;">Submit</button>
					</form>
				</div>
			</div>
		</div>
		<!-- Change Password Section -->
		<div id="changePassword" class="content" style="display: none;">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Change Password</h5>
					<form id="changePasswordForm" method="post">
						<div class="form-group mb-4">
							<div class="input-group">
								<input type="password" class="form-control" id="oldPassword"
									placeholder="Enter old Password" required name="oldPassword"
									onblur="validatePassword()">
								<button type="button" class="btn btn-outline-info"
									onclick="togglePasswordVisibility('oldPassword')">
									<i class="bi bi-eye"></i>
								</button>
							</div>
						</div>
						<div class="form-group mb-4">
							<div class="input-group">
								<input type="password" class="form-control" id="newPassword"
									placeholder="Enter New Password" aria-label="Password"
									aria-describedby="showPasswordButton" required>
								<button type="button" class="btn btn-outline-info"
									id="showPasswordButton"
									onclick="togglePasswordVisibility('newPassword')">
									<i class="bi bi-eye"></i>
								</button>
							</div>
							<span id="errorOldPassword" class="error-message"
								style="color: red;"></span> <span id="errorPassword"
								class="error-message" style="color: red;"></span>
						</div>
						<div class="form-group mb-4">
							<div class="input-group">
								<input type="password" class="form-control" id="confirmPassword"
									placeholder="Enter confirmPassword" name="confirmPassword"
									required onblur="validatePassword()">
								<button type="button" class="btn btn-outline-info"
									onclick="togglePasswordVisibility('confirmPassword')">
									<i class="bi bi-eye"></i>
								</button>
							</div>
							<span id="errorConfirmPassword" class="error-message"
								style="color: red;"></span>
						</div>
						<div class="row justify-content-center">
							<div class="col-md-10 text-center">
								<button type="submit" class="btn btn-primary mt-4" id="button"
									disabled>Change Password</button>
							</div>
						</div>
						<span id="message" style="color: red;">${message}</span>
						<div>
							<a href="ResetPasswordPage"
								class="forgot-password-link float-right">Reset Password?</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Success Modal -->
		<div id="changePasswordSuccessModal" class="modal fade" tabindex="-1"
			role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Success</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Password changed successfully!</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Error Modal -->
		<div id="changePasswordErrorModal" class="modal fade" tabindex="-1"
			role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Error</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<ul id="errorList">
							<!-- Error messages will be injected here -->
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<!-- Lodge Complaint Section -->
		<div id="lodgeComplaint" class="content" style="display: none;">
			<h2 class="text-center">Register Complaint</h2>
			<form id="complaintForm">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="category">Department</label> <select
							class="form-control" id="category">
							<option value="">Select Option</option>
							<option value="Cleaning Services">Cleaning Services</option>
							<option value="Mechanical Services">Mechanical Services</option>
							<option value="Plumbing Services">Plumbing Services</option>
							<option value="Electrical Services">Electrical Services</option>
							<option value="Other">Other</option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="Country">Country</label> <select class="form-control"
							id="Country">
							<option value="">Select Option</option>
							<option value="India">India</option>
							<option value="USA">USA</option>
							<option value="Sri Lanka">Sri Lanka</option>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="state">State</label> <select class="form-control"
							id="state">
							<option value="">Select Option</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Bihar">Bihar</option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Telangana">Telangana</option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="city">City</label> <select class="form-control"
							id="city">
							<option value="">Select Option</option>
							<option value="Bengaluru">Bengaluru</option>
							<option value="Other">Other</option>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="area">Area</label> <input type="text"
							class="form-control" id="area"
							placeholder="Enter Nature of Complaint">
					</div>
					<div class="form-group col-md-6">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" placeholder="Enter Address">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="complaintDetails">Complaint Details (max 500
							words)</label>
						<textarea class="form-control" id="complaintDetails" rows="3"></textarea>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="complaintRelatedDoc">Complaint Related Doc (if
							any)</label> <input type="file" class="form-control-file"
							id="complaintRelatedDoc">
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<div id="complaintStatus"></div>
		</div>

		<!-- Complaint History Section -->
		<div id="complaintHistory" class="content" style="display: none;">
			<h3>Complaint History</h3>
			<table class="table">
				<thead>
					<tr>
						<th>Title</th>
						<th>Details</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody id="complaintHistoryTableBody">
					<!-- Complaints will be loaded here via AJAX -->
				</tbody>
			</table>
		</div>
	</div>
	<!--   complete user profile edit update JavaScript and AJAX CODES -->
	<script type="text/javascript">
		document
				.getElementById('editBtn')
				.addEventListener(
						'click',
						function() {
							// Enable all fields except 'regDate' and 'userEmail'
							var inputs = document
									.querySelectorAll('#userProfileForm input:not([id="regDate"], [id="userEmail"]), #userProfileForm textarea');
							for (var i = 0; i < inputs.length; i++) {
								inputs[i].disabled = false;
							}
							// Show the new profile image upload section and submit button
							document.getElementById('uploadSection').style.display = 'block';
							document.getElementById('editBtn').style.display = 'none';
							document.getElementById('submitBtn').style.display = 'block';
						});

		document.getElementById('newPhoto').addEventListener('change',
				function(event) {
					if (event.target.files.length > 0) {
						previewNewPhoto(event);
					}
				});

		function previewNewPhoto(event) {
			var file = event.target.files[0];
			var reader = new FileReader();

			reader.onload = function(e) {
				document.getElementById('profileImage').src = e.target.result; // Update the profile image preview
			};

			reader.readAsDataURL(file);
		}

		document
				.getElementById('userProfileForm')
				.addEventListener(
						'submit',
						function(event) {
							event.preventDefault(); // Prevent default form submission

							var formData = new FormData(this);

							$
									.ajax({
										url : '/complaintManagementSystem/updateProfile', // Adjust URL as needed
										type : 'POST',
										data : formData,
										contentType : false,
										processData : false,
										success : function(response) {
											if (response === 'Profile updated successfully') {
												alert('Profile updated successfully!');
												fetchUpdateUserProfile(); // Function to refresh user profile data
											} else {
												alert('Unexpected response: '
														+ response);
											}
										},
										error : function(xhr, status, error) {
											console.error('Error:', error);
											alert('An error occurred while updating the profile.');
										}
									});
						});
	</script>
	<script type="text/javascript">
		function fetchUpdateUserProfile() {
			$
					.ajax({
						url : '/complaintManagementSystem/getUserProfile', // Ensure this URL matches your controller mapping
						type : 'GET',
						success : function(response) {
							// Assume response contains updated profile data
							var profile = response;
							console.log(profile);

							// Update form fields with profile data
							$('#firstName').val(profile.firstName).prop(
									'disabled', true);
							$('#lastName').val(profile.lastName).prop(
									'disabled', true);
							$('#userEmail').val(profile.email).prop('disabled',
									true);
							$('#contact').val(profile.contactNumber).prop(
									'disabled', true);
							$('#alterContact').val(profile.alterContactNumber)
									.prop('disabled', true);
							$('#address').val(profile.address).prop('disabled',
									true);
							$('#regDate').val(
									profile.createdAt ? profile.createdAt
											: 'N/A').prop('disabled', true);

							// Update profile image and text
							$('#userPhoto').attr('src',
									'display?imagePath=' + profile.imagePath);
							$('#profileName').text(profile.firstName);
							$('#profileName').text(profile.firstName);
							// Hide upload section and show the edit button
							document.getElementById('uploadSection').style.display = 'none';
							document.getElementById('editBtn').style.display = 'block';
							document.getElementById('submitBtn').style.display = 'none';
						},
						error : function(xhr, status, error) {
							console
									.error('Error fetching user profile:',
											error);
						}
					});
		}
	</script>



	<!--   complete user profile side bar code edit update JavaScript and AJAX CODES -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// Handle sidebar link clicks
							$('.sidebar-link').click(function(event) {
								event.preventDefault();
								var targetId = $(this).data('target');

								// Hide all content sections
								$('.content').hide();

								// Show the selected section
								$('#' + targetId).show();

								// Fetch user profile data if the "View Profile" tab is clicked
								if (targetId === 'viewProfile') {
									fetchUserProfile();
								}
							});

							// Fetch user profile data from the server
							function fetchUserProfile() {
								$
										.ajax({
											url : 'http://localhost:8080/complaintManagementSystem/getUserProfile', // Ensure this URL matches your controller mapping
											type : 'GET',
											dataType : 'json',
											success : function(response) {
												if (response) {
													console.log(response);
													var profile = response;
													$('#firstName').val(
															profile.firstName)
															.prop('disabled',
																	true);
													$('#lastName').val(
															profile.lastName)
															.prop('disabled',
																	true);
													$('#userEmail').val(
															profile.email)
															.prop('disabled',
																	true);
													$('#contact')
															.val(
																	profile.contactNumber)
															.prop('disabled',
																	true);
													$('#alterContact')
															.val(
																	profile.alterContactNumber)
															.prop('disabled',
																	true);
													$('#address').val(
															profile.address)
															.prop('disabled',
																	true);
													$('#regDate')
															.val(
																	profile.createdAt ? profile.createdAt
																			: 'N/A')
															.prop('disabled',
																	true);

													// Update user photo
													$('#userPhoto')
															.attr(
																	'src',
																	'display?imagePath='
																			+ profile.imagePath);
												} else {
													alert('Profile data not available.');
												}
											},
											error : function(xhr) {
												alert('Error fetching profile data: '
														+ xhr.responseText);
											}
										});
							}
					        //
					        
					        $('#changePasswordForm').submit(function(event) {
    event.preventDefault(); // Prevent the default form submission

    var oldPassword = $('#oldPassword').val();
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();

    var formData = {
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword
    };

    $.ajax({
        url: '/complaintManagementSystem/changePassword', // Use a relative URL if possible
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            $('#changePasswordSuccessModal').modal('show');
            setTimeout(function() {
                $('#changePasswordSuccessModal').modal('hide');
                $('#oldPassword').val('');
                $('#newPassword').val('');
                $('#confirmPassword').val('');
            }, 3000);
        },
        error: function(xhr) {
            $('#errorList').empty();
            if (xhr.status === 400) {
                var errorMessage = xhr.responseText;
                $('#errorList').append('<li>' + errorMessage + '</li>');
            } else {
                $('#errorList').append('<li>An unexpected error occurred. Please try again later.</li>');
            }
            $('#changePasswordErrorModal').modal('show');
        }
    });
});



					

							// Handle complaint form submission
							$('#complaintForm')
									.submit(
											function(event) {
												event.preventDefault();
												var title = $('#complaintTitle')
														.val();
												var details = $(
														'#complaintDetails')
														.val();

												$
														.ajax({
															url : '/lodge-complaint', // Your server endpoint for lodging complaints
															type : 'POST',
															data : {
																title : title,
																details : details
															},
															success : function(
																	response) {
																$(
																		'#complaintStatus')
																		.text(
																				'Complaint lodged successfully!');
																$('#complaintForm')[0]
																		.reset();
															},
															error : function(
																	xhr) {
																$(
																		'#complaintStatus')
																		.text(
																				'Error lodging complaint: '
																						+ xhr.responseText);
															}
														});
											});

							// Load complaint history
							function loadComplaintHistory() {
								$
										.ajax({
											url : '/complaint-history', // Your server endpoint for fetching complaint history
											type : 'GET',
											success : function(response) {
												var tbody = $('#complaintHistoryTableBody');
												tbody.empty();
												response.complaints
														.forEach(function(
																complaint) {
															tbody
																	.append('<tr><td>'
																			+ complaint.title
																			+ '</td><td>'
																			+ complaint.details
																			+ '</td><td>'
																			+ complaint.status
																			+ '</td></tr>');
														});
											},
											error : function(xhr) {
												alert('Error loading complaint history: '
														+ xhr.responseText);
											}
										});
							}

							// Load complaint history when the tab is shown
							$('#complaintHistory').on('show.bs.tab',
									function() {
										loadComplaintHistory();
									});
						});
	</script>
	<script>
		function togglePasswordVisibility(fieldId) {
			var passwordField = document.getElementById(fieldId);
			var buttonIcon = passwordField.nextElementSibling
					.querySelector('i');

			if (passwordField.type === 'password') {
				passwordField.type = 'text';
				buttonIcon.classList.remove('bi-eye');
				buttonIcon.classList.add('bi-eye-slash');
			} else {
				passwordField.type = 'password';
				buttonIcon.classList.remove('bi-eye-slash');
				buttonIcon.classList.add('bi-eye');
			}
		}
		function validatePassword() {
			var oldPassword = document.getElementById("oldPassword").value;
			var newPassword = document.getElementById("newPassword").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$/;

			if (oldPassword !== newPassword && passwordRegex.test(newPassword)
					&& newPassword === confirmPassword) {
				document.getElementById("errorPassword").innerHTML = "";
				document.getElementById("errorConfirmPassword").innerHTML = "";
				document.getElementById("errorOldPassword").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				if (oldPassword === newPassword) {
					document.getElementById("errorOldPassword").innerHTML = "New password should be different from old password";
				} else {
					document.getElementById("errorOldPassword").innerHTML = "";
				}
				if (!passwordRegex.test(newPassword)) {
					document.getElementById("errorPassword").innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorPassword").innerHTML = "";
				}

				if (newPassword !== confirmPassword) {
					document.getElementById("errorConfirmPassword").innerHTML = "Passwords do not match";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorConfirmPassword").innerHTML = "";
				}
			}
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
</body>
</html>
