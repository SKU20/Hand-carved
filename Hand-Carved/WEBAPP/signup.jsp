<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hand-carved</title>
    <link rel="stylesheet" href="signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Julee&family=Pacifico&family=Russo+One&family=Satisfy&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/371026b39a.js" crossorigin="anonymous"></script>
    <style>
    
body{
    background-image: linear-gradient(to bottom right, #FD8451, #FFBD6F);
    background-repeat: no-repeat;
    position: fixed;
    background-attachment: fixed;
    background-position: center;
    background-size: cover;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-family: "Roboto", Arial, sans-serif;
    color: black;
}

.container {
    position: fixed;
    left: 35%;
    width: 400px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
    padding: 30px;
    height: 85%;
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
    width: 100%;
    height: 20px;
    padding: 8px;
    font-size: 16px;
    border: 1px solid black;
    border-radius: 5px;
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
}

.forgot-password:hover {
    text-decoration: underline;
}

.login-button {
    width: 100%;
    height: 40px;
    background-color: #ccc;
    color: black;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.2s;
}

.login-button:hover {
    background-color: lightgray;
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
#login:hover{
    color:lightgrey;
    text-decoration:none;
}
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">Hand-carved</div>
        <form action="signup" method="get">
            <div class="form-group">
                <input type="text" name="name" placeholder="First name" required>
            </div>
            <div class="form-group">
                <input type="text" name="lastname" placeholder="Last name" required>
            </div>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <input type="text" name="phone" placeholder="Phone" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <input type="password" name="repassword" placeholder="Repeat password" required>
            </div>
            <div class="form-group">
                <input type="date" name="date" required>
            </div>
            <button type="submit" class="login-button">Sign up</button>
            <div class="social-icons">
                <div class="social-icon">
                    <i class="fa-brands fa-facebook"></i>
                </div>
            </div>
            <div style="color: red; text-align: center; margin-top: 10px;">${Rerror}</div>
            <div style="color: green; text-align: center; margin-top: 10px;">${pass}</div>
            <div style="text-align: center; margin-top: 20px;">
                Already have an account? <a href="index.jsp" id="login"style="color: black; text-decoration: underline;">Log in</a>
            </div>
        </form>
    </div>
</body>
</html>
