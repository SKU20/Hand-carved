<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    background-image: linear-gradient(to bottom right, #FD8451, #FFBD6F);
	font-family: "Roboto", Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: black; 
}
.container {
	width: 400px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
	padding: 30px;
}
.logo {
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 20px;
	color: black;
}
.form-group {
	margin-bottom: 20px;
}
.form-group label {
	display: block;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
}
.form-group input {
	width: 95%;
	height: 40px;
	padding: 8px;
	font-size: 16px;
	border: 1px solid black;
	border-radius: 5px;
}
.password-input-container {
    position: relative;
}

.password-input-container input {
    width: 95%;
    height: 40px;
    padding: 8px;
    font-size: 16px;
    border: 1px solid black;
    border-radius: 5px;
}

.password-input-container a {
    position: absolute;
    top: 50%; 
    right: 5px;
    transform: translateY(-50%); 
    color: black;
    text-decoration: none;
}

.password-input-container a i {
    font-size: 18px;
}
.password-input-container input[type="password"]:focus + a:before {
    
    font-weight: 900;
    font-size: 18px;
}
.form-group input:focus {
	outline: none;
	border-color: grey;
}
.forgot-password {
	display: block;
	text-align: right;
	font-size: 14px;
	color: black;
	text-decoration: none;
	width:120px;
}
.forgot-password:hover {
	text-decoration: underline;
}
.login-button {
    margin:0;
	width: 100%;
	height: 40px;
	background-color: #ccc;
	color: black; 
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.2s;
	margin-top:20px;
	
}
.login-button:hover {
	background-color: lightgrey; 
}
.social-icons {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}
.social-icon {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	width: 40px;
	height: 40px;
	background-color: black;
	border-radius: 50%;
	margin: 0 5px;
	color: #fff;
	cursor: pointer;
	transition: 0.2s;
}
.social-icon:hover {
	background-color: lightgrey;
}
.signup{
   margin-left:80px;
   margin-top:15px;
}
.signup a{
   color:black;
   margin-left:5px;
}
.signup a:hover{
   color:lightgrey;
   text-decoration:none;
}

</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hand-carved</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/371026b39a.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<div class="logo">Hand-carved</div>
	<form action="login" method="post">
		<div class="form-group">
			<input type="email" name="Email" id="Email" placeholder="Enter your email" required>
		</div>
		<div class="form-group">
    <div class="password-input-container">
        <input type="password" name="Password" placeholder="Enter your password" id="Password" required>
        <a href="#" onclick="togglePasswordVisibility()"><i class="fa-sharp fa-solid fa-eye-slash"></i></a>
    </div>
</div>
		<a href="forgotPassword.jsp" class="forgot-password">Forgot password?</a>
		<button type="submit" class="login-button">Log in</button>
		<div style="margin-top:10px;">
		<label style="color:red;font-size:15px;margin-left:110px;">${erro}</label>
		</div>
		<div class="social-icons">
			<div class="social-icon">
				<i class="fa-brands fa-facebook"></i>
			</div>
		</div>
		<div class="signup">
		<label>Don't have an account?</label><a href="signup.jsp">Sign up</a>
		</div>
	</form>
</div>
<script src="index.js"></script>
</body>
<!-- Add this script tag before the closing </body> tag in your HTML -->
<script>
function togglePasswordVisibility() {
  var passwordInput = document.getElementById("Password");
  var eyeIcon = document.querySelector(".password-input-container a i");

  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    eyeIcon.classList.remove("fa-eye-slash");
    eyeIcon.classList.add("fa-eye");
  } else {
    passwordInput.type = "password";
    eyeIcon.classList.remove("fa-eye");
    eyeIcon.classList.add("fa-eye-slash");
  }
}
var name = "${sessionScope.name}";

// Use the "history.pushState()" method to change the browser's history

</script>
</html>
