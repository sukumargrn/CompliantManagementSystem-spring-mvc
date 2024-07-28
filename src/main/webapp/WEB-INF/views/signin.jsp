<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqk1w2/knoG80k332eYXxDF2qmVANxcZs3lXdsQzMcczYhSFxFk7hJ/gFgh/rHRMu8h+i+Y78wV1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

body {
	background-image:
		url("https://t3.ftcdn.net/jpg/01/22/48/86/360_F_122488650_kaOfP8UdoTPZtRrlCcsIR1lDoq2OrQZS.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Arial', sans-serif;
}

.container-fluid {
	width: 100%;
	max-width: 400px;
}

.form-group label {
	font-weight: bold;
}

.form-check-input {
	margin-left: 0;
}

.validError {
	color: red;
}

.validSuccess {
	color: green;
}
</style>
<body>
	<div
		class="container-fluid h-100 d-flex flex-column align-items-center justify-content-center">
		<div class="bg-light p-5 rounded shadow-lg">
			<h1 class="text-center mb-4">Sign In</h1>
			<form action="login" method="POST">
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="Enter password">
				</div>
				<div class="form-check mb-3">
					<input type="checkbox" class="form-check-input" id="showPassword">
					<label class="form-check-label" for="showPassword"> Show
						Password</label>
				</div>
				<button type="submit" class="btn btn-primary btn-block">Sign
					In</button>
				<div class="mt-3 text-center">
					<a href="ResetPasswordPage" class="text-decoration-none">Forgot
						Password?</a>
				</div>
				<div class="mt-3 text-center">
					<span class="text-muted">Don't have an account?</span> <a
						href="SignUpPage" class="text-decoration-none">Create here</a>
					<c:if test="${not empty error}">
						<div style="color: red;">${error}</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<script>
  const showPasswordCheckbox = document.getElementById('showPassword');
  const passwordInput = document.getElementById('password');

  showPasswordCheckbox.addEventListener('change', () => {
    if (showPasswordCheckbox.checked) {
      passwordInput.type = 'text';
    } else {
      passwordInput.type = 'password';
    }
  });
</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
