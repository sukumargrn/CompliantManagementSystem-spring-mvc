<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password Page 🔑</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

body {
	background-image: url("https://media.istockphoto.com/id/1043122528/photo/password-reset-email-interface-update-3d-rendering.jpg?s=612x612&w=0&k=20&c=M7zAw6XXWHNkupLhURkcyPOEviHVy_a9oSXvCuQYUWo=");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Arial', sans-serif;
	opacity: 0.5;
}

.navbar {
	position: absolute;
	top: 20px;
	width: 100%;
	opacity: 0.5;
}

.container {
	opacity: 5; /* Ensure the container is fully visible */
}


.card-body {
	padding: 2rem;
	opacity: 5;
}

button {
	margin-top: 1rem;
}

.form-group {
	margin-bottom: 1rem;
}
</style>
</head>

<body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
						<h3 class="text-center">Reset Password</h3>
					<div class="card-body">
						<form id="reset-password-form">
							<div class="form-group">
								<label for="email">Email Address:</label> 
								<input type="email" class="form-control" id="email" placeholder="Enter your email">
								<small class="form-text text-muted">We'll send you an email with instructions to reset your password.</small>
							</div>
							<button type="submit" class="btn btn-primary">Send Reset Link</button>
						</form>
					</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</html>
