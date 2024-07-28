<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
@charset "UTF-8";

@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

@import
	url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css')
	;

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

body {
	background:
		url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jvx7zNEg1po5CxZXhhnccyJQUgZ9YoI1gA&s')
		no-repeat center center fixed;
	background-size: cover;
}

.container {
	/*   background-color: rgba(255, 255, 255, 0.8); */
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	margin-top: 50px;
}

.validError {
	color: red;
}

.validSuccess {
	color: green;
}

.form-group {
	position: relative;
	margin-bottom: 15px;
}

.form-control-wrapper {
	position: relative;
}

.form-icon {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #6c757d;
}

.form-control {
	padding-left: 40px;
}

.form-check-input:checked {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:disabled {
	opacity: 0.65;
}

.nav-buttons {
	margin-bottom: 20px;
}

.nav-buttons a {
	margin-right: 10px;
}

#sendOtpBtn {
	color: white;
	background-color: #007bff;
}

#registerButton {
	display: block;
	margin: 0 auto;
}

.form-label {
	color: white;
}

.form-check-label {
	color: white;
}
</style>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="text-center mb-4">
					<div class="nav-buttons">
						<a href="HomePage" class="btn btn-secondary"><i class="fas fa-home"></i>
							Home</a> <a href="SignInPage" class="btn btn-secondary"><i
							class="fas fa-sign-in-alt"></i> Sign In</a>
					</div>
					<h2>Sign Up</h2>
				</div>
				<form id="registerForm" onsubmit="registerUser(event)">
					<div class="mb-3 form-group">
						<label for="firstName" class="form-label">First Name</label>
						<div class="form-control-wrapper">
							<i class="fas fa-user form-icon"></i> <input type="text"
								class="form-control" id="firstName" name="firstName"
								onchange="validateFirstName()" required minlength="3"
								maxlength="25">
						</div>
						<span id="errorFirstName" class="validError"></span>
					</div>
					<div class="mb-3 form-group">
						<label for="lastName" class="form-label">Last Name</label>
						<div class="form-control-wrapper">
							<i class="fas fa-user form-icon"></i> <input type="text"
								class="form-control" id="lastName" name="lastName"
								onchange="validateLastName()" required minlength="1"
								maxlength="20">
						</div>
						<span id="errorLastName" class="validError"></span>
					</div>
					<div class="mb-3 form-group">
						<label for="email" class="form-label">Email</label>
						<div class="form-control-wrapper">
							<i class="fas fa-envelope form-icon"></i> <input type="email"
								class="form-control" id="email" name="email"
								onchange="checkEmail()" required>
						</div>
						<button type="button" class="btn" id="sendOtpBtn"
							onclick="sendOtp()" disabled>Send OTP</button>
						<span id="emailError" class="validError"></span> <span
							id="emailSuccess" class="validSuccess"></span>
					</div>
					<div id="otpSection" style="display: none;">
						<div class="mb-3 form-group">
							<label for="otp" class="form-label">Enter OTP</label>
							<div class="form-control-wrapper">
								<i class="fas fa-key form-icon"></i> <input type="text"
									class="form-control" id="otp">
							</div>
							<button type="button" class="btn btn-success" id="validateOtpBtn"
								onclick="validateOTP()">Validate OTP</button>
							<span id="otpError" class="validError"></span>
						</div>
					</div>
					<div class="mb-3 form-group">
						<label for="contactNumber" class="form-label">Contact
							Number</label>
						<div class="form-control-wrapper">
							<i class="fas fa-phone form-icon"></i> <input type="tel"
								class="form-control" id="contactNumber" name="contactNumber"
								onchange="validateContactNumber()" required>
						</div>
						<span id="errorContactNumber" class="validError"></span>
					</div>
					<div class="mb-3 form-group">
						<label for="altContactNumber" class="form-label">Alternate
							Contact Number</label>
						<div class="form-control-wrapper">
							<i class="fas fa-phone-alt form-icon"></i> <input type="tel"
								class="form-control" id="altContactNumber"
								name="alterContactNumber" onchange="validateAltContactNumber()">
						</div>
						<span id="errorAltContactNumber" class="validError"></span>
					</div>
					<div class="mb-3 form-group">
						<label for="address" class="form-label">Address</label>
						<div class="form-control-wrapper">
							<i class="fas fa-address-card form-icon"></i>
							<textarea class="form-control" id="address" name="address"
								required></textarea>
						</div>
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="agreeTerms"
							name="agreement" onchange="validateAgreement()" required>
						<label class="form-check-label" for="agreeTerms">I agree
							to the terms and conditions</label> <span id="errorAgreeTerms"
							class="validError"></span>
					</div>
					<button type="submit" class="btn btn-primary" id="registerButton"
						disabled>Register</button>
				</form>
			</div>
		</div>
	</div>


	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Success</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">User registered successfully.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Error Modal -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel">Errors</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<ul id="errorList"></ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		let isOTPValidated = false; // Add this global variable

		function validateFirstName() {
			var userName = document.getElementById("firstName").value.trim();
			var isValidLength = userName.replace(/\s+/g, '').length >= 3;
			var isValidCharacters = /^[A-Za-z\s]+$/.test(userName);

			if (isValidLength && isValidCharacters) {
				document.getElementById("errorFirstName").innerHTML = "";
			} else {
				document.getElementById("errorFirstName").innerHTML = "Username must be at least 3 alphabetic characters";
			}
			validateForm();
		}

		function validateLastName() {
			var userName = document.getElementById("lastName").value.trim();
			var isValidLength = userName.replace(/\s+/g, '').length >= 1;
			var isValidCharacters = /^[A-Za-z\s]+$/.test(userName);

			if (isValidLength && isValidCharacters) {
				document.getElementById("errorLastName").innerHTML = "";
			} else {
				document.getElementById("errorLastName").innerHTML = "LastName must be at least 1 alphabetic characters";
			}
			validateForm();
		}

		function checkEmail() {
			const emailInput = document.getElementById('email');
			const emailValue = emailInput ? emailInput.value.trim() : '';
			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

			if (emailRegex.test(emailValue)) {
				const xhttp = new XMLHttpRequest();
				xhttp.open("GET",
						"http://localhost:8080/complaintManagementSystem/checkEmailExistence/"
								+ encodeURIComponent(emailValue));
				xhttp.send();

				xhttp.onload = function() {
					if (xhttp.status === 200) {
						const exists = this.responseText === "EmailIDexists";
						if (exists) {
							document.getElementById("emailError").innerHTML = "Email already exists";
							document.getElementById("sendOtpBtn").disabled = true;
							document.getElementById("registerButton").disabled = true;
						} else {
							document.getElementById("emailError").innerHTML = "";
							document.getElementById("sendOtpBtn").disabled = false;
							document.getElementById("registerButton").disabled = true;
						}
					} else {
						console.error('Error fetching email existence:',
								xhttp.status);
					}
					validateForm();
				};
			} else {
				document.getElementById("emailError").innerText = "Please enter a valid email address";
				document.getElementById("sendOtpBtn").disabled = true;
				document.getElementById("registerButton").disabled = true;
			}
			validateForm();
		}

		function sendOtp() {
			const userEmail = document.getElementById('email').value;

			$
					.ajax({
						url : 'http://localhost:8080/complaintManagementSystem/genrateOTPAndSave?email='
								+ userEmail,
						type : 'GET',
						success : function(response) {
							if (response.trim() === 'Exists') {
								document.getElementById('emailError').innerHTML = '';
								document.getElementById('emailSuccess').innerHTML = 'OTP sent to email.';
								document.getElementById('otpSection').style.display = 'block';
								document.getElementById("registerButton").disabled = true;
							} else {
								document.getElementById('emailError').innerHTML = 'OTP is not generated.';
								document.getElementById("registerButton").disabled = true;
							}
							validateForm();
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.error('Error:', textStatus, errorThrown);
						}
					});
		}

		function validateOTP() {
			const otpValue = document.getElementById('otp').value;
			const userEmail = document.getElementById('email').value;

			if (otpValue != null && otpValue != "") {
				$
						.ajax({
							url : 'http://localhost:8080/complaintManagementSystem/validateEmailVerificationOTP',
							type : 'POST',
							data : {
								otp : otpValue,
								email : userEmail
							},
							success : function(response) {
								if (response.trim() === 'valid') {
									document.getElementById('otpError').innerHTML = '';
									document.getElementById('email').disabled = true;
									document.getElementById('sendOtpBtn').disabled = true;
									document.getElementById('otpSection').style.display = 'none';
									document.getElementById('emailSuccess').innerHTML = 'Email verified successfully.';
									isOTPValidated = true; // Set OTP validated state
								} else {
									document.getElementById("registerButton").disabled = true;
									document.getElementById('otpError').innerHTML = 'Invalid OTP.';
									isOTPValidated = false; // Set OTP validated state
								}
								validateForm();
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console
										.error('Error:', textStatus,
												errorThrown);
								isOTPValidated = false; // Set OTP validated state
								validateForm();
							}
						});
			} else {
				document.getElementById('otpError').innerHTML = 'Please enter a valid OTP.';
				isOTPValidated = false; // Set OTP validated state
				validateForm();
			}
		}

		function validateContactNumber() {
			var contactNumber = document.getElementById("contactNumber").value;
			if (/^\d{10}$/.test(contactNumber)) {
				const xhttp = new XMLHttpRequest();
				xhttp.open("GET",
						"http://localhost:8080/complaintManagementSystem/checkContactNumberExistence/"
								+ encodeURIComponent(contactNumber));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "contactNumberexists";
					if (exists) {
						document.getElementById("errorContactNumber").innerHTML = "Contact number already exists";
					} else {
						document.getElementById("errorContactNumber").innerHTML = "";
					}
					validateForm();
				};
			} else {
				document.getElementById("errorContactNumber").innerText = "Contact number should be a valid 10-digit number";
			}
			validateForm();
		}

		function validateAltContactNumber() {
			var number = document.getElementById("contactNumber").value;
			var altNumber = document.getElementById("altContactNumber").value;
			var numberRegex = /^[0-9]{10}$/;

			if (numberRegex.test(altNumber) && number !== altNumber) {
				document.getElementById("errorAltContactNumber").innerHTML = "";
			} else {
				document.getElementById("errorAltContactNumber").innerHTML = "Contact and alternate number cannot be same";
			}
			validateForm();
		}

		function validateAgreement() {
			var agreeTerms = document.getElementById("agreeTerms").checked;
			var errorAgreeTerms = document.getElementById("errorAgreeTerms");

			if (!agreeTerms) {
				errorAgreeTerms.innerHTML = "You must agree to the terms and conditions.";
			} else {
				errorAgreeTerms.innerHTML = "";
			}
			validateForm();
		}

		function validateForm() {
			var isFirstNameValid = document.getElementById("errorFirstName").innerHTML === "";
			var isLastNameValid = document.getElementById("errorLastName").innerHTML === "";
			var isEmailValid = document.getElementById("emailError").innerHTML === "";
			var isContactNumberValid = document
					.getElementById("errorContactNumber").innerHTML === "";
			var isAltContactNumberValid = document
					.getElementById("errorAltContactNumber").innerHTML === "";
			var isAgreementValid = document.getElementById("errorAgreeTerms").innerHTML === "";
			var isFormValid = isFirstNameValid && isLastNameValid
					&& isEmailValid && isContactNumberValid
					&& isAltContactNumberValid && isAgreementValid
					&& isOTPValidated;

			console.log('isFormValid:', isFormValid);

			var registerButton = document.getElementById("registerButton");
			registerButton.disabled = !isFormValid;
			console.log('registerButton.disabled:', registerButton.disabled);
		}

		function registerUser(event) {
			event.preventDefault();

			var firstName = document.getElementById('firstName').value;
			var lastName = document.getElementById('lastName').value;
			var email = document.getElementById('email').value;
			var contactNumber = document.getElementById('contactNumber').value;
			var altContactNumber = document.getElementById('altContactNumber').value;
			var address = document.getElementById('address').value;
			var agreeTerms = document.getElementById('agreeTerms').checked;

			var formData = new FormData();
			formData.append('firstName', firstName);
			formData.append('lastName', lastName);
			formData.append('email', email);
			formData.append('contactNumber', contactNumber);
			formData.append('alterContactNumber', altContactNumber);
			formData.append('address', address);
			formData.append('agreement', agreeTerms);

			$.ajax({
			    url: 'http://localhost:8080/complaintManagementSystem/register',
			    type: 'POST',
			    data: JSON.stringify(formData), // Convert formData to JSON string
			    contentType: 'application/json', // Set content type to JSON
			    success: function(response) {
			        $('#successModal').modal('show'); // Show success modal
			    },
			    error: function(xhr) {
			        $('#errorList').empty();
			        
			        if (xhr.status === 400) { // Check if the status is 400 (Bad Request)
			            var errorMessage = xhr.responseText; // Get the error message from the response
			            $('#errorList').append('<li>' + errorMessage + '</li>'); // Append error message
			            $('#errorModal').modal('show'); // Show error modal
			        } else {
			            $('#errorList').append('<li>An unexpected error occurred. Please try again later.</li>'); // Handle other errors
			            $('#errorModal').modal('show'); // Show error modal
			        }
			    }
			});

		}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
